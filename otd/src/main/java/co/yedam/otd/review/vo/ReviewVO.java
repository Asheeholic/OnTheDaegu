package co.yedam.otd.review.vo;

import java.sql.Date;

public class ReviewVO {
	private int reviewNo;
	private String reviewContent;
	private int reviewLike;
	private String email;
	private Date reviewDate;

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public int getReviewLike() {
		return reviewLike;
	}

	public void setReviewLike(int reviewLike) {
		this.reviewLike = reviewLike;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

}
