package co.yedam.otd.rental.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.otd.common.Command;

public class MapDeliverBikeCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String nowLat = request.getParameter("nowLat");
		String nowLng = request.getParameter("nowLng");
		
		request.setAttribute("nowLat", nowLat);
		request.setAttribute("nowLng", nowLng);
		
		return "maps/mapDeliverBike";
	}

}
