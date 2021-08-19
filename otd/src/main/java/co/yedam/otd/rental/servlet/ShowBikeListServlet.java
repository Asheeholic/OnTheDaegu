package co.yedam.otd.rental.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.otd.rental.service.RentalService;
import co.yedam.otd.rental.serviceImpl.RentalServiceImpl;
import co.yedam.otd.rental.vo.BicycleVO;

/**
 * Servlet implementation class ShowBikeListServlet
 */
@WebServlet("/ShowBikeListServlet")
public class ShowBikeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowBikeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/json; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		
		RentalService dao = new RentalServiceImpl();
		List<BicycleVO> list = dao.bicycleListAll();
		
		Gson gson = new GsonBuilder().create();
		response.getWriter().print(gson.toJson(list));
		
	}

}
