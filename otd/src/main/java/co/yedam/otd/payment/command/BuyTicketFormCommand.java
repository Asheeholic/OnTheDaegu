package co.yedam.otd.payment.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.otd.common.Command;

public class BuyTicketFormCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 구매 선택창

		HttpSession session = request.getSession();

		if (session.getAttribute("session") == null) {
			return "login/loginForm.jsp";
		} else {
			return "yujeong/buyTicketForm";
		}
	}
}
