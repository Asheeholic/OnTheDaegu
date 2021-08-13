package co.yedam.otd.rental.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ZoneVO {
	private String parkLocation;
	private int parkTotal;
	private int parkPossible;

	public String getParkLocation() {
		return parkLocation;
	}

	public void setParkLocation(String parkLocation) {
		this.parkLocation = parkLocation;
	}

	public int getParkTotal() {
		return parkTotal;
	}

	public void setParkTotal(int parkTotal) {
		this.parkTotal = parkTotal;
	}

	public int getParkPossible() {
		return parkPossible;
	}

	public void setParkPossible(int parkPossible) {
		this.parkPossible = parkPossible;
	}
}
