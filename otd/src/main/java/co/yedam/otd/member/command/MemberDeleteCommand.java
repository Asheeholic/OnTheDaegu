package co.yedam.otd.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.otd.common.Command;
import co.yedam.otd.member.service.MemberService;
import co.yedam.otd.member.serviceImpl.MemberServiceImpl;
import co.yedam.otd.member.vo.MemberVO;

public class MemberDeleteCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 회원 삭제('Y' -> 'D')
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		
		String email = request.getParameter("email");
		String state = request.getParameter("state");
		
		vo.setEmail(email);
		vo.setState(state);
		
		int result = dao.memberDelete(vo);
		System.out.println(result);
		
		String page = "";
		if(result == 1) {
			page ="home.do";
		} else {
			page ="deleteForm.do";
		}
		return page;
	}

}
