package co.yedam.otd.payment.vo;

public class PaymentVO {
	private int payment_no;
	private String email;
	private String payment_price;
	private String method;

	public int getPayment_no() {
		return payment_no;
	}

	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPayment_price() {
		return payment_price;
	}

	public void setPayment_price(String payment_price) {
		this.payment_price = payment_price;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

}
