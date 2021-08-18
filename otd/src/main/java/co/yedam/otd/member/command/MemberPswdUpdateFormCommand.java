package co.yedam.otd.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.otd.common.Command;

public class MemberPswdUpdateFormCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 비밀번호 변경폼으로 가면서 값도 가져감
		
		request.setAttribute("email", request.getParameter("email"));
		request.setAttribute("password", request.getParameter("password"));
		
		return "member/memberPswdUpdate";
	}

}
