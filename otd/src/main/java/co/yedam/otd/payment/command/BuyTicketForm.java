package co.yedam.otd.payment.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.otd.common.Command;

public class BuyTicketForm implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 구매 선택창
		return "yujeong/buyTicketForm";
	}

}
