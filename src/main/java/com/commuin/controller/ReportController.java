package com.commuin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.commuin.service.ReportService;
import com.commuin.vo.Report;
import com.commuin.vo.SessionValue;
import com.commuin.vo.User;

@RestController
@RequestMapping("/report")
public class ReportController {
	@Autowired
	ReportService reportService;
	
	@PostMapping
	public int reportCheck(@SessionAttribute SessionValue sessionValue,User user,Report report) {
		if(sessionValue==null)
			return 2;
		user.setU_id(sessionValue.getSessionId());
		user.setU_name(sessionValue.getSessionName());
		return reportService.addReport(user,report);
	}
}
