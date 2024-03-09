package com.mobile_app.plano.dto;

import org.springframework.stereotype.Component;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Component
@Data
@Entity

public class user {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userId;
	private String userName;
	private String userEmail;
	private String userCountry;
	private String userState;
	private String userCity;
	private String userPassword;
	private long userMobile;
	private String userGender;
	private String userPosition;
	private String userDepartment;
	private String userSubDepartment;
	private String userAddress;
	private String userPhotoLink;
	private boolean userStatus;
}
