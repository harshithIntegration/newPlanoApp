package com.mobile_app.plano.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mobile_app.plano.dto.session;
import com.mobile_app.plano.dto.user;
import com.mobile_app.plano.service.adminService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/admin")
public class adminController {
	@Autowired
	adminService adminService;
	
	@PostMapping("/addUser")
    public ResponseEntity<String> addUser(@RequestBody user u, HttpSession httpSession) {
        ResponseEntity<String> responseEntity = adminService.addUser(u, httpSession);
        return responseEntity;
    }
	
	@PostMapping("/addSession")
	public ResponseEntity<String> addSession(@RequestBody session s,HttpSession httpSession){
        String responseEntity = adminService.addSession(s, httpSession);
		return new ResponseEntity<String>(responseEntity,HttpStatus.OK);

	}
}
