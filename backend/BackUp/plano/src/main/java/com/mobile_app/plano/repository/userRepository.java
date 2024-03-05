package com.mobile_app.plano.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import com.mobile_app.plano.dto.user;
@Component
public interface userRepository extends JpaRepository<user, Integer>{

	List<user> findByUserEmail(String userEmail);

}
