package com.thegenesis.sweethome.ask.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Ask {
	private int askNo;
	private int userNo;
	private String askTitle;
	private String askDate;
	private String askContent;
	private String commentDate;
	private String askComment;
}
