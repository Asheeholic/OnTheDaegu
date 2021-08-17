package co.yedam.otd.login.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.otd.common.Command;
import co.yedam.otd.member.service.MemberService;
import co.yedam.otd.member.serviceImpl.MemberServiceImpl;
import co.yedam.otd.member.vo.MemberVO;

public class IdCheckCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 아이디 중복 체크
		String emailId = request.getParameter("email");
		
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		
		vo.setEmail(emailId);
		
		int n = dao.memberIdCheck(vo.getEmail());
		if(n == 1) {
			request.setAttribute("message", "사용할 수 없는 아이디 입니다.");	
		} else {
			request.setAttribute("message", "사용할 수 있는 아이디 입니다.");	
			
		}
		
		return "login/idCheckResult.jsp";
	}

}
