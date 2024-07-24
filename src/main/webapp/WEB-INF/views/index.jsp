<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<!-- Link to your custom CSS file -->
<link rel="stylesheet" href="css/Style.css">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<title>Insert title here</title>
</head>
<body>
	<div class="">
		<img class="" src="${pageContext.request.contextPath}/Images/images2.webp" alt=""
			style="width: 100%; max-width: 100%;">

	</div>
	<div class="container-fluid" style="height: 1220px; padding: 0;">

		<div>
			<nav
				class="navbar navbar-expand-lg navbar-dark bg-dark full-width-navbar">
				<a class="navbar-brand" href="#"></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav">
						<li class="nav-item active"><a class="nav-link" href="#"><span
								class="glyphicon glyphicon-home"></span>Trang Chủ</a></li>
						<li class="nav-item"><a class="nav-link" href="#"><span
								class="glyphicon glyphicon-th-list"></span> Giới Thiệu </a></li>
						<li class="nav-item"><a class="nav-link" href="#"><span
								class="glyphicon glyphicon-earphone"></span> Liên Hệ </a></li>

						<li class="nav-item"><a class="nav-link" href="#"><span
								class="glyphicon glyphicon-envelope"></span> Góp Ý </a></li>
						<li class="nav-item"><a class="nav-link" href="#"><span
								class="glyphicon glyphicon-question-sign"></span> Hỏi Đáp </a></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownMenuLink" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> <span
								class="glyphicon glyphicon-user"></span> Tài Khoản
						</a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<a class="dropdown-item" href="DangNhap.html"> Đăng Nhập </a> <a
									class="dropdown-item" href="DangKy.html"> Đăng Ký </a> <a
									class="dropdown-item" href="#"> Đăng xuất </a> <a
									class="dropdown-item" href="#"> Quên mật khẩu </a> <a
									class="dropdown-item" href="#"> Đổi mật khẩu </a> <a
									class="dropdown-item" href="#"> Cập nhật hồ sơ </a>
							</div></li>
					</ul>
				</div>


				<ul class="navbar-nav reverser">
					<li class="nav-item"><a class="nav-link active" href="#">Tiếng
							Anh</a></li>
					<li class="nav-item"><a class="nav-link " href="#"> Tiếng
							Việt </a></li>
				</ul>
			</nav>
		</div>

		<div class="row" style="height: 1000px; margin: 0;">

			<article class="col-sm-9">


				<div class="row" style="margin-top: 15px;">

					<div class="col-sm-3">
						<img src="${pageContext.request.contextPath}/images/s8.jpg" class="img-thumbnail" width="250px">
						<p style="text-align: justify; padding: 15px; text-align: center;">
							Loptop HP I7 <br>
							<button class="btn btn-success mx-auto d-block"
								style="text-align: center;" type="button"
								onclick="redirectToProductPage('Loptop HP I7 ', 'images/s8.jpg', '$10.900', 'Mô tả sản phẩm Loptop HP I7')">Mua
								Ngay</button>
						</p>

					</div>

					<div class="col-sm-3">
						<img src="${pageContext.request.contextPath}/images/s16.jpg" class="img-thumbnail" width="250px">
						<p style="text-align: justify; padding: 15px; text-align: center;">
							Loptop Asus vivo book <br>
							<button class="btn btn-success mx-auto d-block"
								style="text-align: center;" type="button"
								onclick="redirectToProductPage('Loptop Asus vivo book', 'images/s16.jpg', '$10.800', 'Mô tả sản phẩm  Loptop Asus vivo book')">Mua
								Ngay</button>
						</p>
					</div>

					<div class="col-sm-3">
						<img src="${pageContext.request.contextPath}/images/s12.jpg" class="img-thumbnail" width="250px">
						<p style="text-align: justify; padding: 15px; text-align: center;">
							Loptop ASUS I5 <br>
							<button class="btn btn-success mx-auto d-block"
								style="text-align: center;" type="button"
								onclick="redirectToProductPage('Loptop ASUS I5', 'images/s12.jpg', '$12.900', 'Mô tả sản phẩm Loptop ASUS I5')">Mua
								Ngay</button>
						</p>
					</div>

					<div class="col-sm-3">
						<img src="${pageContext.request.contextPath}/images/s11.jpg" class="img-thumbnail" width="250px">
						<p style="text-align: justify; padding: 15px; text-align: center;">
							Macbook <br>
							<button class="btn btn-success mx-auto d-block"
								style="text-align: center;" type="button"
								onclick="redirectToProductPage('Macbook ', 'images/s11.jpg', '$32.500', 'Mô tả sản phẩm Macbook')">Mua
								Ngay</button>
						</p>
					</div>

					<div class="col-sm-3">
						<img src="${pageContext.request.contextPath}/images/s2.jpg" class="img-thumbnail" width="250px">
						<p style="text-align: justify; padding: 15px; text-align: center;">
							Iphone 12 <br>
							<button class="btn btn-success mx-auto d-block"
								style="text-align: center;" type="button"
								onclick="redirectToProductPage('Iphone 12', 'images/s2.jpg', '$18.200', 'Mô tả sản phẩm Iphone 12')">Mua
								Ngay</button>
						</p>
					</div>

					<div class="col-sm-3">
						<img src="${pageContext.request.contextPath}/images/s1.jpg" class="img-thumbnail" width="250px">
						<p style="text-align: justify; padding: 15px; text-align: center;">
							Iphone 12 Promax <br>
							<button class="btn btn-success mx-auto d-block"
								style="text-align: center;" type="button"
								onclick="redirectToProductPage('Iphone 12 Promax', 'images/s1.jpg', '$19.600', 'Mô tả sản phẩm Iphone 12 Promax')">Mua
								Ngay</button>
						</p>
					</div>

					<div class="col-sm-3">
						<img src="${pageContext.request.contextPath}/images/s4.jpg" class="img-thumbnail" width="250px">
						<p style="text-align: justify; padding: 15px; text-align: center;">
							Iphone 13 Pro <br>
							<button class="btn btn-success mx-auto d-block"
								style="text-align: center;" type="button"
								onclick="redirectToProductPage('Iphone 13 Pro', 'images/s4.jpg', '$20.100', 'Mô tả sản phẩm  Iphone 13 Pro ')">Mua
								Ngay</button>
						</p>
					</div>

					<div class="col-sm-3">
						<img src="${pageContext.request.contextPath}/images/s9.jpg" class="img-thumbnail" width="250px">
						<p style="text-align: justify; padding: 15px; text-align: center;">
							Iphone 13 Promax <br>
							<button class="btn btn-success mx-auto d-block"
								style="text-align: center;" type="button"
								onclick="redirectToProductPage('Iphone 13 Promax', 'images/s9.jpg', '$22.500', 'Mô tả sản phẩm Iphone 13 Promax')">Mua
								Ngay</button>
						</p>
					</div>


					<div class="col-sm-3">
						<img src="${pageContext.request.contextPath}/images/s-ip15.jpg" class="img-thumbnail" width="250px">
						<p style="text-align: justify; padding: 15px; text-align: center;">
							Iphone 15 Promax 256GB <br>
							<button class="btn btn-success mx-auto d-block"
								style="text-align: center;" type="button"
								onclick="redirectToProductPage(' Iphone 15 Promax 256GB', 'images/s-ip15.jpg', '$28.900', 'Mô tả sản phẩm Iphone 15 Promax 256GB')">Mua
								Ngay</button>
						</p>
					</div>

					<div class="col-sm-3">
						<img src="${pageContext.request.contextPath}/images/s-ip14.jpg" class="img-thumbnail" width="250px">
						<p style="text-align: justify; padding: 15px; text-align: center;">
							Iphone 14 Promax 256GB <br>
							<button class="btn btn-success mx-auto d-block"
								style="text-align: center;" type="button"
								onclick="redirectToProductPage('Iphone 14 Promax 256GB', 'images/s-ip14.jpg', '$25.200', 'Mô tả sản phẩm Iphone 14 Promax 256GB')">Mua
								Ngay</button>
						</p>
					</div>

					<div class="col-sm-3">
						<img src="${pageContext.request.contextPath}/images/s-samsung.webp" class="img-thumbnail"
							width="250px">
						<p style="text-align: justify; padding: 15px; text-align: center;">
							SamSung S24 Ultra <br>
							<button class="btn btn-success mx-auto d-block"
								style="text-align: center;" type="button"
								onclick="redirectToProductPage('SamSung S24 Ultra', 'images/s-samsung.webp', '$30.000', 'Mô tả sản phẩm SamSung S24 Ultra')">Mua
								Ngay</button>
						</p>
					</div>

					<div class="col-sm-3">
						<img src="${pageContext.request.contextPath}/images/s-reami.webp" class="img-thumbnail" width="250px">
						<p style="text-align: justify; padding: 15px; text-align: center;">
							Redmi 128GB <br>
							<button class="btn btn-success mx-auto d-block"
								style="text-align: center;" type="button"
								onclick="redirectToProductPage('Redmi 128GB', 'images/s-reami.webp', '$10.200', 'Mô tả sản phẩm Redmi 128GB')">Mua
								Ngay</button>
						</p>
					</div>

					<div class="col-sm-3">
						<img src="${pageContext.request.contextPath}/images/tivi-soni.jpg" class="img-thumbnail"
							width="250px">
						<p style="text-align: justify; padding: 15px; text-align: center;">
							Tivi Sony 40 Inch <br>
							<button class="btn btn-success mx-auto d-block"
								style="text-align: center;" type="button"
								onclick="redirectToProductPage('Tivi Sony 40 Inch', 'images/tivi-soni.jpg', '$20.500', 'Mô tả sản phẩm Tivi Sony 40 Inch')">Mua
								Ngay</button>
						</p>
					</div>

					<div class="col-sm-3">
						<img src="${pageContext.request.contextPath}/images/s5.jpg" class="img-thumbnail" width="250px">
						<p style="text-align: justify; padding: 15px; text-align: center;">
							Tivi TCL 40 Inch <br>
							<button class="btn btn-success mx-auto d-block"
								style="text-align: center;" type="button"
								onclick="redirectToProductPage('Tivi TCL 40 Inch', 'images/s5.jpg', '$22.500', 'Mô tả sản phẩm Tivi TCL 40 Inch')">Mua
								Ngay</button>
						</p>
					</div>

					<div class="col-sm-3">
						<img src="${pageContext.request.contextPath}/images/s14.png" class="img-thumbnail" width="250px">
						<p style="text-align: justify; padding: 15px; text-align: center;">
							Tivi SamSung 42 Inch <br>
							<button class="btn btn-success mx-auto d-block"
								style="text-align: center;" type="button"
								onclick="redirectToProductPage('Tivi SamSung 42 Inch', 'images/s14.png', '$22.900', 'Mô tả sản phẩm Tivi SamSung 42 Inch')">Mua
								Ngay</button>
						</p>
					</div>

					<div class="col-sm-3">
						<img src="${pageContext.request.contextPath}/images/s13.jpg" class="img-thumbnail" width="250px">
						<p style="text-align: justify; padding: 15px; text-align: center;">
							Tivi Panasonic 40 Inch <br>
							<button class="btn btn-success mx-auto d-block"
								style="text-align: center;" type="button"
								onclick="redirectToProductPage('Tivi Panasonic 40 Inch', 'images/s13.jpg', '$25.900', 'Mô tả sản phẩm Tivi Panasonic 40 Inch')">Mua
								Ngay</button>
						</p>
					</div>



				</div>

			</article>

			<aside class="col-sm-3">
				<div class="card poly-cart" style="margin-top: 20px;">
					<div class="card-body">
						<div class="row">
							<div class="col-sm-5">
								<a href="GioHang.html"> <img class="img-thumbnail"
									src="${pageContext.request.contextPath}/Images/shoppingcart.gif" alt="Giỏ Hàng" width="70">
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
							<form action="" style="margin-left: 15px;">
								<input type="text" class="form-control" placeholder="Keywords">
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

				<div class="card poly-cart" data-toggle="collapse"
					href="#nhacungcap">
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

			</aside>

		</div>


	</div>



	<footer>
		<div class="card text-center">
			<div style="width: 100%;">
				<img src="${pageContext.request.contextPath}/images/foodter2.webp" width="100%" alt="">
				<div
					style="position: absolute; height: 50px; display: flex; margin-top: 30px;">
					<p>---FPT Shop mua bán điện thoại, loptop, phụ kiện,... thế hệ
						mới --- Địa chỉ : 100 Công viên phần mềm Quang Trung, Tân Chánh
						Hiệp, Quận 12, TP.Hồ Chí Minh</p>
					<p>Tổng đài hỗ trợ (Miễn phí gọi) Gọi mua: 1800.1060 (7:30 -
						22:00) Khiếu nại: 1800.1062 (8:00 - 21:30) Bảo hành: 1800.1064
						(8:00 - 21:00)</p>
				</div>
			</div>
		</div>
	</footer>

	<script>
		function redirectToProductPage(productName, imageUrl, price,
				description) {
			localStorage.setItem('productName', productName);
			localStorage.setItem('imageUrl', imageUrl);
			localStorage.setItem('price', price);
			localStorage.setItem('description', description);
			window.location.href = 'SanPham1.html';
		}
	</script>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script src="<c:url value='/views/images/' />"></script>
</body>
</html>