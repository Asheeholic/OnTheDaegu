<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style>
.bg-1 {
	background: url("img/payForm.png") no-repeat 50% 50%;
	background-size: 100%;
	height: 370px;
	position: relative;
	z-index: -50;
}

body {
	line-height: 1.6;
	font-family: "Roboto", sans-serif;
	-webkit-font-smoothing: antialiased;
	font-size: 16px;
	color: #000000;
	font-weight: 400;
}

.btn {
	margin-left: 39%;
	display: inline-block;
	font-size: 20px;
	font-size: 0.8125rem;
	font-weight: 1000;
	letter-spacing: .5px;
	padding: .75rem 2rem;
	font-family: "Exo", sans-serif;
	text-transform: uppercase;
	border-radius: 5px;
	border: 2px solid transparent;
	transition: all .35s ease;
}

.btn-main {
	background: #00B6BC;
	color: #fff;
	border-color: #00B6BC;
}

.btn-round-full {
	border-radius: 50px;
}

.overlay:before {
	content: "";
	position: absolute;
	left: 0;
	top: 0;
	bottom: 0;
	right: 0;
	width: 100%;
	height: 100%;
	opacity: 0.9;
	background: #00b6bc;
	z-index: -1;
}

table, th, td {
	border: solid 1px lightGray;
	border-collapse: collapse;
	padding: 5px;
}

table {
	margin: auto;
	border-radius: 5px;
}

th {
	text-align: center;
}

td {
	padding-left: 10px;
}

.text-white {
	z-index: 10;
}

.card-header {
	background: #00b6bc;
}

.section-title h2 {
	color: #000000;
}
.card {
	left: 20%;
	width: 800px;
}
</style>
</head>
<body>
	<div>
		<section class="page-title bg-1">
			<div class="overlay"></div>
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="block text-center">
							<h1 class="text-capitalize mb-5 text-lg">OTD와 함께하는 건강한 일상</h1>
							<span class="text-white">OTD는 대구도시지하철도공사와 함께 합니다.</span>

							<!-- <ul class="list-inline breadcumb-nav">
            <li class="list-inline-item"><a href="index.html" class="text-white">Home</a></li>
            <li class="list-inline-item"><span class="text-white">/</span></li>
            <li class="list-inline-item"><a href="#" class="text-white-50">Book your Seat</a></li>
          </ul> -->
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="contact-form-wrap section">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-6">
						<div class="section-title text-center">
							<h2 class="mb-2">비밀번호 변경</h2>
							<div class="divider mx-auto my-4"></div>
							<p class="mb-5"></p>
						</div>
					</div>
				</div>

				<div class="card shadow p-3 mb-5 rounded">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-white">OTD를 통해 일상 속의 힐링을
							만나보세요.</h6>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<form id="passfrm" name="passfrm" action="memberPswdUpdate.do"
								method="post" onsubmit="memberPassUpdate();">
								<table width="100%" cellspacing="0">
									<tr>
										<th>현재비밀번호</th>
										<td align="center">${password}<input type="hidden"
											name="password" id="password" value="${password }">
										</td>

									</tr>
									<tr>
										<th>새 비밀번호</th>
										<td align="center"><input type="password" name="newPass"
											id="newPass"></td>
									</tr>
									<tr>
										<th>새 비밀번호 확인</th>
										<td align="center"><input type="password"
											name="newPassCkeck" id="newPassCkeck"></td>
									</tr>
								</table>
								<div>
								<br>
									<input class="btn btn-danger btn-round-full" type="submit"
										value="비밀번호 변경"> <input type="hidden" name="email"
										id="email" value="${email}">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
		<script type="text/javascript">
			function memberPassUpdate() {
				if (document.getElementById('newPass').value != ''
						&& document.getElementById('newPassCkeck').value != '') {
					if (document.getElementById('newPass').value != document
							.getElementById('newPassCkeck').value) {
						alert("비밀번호가 일치하지않습니다 다시 확인해주세요");
						return false;
					} else {
						location.reload();
						alert("비밀번호 변경 완료");
						return true;
					}
				}

			}
		</script>
</body>
</html>