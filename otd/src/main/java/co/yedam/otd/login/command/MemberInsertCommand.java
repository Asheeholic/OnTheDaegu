package co.yedam.otd.login.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.otd.common.Command;
import co.yedam.otd.member.service.MemberService;
import co.yedam.otd.member.serviceImpl.MemberServiceImpl;
import co.yedam.otd.member.vo.MemberVO;

public class MemberInsertCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO  OTD 회원가입
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		
		vo.setEmail(request.getParameter("email"));
		vo.setPassword(request.getParameter("password"));
		vo.setName(request.getParameter("name"));
		vo.setPhone(request.getParameter("phone"));
		
		int result = dao.memberInsert(vo);
		
		System.out.println(result);
		
		String view;
		if(result != 0) {
			request.setAttribute("message", "회원가입이 성공적으로 됐습니다");
			view = "home/home";
		} else {
			request.setAttribute("message", "입력이 실패 했습니다.");
			view ="login/login.jsp";
		}
		
		return view;
	}

}
