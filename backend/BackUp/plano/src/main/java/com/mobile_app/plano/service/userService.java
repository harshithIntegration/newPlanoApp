package com.mobile_app.plano.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import com.mobile_app.plano.dao.userDao;

import jakarta.servlet.http.HttpSession;

@Component
public class userService {
	@Autowired
	userDao userDao;
	
	public ResponseEntity<Object> findByUserId(int Id,HttpSession httpSession) {
		if(userDao.findById(Id)==null) {
			return new ResponseEntity<Object>("Invalid user id", HttpStatus.CONFLICT);
		}else {
			return new ResponseEntity<Object>(userDao.findById(Id), HttpStatus.OK);
		}
	}
	
}
