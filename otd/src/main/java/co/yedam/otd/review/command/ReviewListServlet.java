package co.yedam.otd.review.command;

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
import co.yedam.otd.review.service.ReviewService;
import co.yedam.otd.review.serviceImpl.ReviewServiceImpl;
import co.yedam.otd.review.vo.ReviewVO;

@WebServlet("/ReviewListServlet")
public class ReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/json;charset=utf-8");
		
		ReviewService dao = new ReviewServiceImpl();
		List<ReviewVO> list = dao.reviewList();
		
		Gson gson = new GsonBuilder().create();
		response.getWriter().print(gson.toJson(list));
		
		SqlSession sqlSession = DataSource.getInstance().openSession();
		sqlSession.close();			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
