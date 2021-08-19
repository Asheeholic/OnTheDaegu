package co.yedam.otd.rental.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.otd.common.Command;
import co.yedam.otd.rental.service.RentalService;
import co.yedam.otd.rental.serviceImpl.RentalServiceImpl;
import co.yedam.otd.rental.vo.ZoneVO;

public class MapPickupSystemCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		RentalService dao = new RentalServiceImpl();
		
		List<ZoneVO> list = dao.zoneList();
		
		request.setAttribute("list", list);
		
		return "maps/mapZoneList";
	}

}
