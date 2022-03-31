package com.thegenesis.sweethome.community.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class Reply {
	private int replyNo;
	private int boardNo;
	private int userNo;
	private String replyContent;
	private Date createDate;
	private Date modifyDate;
	private String status;
	private int rereply;
	private String report;
	private String boardTitle;
	
	private int rowNo;
	private String userId;
}
