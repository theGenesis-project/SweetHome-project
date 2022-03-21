package com.thegenesis.sweethome.common.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Report {
	private int reportNo;//	REPORT_NO	NUMBER
	private int boardNo;//	BOARD_NO	NUMBER
	private int houseNo;//	HOUSE_NO	NUMBER
	private int replyNo;//	REPLY_NO	NUMBER
	private int reportCate;//	REPORT_CATE	NUMBER
	private String reportContent;//	REPORT_CONTENT	VARCHAR2(300 BYTE)

}
