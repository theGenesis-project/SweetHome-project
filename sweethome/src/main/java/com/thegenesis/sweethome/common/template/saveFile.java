package com.thegenesis.sweethome.common.template;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class saveFile {
	
	public static String saveFilePolicy(MultipartFile upfile, HttpSession session) {
		// 파일명 수정 작업 후 서버에 업로드 시키기(시간 + 랜덤5자리 숫자 + 확장자명)
		String originName = upfile.getOriginalFilename();
							
		// 연월일시분초
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		// 5자리 랜덤값
		int ranNum = (int)(Math.random() * 90000 + 10000);
		// 확장자
		String ext = originName.substring(originName.lastIndexOf("."));
					
		String changeName = currentTime + ranNum + ext;
					
		// 업로드 시키고자 하는 파일의 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/"); 
					
		try { // 새로운 파일 업로드
			upfile.transferTo(new File(savePath + changeName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 수정명 반환하기
		return changeName;
	}

}
