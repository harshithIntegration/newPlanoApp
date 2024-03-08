package com.mobile_app.plano.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.mobile_app.plano.dto.user;
import com.mobile_app.plano.service.commonService;

import jakarta.servlet.http.HttpSession;

@Component
@RestController
public class commonController {
	@Autowired
	commonService commonService;
	
	 @PostMapping("/userLogin")
	    public ResponseEntity<Object> userLogin(@RequestBody user u, HttpSession httpSession) {
	        Object responseData = commonService.userLogin(u, httpSession);
	        return new ResponseEntity<>(responseData, HttpStatus.OK);
	    }

	    @PostMapping("/userSignUp")
	    public ResponseEntity<String> userSignUp(@RequestBody user u, HttpSession httpSession) {
	        String responseString = commonService.userSignUp(u, httpSession);
	        return new ResponseEntity<>(responseString, HttpStatus.OK);
	    }

	    @PostMapping("/userDetails")
	    public ResponseEntity<List<user>> userDetails() {
	        List<user> userList = commonService.userDetails();
	        return new ResponseEntity<>(userList, HttpStatus.OK);
	    }

	    @PostMapping("/userEditProfile")
	    public ResponseEntity<user> userEditProfile(@RequestBody user u, HttpSession httpSession) {
	        user updatedUser = commonService.userEditProfile(u, httpSession);
	        return new ResponseEntity<>(updatedUser, HttpStatus.OK);
	    }

	    @GetMapping("/userLogout")
	    public ResponseEntity<String> userLogout(HttpSession httpSession) {
	        httpSession.invalidate();
	        return new ResponseEntity<>("Logout", HttpStatus.OK);
	    }
}
