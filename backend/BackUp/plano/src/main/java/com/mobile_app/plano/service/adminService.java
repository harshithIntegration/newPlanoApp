package com.mobile_app.plano.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import com.mobile_app.plano.dao.commonDao;
import com.mobile_app.plano.dao.sessionDao;
import com.mobile_app.plano.dto.session;
import com.mobile_app.plano.dto.user;

import jakarta.servlet.http.HttpSession;

@Component
public class adminService {
	
	@Autowired
	commonDao commonDao;
	@Autowired
	sessionDao sessionDao;
	
	public ResponseEntity<String> addUser(user u, HttpSession httpSession) {
        List<user> exUser = commonDao.findUserByEmail(u.getUserEmail());

        if (!exUser.isEmpty()) {
            return new ResponseEntity<>("Account already exists", HttpStatus.CONFLICT);
        } else {
            commonDao.userSignUp(u);
            return new ResponseEntity<>("New account", HttpStatus.OK);
        }
    }

	public String addSession(session s, HttpSession httpSession) {
		return sessionDao.addSession(s);
	}
	
	public List<session> fetchAllSession() {
		return sessionDao.fetchAllSession();
	}
}
