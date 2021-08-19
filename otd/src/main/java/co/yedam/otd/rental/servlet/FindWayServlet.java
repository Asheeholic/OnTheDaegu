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

/**
 * Servlet implementation class FindWayServlet
 */
@WebServlet("/FindWayServlet")
public class FindWayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindWayServlet() {
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
		
//		nowLat : now._lat,
//		nowLng : now._lng,
//		goalLat : goal._lat,
//		goalLug : now._lng
		
		String nowLat = request.getParameter("nowLat");
		String nowLng = request.getParameter("nowLng");
		
		String goalLat = request.getParameter("goalLat");
		String goalLug = request.getParameter("goalLug");
		
		FindLoadAPI findLoadAPI = new FindLoadAPI();
		
		String preJson = findLoadAPI.showJson(nowLat, nowLng, goalLat, goalLug);
		
		Gson gson = new GsonBuilder().create();
		response.getWriter().print(gson.toJson(preJson));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
