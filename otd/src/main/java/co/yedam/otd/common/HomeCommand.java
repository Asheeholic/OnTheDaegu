package co.yedam.otd.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HomeCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("member") == null) {
			session.setAttribute("member", null);
		}
		
		return "home/home";
	}

}
