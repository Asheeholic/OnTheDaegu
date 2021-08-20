package co.yedam.otd.rental.service;

import co.yedam.otd.rental.vo.TimeVO;

public interface TimeMapper {
	
	TimeVO timeSelectOne(String email);
	
}
