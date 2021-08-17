<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
        	// 리뷰리스트조회
        	$(document).ready(function(){
        		$.ajax({
        			url: 'ReviewListServlet', // 요청페이지
        			dataType: 'json',
        			success: reviewListFnc,
        			error: function(reject){
        				console.error(reject);
        			}
        		});
        	});
        	
        	// 리뷰리스트조회 콜백함수
        	function reviewListFnc(data){
        		let br = $('<br>');
        		let table = $('<table />').attr('border', '1');
        		
        		for(let i=0; i<data.length; i++){
        			let tr1 = $('<tr />');
        			let th_writer = $('<th />').attr('width', '90').text('작성자');
            		let td_writer = $('<td />').text('세션활용').attr('width', '200');
            		let th_like = $('<th />').attr('width', '90').text('별점');
       				let td_like = $('<td />').attr('width', '130').text(data[i].reviewLike);
       				$(tr1).append(th_writer, td_writer, th_like, td_like);
       				
       				let tr2 = $('<tr />').attr('rowspan', '3');
       				let td_content = $('<td />').attr('colspan', '3').attr('height', '150').text(data[i].reviewContent);
       				let td_button = $('<td />').text('수정삭제버튼');
					$(tr2).append(td_content, td_button);
					
					let tr3 = $('<tr />');
					let tr4 = $('<tr />');
					
       				$(table).append(tr1, tr2, tr3, tr4, br);
        		}
        		$('#list').append(table);
        	}
   
        </script>	
</head>
<body>
	<h3>입력</h3>
	<div id="insert">
		<form id="frm" action="../../AddItemServlet.do" method="post">
		   작성자 : <input type="text" id ="email" name ="email" value="세션활용이메일"> <br>
		   별점 : <input type="text" id ="reviewLike" name ="reviewLike" required="required"> <br>
		   후기 : <input type="text" id = "reviewContent" name ="reviewContent" required="required"> <br>
		   <br>
		   <input type="submit" value="저장">&nbsp;&nbsp;&nbsp;<input type="reset" value="취소">
		</form>	
	</div>
	
	<h3>목록</h3>
	<div id="list">
	</div>
<!--  
	<div align="center">
		<div><h3>리뷰목록</h3></div>
		<div>
			<table border="1">
			<c:forEach var="review" items="${list}">
				<tr>
					<th width="90">작성자</th>
					<td width="200" align="center">세션활용</td>
					<th width="90">별점</th>
					<td width="160" align="center">${review.reviewLike}</td>
				</tr>
				<tr>
					<td colspan="3" height="150">${review.reviewContent}</td>
					<td align="center">
						<br><br><br><br>
						<button type="button">버튼1</button>&nbsp;
						<button type="button">버튼2</button>
					</td>
				</tr>
			</c:forEach>				
			</table>		
		</div>
		<div>
			<button type="button" onclick="location.href='home.do'">HOME</button>
			&nbsp;&nbsp;&nbsp;
				<button type="button" onclick="location.href='reviewInsertForm.do'">글쓰기</button>
		</div>
	</div>
-->	
</body>
</html>