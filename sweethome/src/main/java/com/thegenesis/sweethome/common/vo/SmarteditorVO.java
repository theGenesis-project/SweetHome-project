package com.thegenesis.sweethome.common.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class SmarteditorVO {
	private MultipartFile filedata;
	private String callback;
	private String callback_func;
}
