package co.yedam.otd.faq.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import co.yedam.otd.common.Command;
import co.yedam.otd.common.DataSource;
import co.yedam.otd.faq.service.FaqService;
import co.yedam.otd.faq.serviceImpl.FaqServiceImpl;

public class FaqPaymentRefundMileage implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 자주 묻는 질문: 결제/환불/마일리지
		FaqService dao = new FaqServiceImpl();
		request.setAttribute("list", dao.faqPaymentRefundMileage());
		SqlSession sqlSession = DataSource.getInstance().openSession();
		sqlSession.close();
		
		return "faq/faqPaymentRefundMileage";
	}

}
