package co.yedam.otd.rental.vo;

public class ZoneVO {
	private int parkNumber; // pk
	private int parkTotal;
	private int parkPossible;
	private String parkLat;
	private String parkLng;

	public int getParkNumber() {
		return parkNumber;
	}

	public void setParkNumber(int parkNumber) {
		this.parkNumber = parkNumber;
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

	public String getParkLat() {
		return parkLat;
	}

	public void setParkLat(String parkLat) {
		this.parkLat = parkLat;
	}

	public String getParkLng() {
		return parkLng;
	}

	public void setParkLng(String parkLng) {
		this.parkLng = parkLng;
	}

}
