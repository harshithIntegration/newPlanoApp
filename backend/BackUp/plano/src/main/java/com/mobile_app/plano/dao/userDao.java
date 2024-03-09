package com.mobile_app.plano.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mobile_app.plano.dto.user;
import com.mobile_app.plano.repository.userRepository;

@Component
public class userDao {
	@Autowired
	userRepository userRepository;
	
	public user findById(int Id) {
		return (user)userRepository.findById(Id).get();
	}
}
