package com.mobile_app.plano.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mobile_app.plano.service.userService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/user")
public class userController {
	@Autowired
	userService userService;
	
	@PostMapping("/findByUserId/{Id}")
	public ResponseEntity<Object> findByUserId(@PathVariable int Id,HttpSession httpSession){
		ResponseEntity<Object> responseEntity=userService.findByUserId(Id, httpSession);
		return responseEntity;
	}
}
