package co.yedam.otd.rental.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.otd.common.Command;
import co.yedam.otd.rental.service.RentalService;
import co.yedam.otd.rental.serviceImpl.RentalServiceImpl;
import co.yedam.otd.rental.vo.BicycleVO;
import co.yedam.otd.rental.vo.ZoneVO;

public class MapSelectZoneCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		int parkNum = Integer.valueOf(request.getParameter("parkNumber"));
		
		RentalService dao = new RentalServiceImpl();
		List<BicycleVO> list = dao.zoneSelectAndBicycleList(parkNum);
		
		request.setAttribute("list", list);
		
		return "maps/mapSelectZone";
	}

}
