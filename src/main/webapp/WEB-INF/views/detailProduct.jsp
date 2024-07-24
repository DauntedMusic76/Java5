<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<form:form class="form" action="/detailproduct"
		modelAttribute="product" method="POST" enctype="multipart/form-data">
		<div style="margin-top: 20px;" class="row">
			<div class="col-sm-4">
				<div
					style="width: 300px; height: 250px; background-color: cyan; margin: 0 auto; padding: 0 auto;">
					<img style="width: 100%; height: 100%;" alt=""
						src="${pageContext.request.contextPath}/uploadImages/${product.image}"
						path="image">
				</div>
			</div>
			<div class="col-sm-8">
				<h1 style="color: red; font-weight: bold; margin-bottom: 20px">${product.productname}</h1>
				<hr>
				<h3 style="color: black;">${product.price}VNĐ</h3>
				<br>
				<p>Thông tin : ${product.details}</p>
				<p>Danh mục : ${product.category.categoryname}</p>
				<p>Hãng sản xuất : ${product.supplier.suppliername}</p>
				<button
					style="height: 40px; width: 100%; border: 1px solid red; background-color: red; color: white; margin-bottom: 10px">Mua
					Ngay</button>

				<button formaction="/detailproduct/add/${product.id}"
					style="height: 40px; width: 100%; border: 1px solid red; background-color: red; color: white; margin-bottom: 10px">Thêm
					Vào Giỏ Hàng</button>

			</div>
		</div>
	</form:form>
	<hr>
	<div
		style="padding: 0 20px 0 20px; color: white; background-color: rgb(192, 192, 192); margin: 20px 20px 20px 20px;"
		class="title">
		<h1>Sản Phẩm Khác</h1>
	</div>
	<div class="row">
		<c:forEach var="item" items="${items}" begin="0" end="3">
			<div
				style="width: 24%; height: 350px; margin-top: 30px; border: none;"
				class="card col-sm-3">
				<div style="background-color: white;" class="card-header">
					<img style="background-color: cyan; height: 175px; width: 100%;"
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
					<!-- <button
						style="height: 30px; width: 100%; border: 1px solid red; background-color: red; color: white">Thêm
						Vào Giỏ Hàng</button> -->
				</div>
			</div>
		</c:forEach>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>