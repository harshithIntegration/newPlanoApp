package com.mobile_app.plano.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mobile_app.plano.dto.user;
import com.mobile_app.plano.repository.userRepository;

@Component
public class commonDao {
	@Autowired
	userRepository userRepository;
	
	public String userSignUp(user u) {
		userRepository.save(u);
		return "Added";
	}

	public List<user> userDetails() {
		return userRepository.findAll();
	}

	public List<user> findUserByEmail(String userEmail) {
		return userRepository.findByUserEmail(userEmail);
	}

	public user findByUserId(int userId) {
		return  userRepository.findById(userId).get();
	}

	public user saveUserEditProfile(user userEdit) {
		return userRepository.save(userEdit);
	}
}
