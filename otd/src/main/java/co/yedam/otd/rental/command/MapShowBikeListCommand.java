package co.yedam.otd.rental.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.otd.common.Command;
import co.yedam.otd.rental.service.RentalService;
import co.yedam.otd.rental.serviceImpl.RentalServiceImpl;
import co.yedam.otd.rental.vo.BicycleVO;

public class MapShowBikeListCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 자전거 리스트 보여주기
		
		RentalService dao = new RentalServiceImpl();
		List<BicycleVO> list = dao.bicycleListAll();
		
		return "maps/mapBikeList";
	}

}
