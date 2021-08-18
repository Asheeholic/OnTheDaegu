package co.yedam.otd.faq.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import co.yedam.otd.common.Command;
import co.yedam.otd.common.DataSource;
import co.yedam.otd.faq.service.FaqMapper;
import co.yedam.otd.faq.serviceImpl.FaqServiceImpl;
import co.yedam.otd.faq.vo.FaqVO;

public class FaqSelectList implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO FAQ 목록
		FaqMapper dao = new FaqServiceImpl();
		String category = request.getParameter("faqCategory");
		FaqVO vo = new FaqVO();
		request.setAttribute("list", dao.faqSelectList(category));
		vo.setFaqCategory(category);

		// if문으로 뷰페이지 조건에 따라 다르게 넘기기
		String page = null;
		if(vo.getFaqCategory().equals("대여소")) {
			page = "faq/faqRentalOffice";
		} else if(vo.getFaqCategory().equals("결제/환불/마일리지")) {
			page = "faq/faqPaymentRefundMileage";
		}

		SqlSession sqlSession = DataSource.getInstance().openSession();
		sqlSession.close();
		
		return page;
	}

}
