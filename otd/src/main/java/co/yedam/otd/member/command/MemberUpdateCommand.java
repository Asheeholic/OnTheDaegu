package co.yedam.otd.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import co.yedam.otd.common.Command;
import co.yedam.otd.common.DataSource;
import co.yedam.otd.member.service.MemberService;
import co.yedam.otd.member.serviceImpl.MemberServiceImpl;
import co.yedam.otd.member.vo.MemberVO;

public class MemberUpdateCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 맴버 수정
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		//String password = request.getParameter("password");
		System.out.println(phone);
		vo.setEmail(email);
		vo.setPhone(phone);
		
		System.out.println(vo);
		//vo.setPassword(password);
		int result = dao.memberUpdate(vo);
		System.out.println(result);
		String page ="";
		if(result != 0) { //mybatis는 UPDATE된 행의 갯수 반환(없으면 0)
			page = "memberSelect.do"; //다시 한건 조회로
			System.out.println(result);
		} else {
			request.setAttribute("message","회원 수정 오류! 관리자에게 문의하세요." );
			page = "memberSelect.do";
		}
	
		return page;
	}

}
