package co.yedam.otd.faq.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class QuestionVO {
	private int qNo;
	private String faqCategory;
	private String email;
	private String qTitle;
	private String qContent;
	private Date qDate;
}
