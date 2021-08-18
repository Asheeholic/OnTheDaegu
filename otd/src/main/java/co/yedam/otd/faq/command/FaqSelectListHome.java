package co.yedam.otd.faq.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.otd.common.Command;
import co.yedam.otd.faq.service.FaqMapper;
import co.yedam.otd.faq.serviceImpl.FaqServiceImpl;

public class FaqSelectListHome implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO FAQ 목록 홈
		FaqMapper dao = new FaqServiceImpl();
		request.setAttribute("list", dao.faqList());
		
		return "faq/faqSelectListHome";
	}

}
