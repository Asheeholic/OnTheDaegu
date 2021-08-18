package co.yedam.otd.rental.service;

import java.util.List;

import co.yedam.otd.rental.vo.BicycleVO;
import co.yedam.otd.rental.vo.ZoneVO;

public interface RentalService {
	
	// zone
	List<ZoneVO> zoneList();
	ZoneVO zoneSelectOne(int parkNum);
	int zoneUpdate(int parkNum); // 전체수와 가능수만 바꾸면 됨
	
	//bicycle
	List<BicycleVO> bicycleListAll(); // 전체 자전거
	List<BicycleVO> zoneSelectAndBicycleList(int parkNum); // 존 선택시
	
	BicycleVO bicycleSelectOne(int bicycleNum); // 자전거의 현재 정보
	int bicycleUpdate(int bicycleNum); // 자전거의 현재 정보 바꾸기

}
