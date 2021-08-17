package co.yedam.otd.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.otd.common.Command;

public class MemberSelectFormCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 맴버 회원조회와 수정폼 같이.
		request.setAttribute("email", request.getParameter("email"));
		request.setAttribute("password", request.getParameter("password"));
		request.setAttribute("name", request.getParameter("name"));
		request.setAttribute("phone", request.getParameter("phone"));
		
		return "member/memberSelectForm";
	}

}
