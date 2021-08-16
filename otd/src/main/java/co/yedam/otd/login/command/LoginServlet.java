package co.yedam.otd.login.command;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		System.out.println(email + password);
		
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		HttpSession session = request.getSession();
		
		vo.setEmail(email);
		vo.setPassword(password);
		System.out.println(vo.toString());
		
		vo = dao.memberLogin(vo);
		// int r = dao.memberCheckIdAndPassword();
		
		String result = "false";
		
		if(!vo.getName().isEmpty()) { //id가 일치하면
			session.setAttribute("sessionName", vo.getName());
			session.setAttribute("sessionAuthor", vo.getAuthor());
			session.setAttribute("sessionEmail", vo.getEmail());
			session.setAttribute("session", vo);
			result = "true";
		}
		
		Gson gson = new GsonBuilder().create();
		response.getWriter().print(gson.toJson(result));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
