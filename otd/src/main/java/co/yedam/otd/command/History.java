package co.yedam.otd.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.otd.common.Command;

public class History implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		return "yujeong/history";
	}

}
