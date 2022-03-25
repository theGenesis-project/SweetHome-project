package com.thegenesis.sweethome.chat.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Chat {
	int roomNo;
	String roomName;
	int userNo;
	int messageNo;
	String message;
	Date sendTime;
	
	String formatDate;
	String formatTime;
}
