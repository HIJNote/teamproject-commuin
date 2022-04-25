package com.commuin.service;

import com.commuin.vo.Report;
import com.commuin.vo.User;

public interface ReportService {

	int checkReport(Report report);

	int addReport(User user,Report report);

	int changeReport(Report report);

}