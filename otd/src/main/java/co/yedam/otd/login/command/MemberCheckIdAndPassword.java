package co.yedam.otd.login.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.otd.common.Command;
import co.yedam.otd.member.service.MemberService;
import co.yedam.otd.member.serviceImpl.MemberServiceImpl;
import co.yedam.otd.member.vo.MemberVO;

public class MemberCheckIdAndPassword implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 로그인 체크 구문 
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		System.out.println("MemberCheckIdAndPassword 영역"+email + password);
		
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		
		vo.setEmail(email);
		vo.setPassword(password);
		
		int result = dao.memberCheckIdAndPassword(vo);
		
		String page="";
		
		System.out.println("너는 무엇이냐!"+result);
		if(result == 1) { //DB에 저장된 아이디가 있으면 1 -> loginCommand로
				page = "login.do";
				System.out.println("true영역"+ page);
		} else {
				page = "loginForm.do"; //count가 0일시 로그인 폼으로
				System.out.println("false영역"+page);
			
		}
		
		return page;
	}

}
