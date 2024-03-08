package com.mobile_app.plano.dto;

import org.springframework.stereotype.Component;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Component
@Entity
@Data
public class session {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int sessionNumber;
	private String sessionSpeaker;
	private String sessionDate;
	private String sessionTitle;
	private String sessionSpeakerTime;
	private String sessionSpeakerDescription;
}
