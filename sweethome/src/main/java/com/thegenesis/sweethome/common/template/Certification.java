package com.thegenesis.sweethome.common.template;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class Certification {

	private static JavaMailSender sender;
	
	@Autowired
	private Certification(JavaMailSender sender) {
		this.sender = sender;
	}

	// 6자리 난수 생성
	public static int setCertNum() {
		return (int)((Math.random() * (1000000 -  100000) + 1));
	}
	
	// 메일 발송 로직
	public static void sendMessage(String email, String subject, String text) throws MessagingException {
		
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		
		helper.setTo(email);
		helper.setSubject(subject);
		helper.setText(text, true);
		
		sender.send(message);
	}
}
