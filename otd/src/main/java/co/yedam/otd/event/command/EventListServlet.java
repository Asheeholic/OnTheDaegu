package co.yedam.otd.event.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.otd.common.DataSource;
import co.yedam.otd.event.service.EventMapper;
import co.yedam.otd.event.serviceImpl.EventServiceImpl;
import co.yedam.otd.event.vo.EventVO;

@WebServlet("/EventListServlet")
public class EventListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EventListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/json;charset=utf-8");
		
		EventMapper dao = new EventServiceImpl();
		List<EventVO> list = dao.eventList();
		
		Gson gson = new GsonBuilder().create();
		response.getWriter().print(gson.toJson(list));
		
		SqlSession sqlSession = DataSource.getInstance().openSession();
		sqlSession.close();	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
