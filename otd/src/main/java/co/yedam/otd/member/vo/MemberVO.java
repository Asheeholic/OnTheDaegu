package co.yedam.otd.member.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {
	private String email;
	private String password;
	private String name;
	private String phone;
	private String state;
	private String author;

	@Override
	public String toString() {
		return "MemberVO [email=" + email + ", password=" + password + ", name=" + name + ", phone=" + phone
				+ ", state=" + state + ", author=" + author + " ]";
	}
	
}
