package com.commuin.persistence;

import com.commuin.vo.Report;

public interface ReportDao {

	int selectCheck(Report report);

	int insertRerport(Report report);

	int updateReportCount(Report report);

}