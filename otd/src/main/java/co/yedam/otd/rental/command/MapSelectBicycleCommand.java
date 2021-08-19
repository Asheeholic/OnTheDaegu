package co.yedam.otd.rental.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.otd.common.Command;
import co.yedam.otd.rental.service.RentalService;
import co.yedam.otd.rental.serviceImpl.RentalServiceImpl;
import co.yedam.otd.rental.vo.BicycleVO;

public class MapSelectBicycleCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		int bicycleNumber = Integer.valueOf(request.getParameter("bicycleNumber"));
		
		RentalService dao = new RentalServiceImpl();
		BicycleVO vo = dao.bicycleSelectOne(bicycleNumber);
		System.out.println(vo.getBicycleNo());
		
		// 선택한 자전거를 세션에 등록함.
		session.setAttribute("bicycle", vo);
		
		return "maps/mapsPickupMap";
	}

}
