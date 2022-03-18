package com.thegenesis.sweethome.community.model.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class Category {
	private int categoryNo;//	CATEGORY_NO	NUMBER
	private String categoryName;//	CATEGORY_NAME	VARCHAR2(100 BYTE)

}
