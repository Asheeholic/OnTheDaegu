package co.yedam.otd.rental.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.otd.common.Command;

public class MapTimeShowCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 여기에 남은 시간권 출력하기 위한 준비만 하면 됨.
		return "maps/mapsTime";
	}

}
