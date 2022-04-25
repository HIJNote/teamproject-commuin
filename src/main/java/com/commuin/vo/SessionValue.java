package com.commuin.vo;

import java.sql.Date;

public class SessionValue {
	private String sessionId;
	private String sessionName;
	private int sessionPoint;
	private int sessionLevel;
	private Date sessionJoindate;
	private String sessionEmail;
	
	
	
	public Date getSessionJoindate() {
		return sessionJoindate;
	}
	public void setSessionJoindate(Date sessionJoindate) {
		this.sessionJoindate = sessionJoindate;
	}
	public String getSessionEmail() {
		return sessionEmail;
	}
	public void setSessionEmail(String sessionEmail) {
		this.sessionEmail = sessionEmail;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public String getSessionName() {
		return sessionName;
	}
	public void setSessionName(String sessionName) {
		this.sessionName = sessionName;
	}
	public int getSessionPoint() {
		return sessionPoint;
	}
	public void setSessionPoint(int sessionPoint) {
		this.sessionPoint = sessionPoint;
	}
	public int getSessionLevel() {
		return sessionLevel;
	}
	public void setSessionLevel(int sessionLevel) {
		this.sessionLevel = sessionLevel;
	}
	@Override
	public String toString() {
		return "SessionInfo [sessionId=" + sessionId + ", sessionName=" + sessionName + ", sessionPoint=" + sessionPoint
				+ ", sessionLevel=" + sessionLevel + "]";
	}
	
}
