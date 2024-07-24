<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<img style="width: 100%;" alt=""
			src="${pageContext.request.contextPath}/Images/images2.webp">
	</div>
	<div class="container">
		<div style="height: 100px;" class="row">
			<div class="col-sm-3">
				<img alt="" src="">
			</div>
			<div class="col-sm-9"></div>
		</div>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">Trang Chủ</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
					aria-controls="navbarNavDropdown" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="#">Giới
								Thiệu</a></li>
						<li class="nav-item"><a class="nav-link" href="/listproduct">Sản
								Phẩm</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Góp Ý</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Hỏi Đáp</a>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownMenuLink" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">Tài Khoản</a>
							<ul class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<li><a class="dropdown-item" href="/login">Đăng Nhập </a></li>
								<li><a class="dropdown-item" href="/register"> Đăng Kí</a></li>
								<c:if test="${checkCart}"><li><a class="dropdown-item" href="/cart/index">Giỏ Hàng</a></li></c:if>
								<li><a class="dropdown-item" href="#">Thông Tin Tài
										Khoản</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="/logout">Đăng Xuất</a></li>
							</ul></li>
						<c:if test="${isAdmin}">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#"
								id="navbarDropdownMenuLink" role="button"
								data-bs-toggle="dropdown" aria-expanded="false">Admin</a>
								<ul class="dropdown-menu"
									aria-labelledby="navbarDropdownMenuLink">
									<li><a class="dropdown-item" href="/itemmanament/index">Danh
											Sách Sản Phẩm</a></li>
									<li><a class="dropdown-item" href="/account/ThongTinNguoiDung2">Danh
											Sách Người Dùng</a></li>
								</ul></li>
						</c:if>
					</ul>
				</div>
				<form action="" class="d-flex" style="color: white">Hello :
					${username}</form>
			</div>
		</nav>
</body>
</html>