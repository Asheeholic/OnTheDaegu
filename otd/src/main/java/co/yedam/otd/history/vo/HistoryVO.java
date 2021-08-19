package co.yedam.otd.history.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

public class HistoryVO {
	private int num;

	private String email;

	private String ticketNo;

	private Date historyDate;

	private String ticketCode;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTicketNo() {
		return ticketNo;
	}

	public void setTicketNo(String ticketNo) {
		this.ticketNo = ticketNo;
	}

	public Date getHistoryDate() {
		return historyDate;
	}

	public void setHistoryDate(Date historyDate) {
		this.historyDate = historyDate;
	}

	public String getTicketCode() {
		return ticketCode;
	}

	public void setTicketCode(String ticketCode) {
		this.ticketCode = ticketCode;
	}

	@Override
	public String toString() {
		return "HistoryVO [num=" + num + ", email=" + email + ", ticketNo=" + ticketNo + ", historyDate=" + historyDate
				+ ", ticketCode=" + ticketCode + "]";
	}

}
