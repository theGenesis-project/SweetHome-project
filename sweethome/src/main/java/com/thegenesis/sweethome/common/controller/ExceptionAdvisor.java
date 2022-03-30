package com.thegenesis.sweethome.common.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionAdvisor {
	
	private Logger logger = LoggerFactory.getLogger(ExceptionAdvisor.class);
	
	@ExceptionHandler(Exception.class)
	public String handleException(Exception ex, HttpSession session) {
		logger.error("Exception 발생: {}", ex.getMessage());
		session.setAttribute("errorMsg", "잠시 후 다시 시도해주세요.");
		return "redirect:/";
	}

}
