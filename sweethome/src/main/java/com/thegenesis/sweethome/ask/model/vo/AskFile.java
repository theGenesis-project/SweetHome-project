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
public class AskFile {
	private int fileNo;
	private int askNo;
	private String originName;
	private String changeName;
	private String filePath;
}
