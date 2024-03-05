package com.mobile_app.plano.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
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
	public Object userLogin(@RequestBody user u,HttpSession httpSession) {
		return commonService.userLogin(u,httpSession);
	}
	@PostMapping("/userSignUp")
	public String userSignUp(@RequestBody user u,HttpSession httpSession) {
		return commonService.userSignUp(u, httpSession);
	}
	@PostMapping("/userDetails")
	public List<user> userDetails(){
		return commonService.userDetails();
	}
	@PostMapping("/userEditProfile")
	public user userEditProfile(@RequestBody user u,HttpSession httpSession){
		System.out.println(u);
		return commonService.userEditProfile(u,httpSession);
	}
	@GetMapping("/userLogout")
	public String userLogout(HttpSession httpSession) {
		httpSession.invalidate();
		return "Logout";
	}
}
