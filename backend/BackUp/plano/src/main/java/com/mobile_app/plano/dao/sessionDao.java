package com.mobile_app.plano.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mobile_app.plano.dto.session;
import com.mobile_app.plano.dto.user;
import com.mobile_app.plano.repository.sessionRepository;
@Component
public class sessionDao {
@Autowired
sessionRepository sessionRepository;

	public String addSession(session s) {
		sessionRepository.save(s);
		return "Added";
	}
	
	public List<session> fetchAllSession() {
		return sessionRepository.findAll();
	}
}
