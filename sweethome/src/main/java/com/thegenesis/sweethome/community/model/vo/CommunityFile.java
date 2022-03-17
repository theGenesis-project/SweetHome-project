package com.thegenesis.sweethome.community.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class CommunityFile {
	private int fileNo;//	FILE_NO	NUMBER
	private int boardNo;//	BOARD_NO	NUMBER
	private String originName;//	ORIGIN_NAME	VARCHAR2(1000 BYTE)
	private String changeName;//	CHANGE_NAME	VARCHAR2(1000 BYTE)
	private String filePath;//	FILE_PATH	VARCHAR2(4000 BYTE)
	private int fileLevel;//	FILE_LEVEL	NUMBER

}
