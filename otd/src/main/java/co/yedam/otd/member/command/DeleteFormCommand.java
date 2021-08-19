package co.yedam.otd.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.otd.common.Command;

public class DeleteFormCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 회원삭제 폼으로
		request.setAttribute("email", request.getParameter("email"));
		request.setAttribute("state", request.getParameter("state"));
	
		return "member/memberDeleteForm";
	}

}
