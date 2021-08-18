package co.yedam.otd.payment.vo;

import java.sql.Date;

public class HistoryVO {
	private int num;
	private String email;
	private String ticket_no;
	private Date history_date;
	private String ticket_code;

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

	public String getTicket_no() {
		return ticket_no;
	}

	public void setTicket_no(String ticket_no) {
		this.ticket_no = ticket_no;
	}

	public Date getHistory_date() {
		return history_date;
	}

	public void setHistory_date(Date history_date) {
		this.history_date = history_date;
	}

	public String getTicket_code() {
		return ticket_code;
	}

	public void setTicket_code(String ticket_code) {
		this.ticket_code = ticket_code;
	}
}
