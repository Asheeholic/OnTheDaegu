<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>buy ticket</title>
</head>
<body>
	<div align="center">
		<div>
			<h1>이용권 구매</h1>
		</div>
		<div>
			<form id="frm" name="frm" action="payment.do" method="post">
				<div>
					<table border="1">
						<tr>
							<th width="200">이용권</th>
							<td><select name="ticket">
									<option value="">선택</option>
									<option value="1000">30분(1,000원)</option>
									<option value="2000">1시간(2,000원)</option>
									<option value="3500">2시간(3,500원)</option>
									<option value="7000">4시간(7,000원)</option>
									<option value="10000">8시간(10,000원)</option>
									<option value="15000">12시간(15,000원)</option>
									<option value="25000">24시간(25,000원)</option>
							</select></td>
						</tr>
						<tr>
							<th width="200">결제수단</th>
							<td><label><input type="radio" name="pay"
									value="card">신용/체크카드</label> <label><input type="radio"
									name="pay" value="cash">자동이체</label> <label><input
									type="radio" name="pay" value="kakao">카카오페이</label> <label><input
									type="radio" name="pay" value="naver">네이버페이</label></td>
						</tr>
						<tr>
							<th width="200">결제안내</th>
							<td>신용/체크카드 결제 시, 카드사 혹은 해당 은행의 결제 이용 시간에 따라 결제가 지연되거나, 거부될
								수 있습니다.<br> <br> 해당 정보는 각 카드사/은행 홈페이지에서 별도로 확인 부탁드립니다.
								<p style="font-weight: bold">
									<font color="red">*</font> 구매하신 이용권에 해당하는 사용시간 이후에 반납처리가 되면
									추가결제가 발생할 수 있습니다.<br> <br> <font color="red">*</font>
									이용권 미이용에 의한 환불처리 시 결제하신 수단으로 환불됨을 알려드립니다.
								</p>
							</td>
						</tr>
						<tr>
							<th width="200">휴대폰 번호</th>
							<td><input type="text" name="phone"></td>
						</tr>
						<tr>
							<th width="200">이름</th>
							<td><input type="text" name="name"></td>
						</tr>
					</table>
				</div>
				<div align="left">
					<input type="checkbox" name="agreement" value="total">전체동의<br>
					<input type="checkbox" name="agreement" value="total">추가요금
					자동 결제 동의<br> <input type="checkbox" name="agreement"
						value="total">환불 규정 동의<br> <input type="checkbox"
						name="agreement" value="total">서비스 이용약관 동의<br> <input
						type="checkbox" name="agreement" value="total">개인정보 수집 및
					이용 동의<br> <input type="checkbox" name="agreement"
						value="total">수집한 개인정보의 제 3자 정보제공 동의<br> <input
						type="checkbox" name="agreement" value="total">위치기반 서비스 이용
					약관 동의<br>
				</div>
				<div>
					<input type="submit" value="결제하기">
				</div>
			</form>
		</div>
	</div>
</body>
</html>