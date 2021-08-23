package co.yedam.otd.login.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.otd.member.service.MemberService;
import co.yedam.otd.member.serviceImpl.MemberServiceImpl;
import co.yedam.otd.member.vo.MemberVO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		System.out.println("No.1:로그인서블릿영역1"+email + password);
		
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		
		vo.setEmail(email);
		vo.setPassword(password);
		
		int r = dao.memberCheckIdAndPassword(vo);
		
		System.out.println(r);
		
		String result = "";
		PrintWriter out = response.getWriter();
		if(r == 1) { //id가 일치하면
			result = "true";
			System.out.println("if구문이야"+result);
		} else if( r == 0) {
			result ="false";
			System.out.println("else if 구문이야"+result);
			out.print("alert('아이디 또는 비밀번호가 일치하지않습니다.');");
		}
		
		Gson gson = new GsonBuilder().create();
		response.getWriter().print(gson.toJson(r));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
