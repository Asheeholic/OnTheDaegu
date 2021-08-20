package co.yedam.otd.rental.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.otd.common.Command;
import co.yedam.otd.rental.service.RentalService;
import co.yedam.otd.rental.serviceImpl.RentalServiceImpl;
import co.yedam.otd.rental.vo.BicycleVO;

public class MapTimeShowCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 여기에 남은 시간권 출력하기 위한 준비만 하면 됨.

		// 시간은 히스토리 + 정기권을 포함시켜서 들고온다.
		HttpSession session = request.getSession();
		if(session.getAttribute("bicycle") != null) {
			BicycleVO vo = (BicycleVO) session.getAttribute("bicycle");
			vo.setParkNumber(null);
			vo.setBicyclePossible("N");
			
			RentalService dao = new RentalServiceImpl();
			
			int result = dao.bicycleUpdate(vo);
			
			System.out.println(result);
		}
		
		return "maps/mapsTime";
	}

}
