package com.commuin.persistence;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.commuin.vo.Report;

@Repository
public class ReportDaoImpl implements ReportDao {
	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public int selectCheck(Report report) {
	return mybatis.selectOne("report.selectCheck", report);	
	}
	@Override
	public int insertRerport(Report report) {
		return mybatis.insert("report.insertReport", report);
	}
	@Override
	public int updateReportCount(Report report) {
		return mybatis.update("report.updateReportCount",report);
	}
}
