package co.yedam.otd.payment.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.otd.common.Command;
import co.yedam.otd.payment.API.RefundList;
import co.yedam.otd.payment.API.RefundTicket;
import co.yedam.otd.payment.API.ShowToken;

public class ReturnTicketCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 환불 선택 창
		ShowToken showToken = new ShowToken();
		RefundTicket refundTicket = new RefundTicket();
		RefundList refundList = new RefundList();
		
		String token = showToken.showToken();
		String refund = refundTicket.refundTicket();
		String list = refundList.refundList();
		
		return "history/getPayHistory";
	}
}
