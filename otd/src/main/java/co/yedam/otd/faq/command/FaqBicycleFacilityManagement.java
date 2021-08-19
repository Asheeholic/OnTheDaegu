package co.yedam.otd.faq.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import co.yedam.otd.common.Command;
import co.yedam.otd.common.DataSource;
import co.yedam.otd.faq.service.FaqService;
import co.yedam.otd.faq.serviceImpl.FaqServiceImpl;

public class FaqBicycleFacilityManagement implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 자주 묻는 질문: 자전거 및 시설관리
		FaqService dao = new FaqServiceImpl();
		request.setAttribute("list", dao.faqBicycleFacilityManagement());
		SqlSession sqlSession = DataSource.getInstance().openSession();
		sqlSession.close();
		
		return "faq/faqBicycleFacilityManagement";
	}

}
