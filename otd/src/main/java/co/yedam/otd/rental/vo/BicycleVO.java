package co.yedam.otd.rental.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BicycleVO {
	private int bicycleNo;
	private String bicycleError;
	private String bicycleLost;
	private String bicyclePossible;
	private String bicycleLat;
	private String bicycleLng;
	private String parkNumber;
}
