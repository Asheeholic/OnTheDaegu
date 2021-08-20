package co.yedam.otd.rental.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.otd.rental.service.TimeService;
import co.yedam.otd.rental.serviceImpl.TimeServiceImpl;
import co.yedam.otd.rental.vo.TimeVO;

/**
 * Servlet implementation class LeftTimeShowServlet
 */
@WebServlet("/LeftTimeShowServlet")
public class LeftTimeShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LeftTimeShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/json; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		
		String email = request.getParameter("email");
		
		TimeService dao = new TimeServiceImpl();
		
		TimeVO vo = dao.timeSelectOne(email);
		
		Gson gson = new GsonBuilder().create();
		response.getWriter().print(gson.toJson(vo));
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
