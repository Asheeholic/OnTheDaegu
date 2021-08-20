package co.yedam.otd.rental.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.otd.rental.API.FindLoadAPI;
import co.yedam.otd.rental.API.ReverseGeocodingAPI;

/**
 * Servlet implementation class ShowBikeRealPositionServlet
 */
@WebServlet("/ShowBikeRealPositionServlet")
public class ShowBikeRealPositionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowBikeRealPositionServlet() {
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
		
		String bicycleLat = request.getParameter("bicycleLat");
		String bicycleLng = request.getParameter("bicycleLng");
		
		ReverseGeocodingAPI reverseGeocodingAPI = new ReverseGeocodingAPI();
		String json = reverseGeocodingAPI.showPosition(bicycleLat, bicycleLng);
		
		Gson gson = new GsonBuilder().create();
		response.getWriter().print(gson.toJson(json));
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
