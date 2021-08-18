package co.yedam.otd.faq.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.otd.common.Command;

public class FaqHome implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO FAQ 홈
		return "faq/faqHome";
	}

}
