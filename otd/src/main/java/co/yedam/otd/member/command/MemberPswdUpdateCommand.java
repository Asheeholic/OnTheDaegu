package co.yedam.otd.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.otd.common.Command;
import co.yedam.otd.member.service.MemberService;
import co.yedam.otd.member.serviceImpl.MemberServiceImpl;
import co.yedam.otd.member.vo.MemberVO;

public class MemberPswdUpdateCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 비밀번호 변경
			String password = request.getParameter("password");
			String newPass = request.getParameter("newPass");
			String email = request.getParameter("email");
			
			System.out.println(newPass);
			
			System.out.println("여기는?"+password + newPass);
			System.out.println("비교문"+ newPass.equals(password));
			
			MemberService dao = new MemberServiceImpl();
			MemberVO vo = new MemberVO();
			
			
			
			vo.setEmail(email);
			vo.setPassword(newPass);
			System.out.println("이메일값 들고 왔냐?? : " + email + "변경할 비번 들고옴? :"+newPass );
			
			int result = dao.memberPassUpdate(vo);
			String page = "";
			if(result == 1 && newPass.equals(password)) {
				System.out.println("수정완료");
				page = "memberSelect.do";
			}else {
				page = "memberPswdUpdateForm.do";
			}
			
		return page;
	}

}
