package co.yedam.otd.login.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.otd.common.Command;
import co.yedam.otd.member.vo.MemberVO;

public class LogoutCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 로그아웃 해주는 과정
		HttpSession session = request.getSession();
		
		String email = (String) session.getAttribute("sessionEmail");
		System.out.println(session.getAttribute("sessionEmail"));
		session.removeAttribute(email);
		session.invalidate();
		//System.out.println("그래서 없어졌니?"+email);
		
		return "home/home";
	}

}
