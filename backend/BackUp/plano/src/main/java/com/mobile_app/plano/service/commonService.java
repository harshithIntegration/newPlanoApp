package com.mobile_app.plano.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mobile_app.plano.dao.commonDao;
import com.mobile_app.plano.dto.user;

import jakarta.servlet.http.HttpSession;

@Component
public class commonService {
	@Autowired
	commonDao commonDao;
	
	public String userSignUp(user u, HttpSession httpSession) {
		List<user> exUser=commonDao.findUserByEmail(u.getUserEmail());
		if(!exUser.isEmpty()) {
			return "Account allready exists";
		}else {
			commonDao.userSignUp(u);
			return "New account";
		}
	}

	public List<user> userDetails() {
		return commonDao.userDetails();
	}

	public Object userLogin(user u, HttpSession httpSession) {
	    if ("admin".equals(u.getUserEmail()) && "admin".equals(u.getUserPassword())) {
	        return "admin";
	    } else {
	        List<user> exUser = commonDao.findUserByEmail(u.getUserEmail());
	        if (exUser.isEmpty()) {
	            return "Invalid email";
	        } else {
	            Optional<user> matchingUser = exUser.stream()
	                    .filter(user -> user.getUserPassword().equals(u.getUserPassword()))
	                    .findFirst();

	            if (matchingUser.isPresent()) {
	                return matchingUser.get();
	            } else {
	                return "Invalid password";
	            }
	        }
	    }
	}


	public user userEditProfile(user u, HttpSession httpSession) {
		user userEdit=commonDao.findByUserId(u.getUserId());
		if(u.getUserName()!=null) {
		userEdit.setUserName(u.getUserName());
		}
		if(u.getUserEmail()!=null) {
		userEdit.setUserEmail(u.getUserEmail());
		}
		if(u.getUserMobile()!=0) {
		userEdit.setUserMobile(u.getUserMobile());
		}
		if(u.getUserGender()!=null) {
		userEdit.setUserGender(u.getUserGender());
		}
		if(u.getUserAddress()!=null) {
		userEdit.setUserAddress(u.getUserAddress());
		}
		return commonDao.saveUserEditProfile(userEdit);
	}
}
