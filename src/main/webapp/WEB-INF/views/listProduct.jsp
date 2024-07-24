<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/webapp/WEB-INF/views/css/listProduct">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<title>Insert title here</title>
</head>
<body>
	<%@include file="menu.jsp"%>
	<div class="row">
		<div style="" class="col-sm-9">
			<div
				style="padding: 0 20px 0 20px; background-color: green; margin: 20px 20px 20px 20px;"
				class="title">
				<h1>Giảm Giá</h1>
			</div>
			<div
				style="background-color: white; width: 24%; height: 300px; margin-botton: 10px;"
				class="card">
				<div class="card-header">
					<img style="background-color: cyan; height: 150px; width: 100%;"
						alt="" src="#">
				</div>
				<div style="height: 200px" class="card-body"></div>
				<div style="height: 40px" class="card-footer"></div>
			</div>

			<div
				style="padding: 0 20px 0 20px; color: white; background-color: rgb(192, 192, 192); margin: 20px 20px 20px 20px;"
				class="title">
				<h1>Sản Phẩm</h1>
			</div>
			<div class="row">
				<c:forEach var="item" items="${items}">
					<div
						style="width: 24%; height: 350px; margin-top: 30px; border: none;"
						class="card col-sm-3">
						<div style="background-color: white;" class="card-header">
							<img style="background-color: cyan; height: 150px; width: 100%;"
								alt=""
								src="${pageContext.request.contextPath}/uploadImages/${item.image}">
						</div>
						<div style="height: 250px; background-color: white; border: none;"
							class="card-body">
							<a style="text-decoration: none;">${item.productname}</a> <br>
							<a style="text-decoration: none;">Giá: ${item.price}</a>

						</div>
						<div style="height: 100px !important; background-color: white;"
							class="card-footer">
							<a href="/detailproduct/${item.id}">
								<button
									style="height: 30px; width: 100%; margin-bottom: 5px; border: 1px solid red; background-color: red; color: white">Xem
									Sản Phẩm</button>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div style="" class="col-sm-3">
			<div class="card poly-cart" style="margin-top: 20px;">
				<div class="card-body">
					<div class="row">
						<div class="col-sm-5">
							<a href="GioHang.html"> <img class="img-thumbnail"
								src="${pageContext.request.contextPath}/Images/shoppingcart.gif"
								alt="Giỏ Hàng" width="70">
							</a>
						</div>
						<div class="col-sm-6">
							<ul>
								<li>100 item</li>
								<li>$56.5</li>
								<li><a href=""> VIEW CART</a></li>

							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="card poly-cart">
				<div class="card-body">
					<div class="row">
						<form action="/listproduct" style="margin-left: 15px;">
							<input type="text" name="itemname" class="form-control" placeholder="Keywords">
							<button formaction="/listsearch">Tìm Kiếm</button>
						</form>
					</div>
				</div>
			</div>

			<div class="card poly-cart" data-toggle="collapse" href="#chungloai">
				<div class="card-header">
					<span class=" glyphicon glyphicon-th-list"></span> Chủng Loại
				</div>

				<ul class="list-group list-group-flush card-collapse "
					id="chungloai">
					<li class="list-group-item ">Lop Top</li>
					<li class="list-group-item ">Điện Thoại</li>
					<li class="list-group-item ">Bàn Phím</li>
					<li class="list-group-item ">Chuột</li>

				</ul>

			</div>

			<div class="card poly-cart" data-toggle="collapse"
				href="#hangdacbiet">
				<div class="card-header">
					<span class=" glyphicon glyphicon-th-list"></span> Hàng Đặc Biệt
				</div>

				<ul class="list-group list-group-flush card-collapse "
					id="hangdacbiet">
					<li class="list-group-item ">Hàng bán chạy</li>
					<li class="list-group-item ">Hàng mới</li>
					<li class="list-group-item ">Hàng giảm giá</li>
					<li class="list-group-item ">Hàng đặt biệt</li>
					<li class="list-group-item ">Hàng xem nhiều</li>
				</ul>

			</div>

			<div class="card poly-cart" data-toggle="collapse" href="#nhacungcap">
				<div class="card-header">
					<span class=" glyphicon glyphicon-th-list"></span> Nhà Cung Cấp
				</div>

				<ul class="list-group list-group-flush card-collapse "
					id="nhacungcap">
					<li class="list-group-item ">SONY</li>
					<li class="list-group-item ">ASUS</li>
					<li class="list-group-item ">ACER</li>
					<li class="list-group-item ">DELL</li>
					<li class="list-group-item ">MACBOOK</li>
				</ul>

			</div>

		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>