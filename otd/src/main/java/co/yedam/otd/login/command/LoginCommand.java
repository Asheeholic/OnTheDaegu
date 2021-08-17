package co.yedam.otd.login.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.otd.common.Command;
import co.yedam.otd.member.service.MemberService;
import co.yedam.otd.member.serviceImpl.MemberServiceImpl;
import co.yedam.otd.member.vo.MemberVO;

public class LoginCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO OTD 로그인처리장소
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		System.out.println("여기는 emaild :" + email+ "여기는 패스워드 : " +password);
		
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		HttpSession session = request.getSession(); //이미 세션이 있다면 그 세션을 돌려주고, 세션이 없으면 새로운 세션을 생성한다.
		
		vo.setEmail(email);
		vo.setPassword(password);
		vo = dao.memberLogin(vo);
		System.out.println("넌누구냐?"+vo);
		System.out.println("Login....중");
		
		session.setAttribute("sessionName", vo.getName());
		session.setAttribute("sessionAuthor", vo.getAuthor());
		session.setAttribute("sessionEmail", vo.getEmail());
		session.setAttribute("session", vo);
		System.out.println(vo+"들어있어");
		System.out.println("로그인이 성공적으로 되었습니다.");	
		
		return "home.do";
	}

}
