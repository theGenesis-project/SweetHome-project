package com.thegenesis.sweethome.common.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class MoreVO {
	private int callLength; // 현재 페이지에 띄워진 게시물 수
	private int limit; // 추가로 보여줄 게시글 수
}
