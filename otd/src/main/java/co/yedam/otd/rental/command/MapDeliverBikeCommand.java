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
		
		// 보내도 현재 크게 의미가 없음
		request.setAttribute("nowLat", nowLat);
		request.setAttribute("nowLng", nowLng);
		
		return "maps/mapDeliverBike";
	}

}
