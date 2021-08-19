package co.yedam.otd.rental.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.otd.common.Command;

public class MapChoiceFormCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		
		if(session.getAttribute("session") == null) {
			return "login/loginForm.jsp";
		} else {
			return "maps/mapChoice";
		}
	}

}
