package co.yedam.otd.review.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewVO {
	private int reviewNo;
	private String reviewContent;
	private int reviewLike;
	private String email;
	private Date reviewDate;
}
