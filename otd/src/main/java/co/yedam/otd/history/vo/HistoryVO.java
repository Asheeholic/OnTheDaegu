package co.yedam.otd.history.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HistoryVO {
	private int num;
	
	private String email;
	
	private int ticketNo;
	
	private Date historyDate;
	
	private String ticketCode;

	@Override
	public String toString() {
		return "HistoryVO [num=" + num + ", email=" + email + ", ticketNo=" + ticketNo + ", historyDate=" + historyDate
				+ ", ticketCode=" + ticketCode + "]";
	}
	
	
	
}
