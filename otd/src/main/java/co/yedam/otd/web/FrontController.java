package co.yedam.otd.web;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.otd.common.Command;
import co.yedam.otd.common.HomeCommand;
import co.yedam.otd.rental.command.MapChoiceFormCommand;
import co.yedam.otd.rental.command.MapDaoTestCommand;
import co.yedam.otd.rental.command.MapDeliverBikeCommand;
import co.yedam.otd.rental.command.MapDeliverySystemCommand;
import co.yedam.otd.rental.command.MapPickupSystemCommand;
import co.yedam.otd.rental.command.MapSelectBicycleCommand;
import co.yedam.otd.rental.command.MapSelectZoneCommand;
import co.yedam.otd.rental.command.MapTimeShowCommand;
import co.yedam.otd.event.command.EventList;
import co.yedam.otd.faq.command.FaqBicycleFacilityManagement;
import co.yedam.otd.faq.command.FaqHome;
import co.yedam.otd.faq.command.FaqPaymentRefundMileage;
import co.yedam.otd.faq.command.FaqRentalOffice;
import co.yedam.otd.faq.command.FaqRentalReturn;
import co.yedam.otd.faq.command.FaqUseInformation;
import co.yedam.otd.history.command.GetPayHistoryCommand;
import co.yedam.otd.login.command.IdCheckCommand;
import co.yedam.otd.login.command.LoginCommand;
import co.yedam.otd.login.command.MemberInsertCommand;
import co.yedam.otd.login.command.SignUpformCommand;
import co.yedam.otd.member.command.MemberListCommand;
import co.yedam.otd.member.command.MemberPswdUpdateCommand;
import co.yedam.otd.member.command.MemberPswdUpdateFormCommand;
import co.yedam.otd.member.command.MemberUpdateCommand;
import co.yedam.otd.member.command.MemberSelectCommand;
import co.yedam.otd.login.command.LoginFormCommand;
import co.yedam.otd.login.command.MemberCheckIdAndPassword;
import co.yedam.otd.notice.command.NoticeDelete;
import co.yedam.otd.notice.command.NoticeInsert;
import co.yedam.otd.notice.command.NoticeInsertForm;
import co.yedam.otd.notice.command.NoticeList;
import co.yedam.otd.notice.command.NoticeSelect;
import co.yedam.otd.notice.command.NoticeUpdate;
import co.yedam.otd.notice.command.NoticeUpdateForm;
import co.yedam.otd.review.command.ReviewDelete;
import co.yedam.otd.review.command.ReviewList;
import co.yedam.otd.review.command.ReviewSelect;
import co.yedam.otd.review.command.ReviewUpdate;
import co.yedam.otd.review.command.ReviewUpdateForm;
import co.yedam.otd.payment.command.BuyTicketFormCommand;
import co.yedam.otd.payment.command.InsertDBCommand;
import co.yedam.otd.payment.command.PaymentCommand;
import co.yedam.otd.payment.command.ReturnTicketCommand;
import co.yedam.otd.payment.command.updateDBCommand;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<String, Command>();

    public FrontController() {
        super();
    }


	public void init(ServletConfig config) throws ServletException {
		map.put("/home.do", new HomeCommand());  //메인페이지
		
		//dao test
		map.put("/mapDaoTest.do", new MapDaoTestCommand());
		
		// delivery system
		map.put("/mapDeliverySystem.do", new MapDeliverySystemCommand());
		map.put("/mapDeliverBike.do", new MapDeliverBikeCommand());
		map.put("/mapTimeShow.do", new MapTimeShowCommand());
		map.put("/mapChoiceForm.do", new MapChoiceFormCommand());
		
		// pickup system
		map.put("/mapPickupSystem.do", new MapPickupSystemCommand());
		map.put("/mapSelectZone.do", new MapSelectZoneCommand());
		map.put("/mapSelectBicycle.do", new MapSelectBicycleCommand());
		
		//로그인 & 회원가입
		map.put("/signUpForm.do", new SignUpformCommand()); //회원가입 폼
		map.put("/idCheck.do", new IdCheckCommand()); // 아이디중복체크
		map.put("/memberInsert.do", new MemberInsertCommand()); //OTD 회원가입 커멘드
		map.put("/loginForm.do", new LoginFormCommand()); //로그인폼 
		map.put("/login.do", new LoginCommand()); //OTD 로그인 진행 과정
		map.put("/memberCheckIdAndPassword.do", new MemberCheckIdAndPassword()); //로그인 체크과정
		
		//OTD 마이페이지
		map.put("/memberList.do", new MemberListCommand()); //맴버전체리스트(관리자용)
		map.put("/memberSelect.do", new MemberSelectCommand()); //OTD 한건 회원 조회 
		map.put("/memberUpdate.do", new MemberUpdateCommand());//회원 수정(번호만)
		map.put("/getPayHistory.do", new GetPayHistoryCommand()); // 이용권 사용내역조회
		map.put("/memberPswdUpdateForm.do", new MemberPswdUpdateFormCommand()); //비밀번호변경 영역폼
		map.put("/memberPswdUpdate.do", new MemberPswdUpdateCommand()); //회원 패스워드 수정
		
		// Notice -김주영
		map.put("/noticeList.do", new NoticeList()); // 공지목록
		map.put("/noticeSelect.do", new NoticeSelect()); // 공지조회
		map.put("/noticeInsertForm.do", new NoticeInsertForm()); // 공지작성폼
		map.put("/noticeInsert.do", new NoticeInsert()); // 공지작성
		map.put("/noticeUpdateForm.do", new NoticeUpdateForm()); // 공지수정폼
		map.put("/noticeUpdate.do", new NoticeUpdate()); // 공지수정
		map.put("/noticeDelete.do", new NoticeDelete()); // 공지삭제
		
		// Event -김주영
		map.put("/eventList.do", new EventList()); // 이벤트목록
		
		// Review -김주영
		map.put("/reviewList.do", new ReviewList()); // 리뷰글목록
		map.put("/reviewSelect.do", new ReviewSelect()); // 리뷰한건조회
		map.put("/reviewUpdateForm.do", new ReviewUpdateForm()); // 리뷰수정폼
		map.put("/reviewUpdate.do", new ReviewUpdate()); // 리뷰수정
		map.put("/reviewDelete.do", new ReviewDelete()); // 리뷰삭제

		// FAQ -김주영
		map.put("/faqHome.do", new FaqHome()); // FAQ 목록 홈
		map.put("/faqRentalOffice.do", new FaqRentalOffice()); // 자주 묻는 질문: 대여소
		map.put("/faqPaymentRefundMileage.do", new FaqPaymentRefundMileage()); // 자주 묻는 질문: 결제/환불/마일리지
		map.put("/faqUseInformation.do", new FaqUseInformation()); // 자주 묻는 질문: 이용안내
		map.put("/faqBicycleFacilityManagement.do", new FaqBicycleFacilityManagement()); // 자주 묻는 질문: 자전거 및 시설관리
		map.put("/faqRentalReturn.do", new FaqRentalReturn()); // 자주 묻는 질문: 대여/반납
//		map.put("/faqSelectListHome.do", new FaqSelectListHome()); // FAQ 목록 홈
//		map.put("/faqSelectList.do", new FaqSelectList()); // FAQ 목록
	
		// 유정
		map.put("/buyTicketForm.do", new BuyTicketFormCommand()); // 티켓구매 폼
		map.put("/payment.do", new PaymentCommand()); // 결제창
		map.put("/insertDB.do", new InsertDBCommand()); //결제내역
		map.put("/returnTicket.do", new ReturnTicketCommand()); //환불 폼
		map.put("/updateDB.do", new updateDBCommand()); // 환불창
	}


	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String path = uri.substring(contextPath.length());

		Command command = map.get(path);
		String viewPage = command.execute(request, response);

		if (!viewPage.endsWith(".do")) {
			if (!viewPage.endsWith(".jsp")) {
				viewPage = viewPage + ".tiles"; // home/home 타일즈
			} else {
				viewPage = "/WEB-INF/views/" + viewPage; // home/home.jsp 타일즈 안탐
			}
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
