package com.commuin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.commuin.persistence.ReportDao;
import com.commuin.vo.Report;
import com.commuin.vo.User;

@Service
public class ReportServiceImpl implements ReportService {
	@Autowired
	ReportDao reportDao;
	@Override
	public int checkReport(Report report) {
		return reportDao.selectCheck(report);
	}
	@Override
	public int addReport(User user,Report report) {
		report.setU_id(user.getU_id());
		report.setU_name(user.getU_name());
		if(checkReport(report)==0)
			if(reportDao.insertRerport(report)==1)
				return changeReport(report);
		return 0;
	}
	@Override
	public int changeReport(Report report) {
		return reportDao.updateReportCount(report);
	}
}
