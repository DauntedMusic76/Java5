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
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/CSS/ItemManament.css"> --%>
<link rel="stylesheet" href="/css/ItemManament.css">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<title>Insert title here</title>
</head>
<body>
	<%-- <div class="container-fluid">
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
						<li class="nav-item"><a class="nav-link" href="#">Sản
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
								<li><a class="dropdown-item" href="#">Đăng Nhập / Đăng
										Kí</a></li>
								<li><a class="dropdown-item" href="#">Quên Mật Khẩu</a></li>
								<li><a class="dropdown-item" href="#">Thông Tin Tài
										Khoản</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="#">Đăng Xuất</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav> --%>
	<%@include file="menu.jsp"%>

	<div class="ItemManament">
		<form:form class="form" action="/itemmanament/index"
			modelAttribute="product" method="POST" enctype="multipart/form-data">
			<div class="row">
				<h1 style="">Item Manament</h1>
				<div class="col-sm-4">
					<div
						style="width: 300px; height: 250px; background-color: cyan; margin: 0 auto; padding: 0 auto;"
						class="anhThoDMM">
						<img style="width: 100%; height: 100%;" alt=""
							src="${pageContext.request.contextPath}/uploadImages/${product.image}"
							path="image">
					</div>
				</div>
				<div class="col-sm-8">

					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">Product
							name</span>
						<form:input type="text" class="form-control"
							placeholder="Product name" path="productname"
							aria-describedby="basic-addon1" />
					</div>
					<br>
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon2">Price</span>
						<form:input type="number" class="form-control" placeholder="Price"
							path="price" aria-describedby="basic-addon2" />
						<span class="input-group-text" id="basic-addon2">VNĐ</span>
					</div>
					<br>
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon3">Quantity</span>
						<form:input type="number" class="form-control"
							placeholder="Quantity" path="quantity"
							aria-describedby="basic-addon3" />
					</div>
					<br>
					<div class="input-group mb-3">
						<label class="input-group-text" for="inputGroupSelect01">Category</label>
						<form:select class="form-select" path="category.id"
							id="inputGroupSelect01">
							<option value="">Select Category</option>
							<c:forEach var="category" items="${categoryItem}">
								<option value="${category.id}"
									<c:if test="${category.id == product.category.id}">selected</c:if>>${category.categoryname}</option>
							</c:forEach>
						</form:select>
					</div>
					<br>
					<div class="input-group mb-3">
						<label class="input-group-text" for="inputGroupSelect02">Supplier</label>
						<form:select class="form-select" path="supplier.id"
							id="inputGroupSelect02">
							<option value="">Select Supplier</option>
							<c:forEach var="supplier" items="${supplierItem}">
								<option value="${supplier.id}"
									<c:if test="${supplier.id == product.supplier.id}">selected</c:if>>${supplier.suppliername}</option>
							</c:forEach>
						</form:select>
					</div>
					<br>
					<%-- <div class="input-group mb-3">
							<label class="input-group-text" for="inputGroupSelect03">Discount</label>
							<select class="form-select" id="inputGroupSelect03">
								<option value="">Select discount</option>
								<c:forEach var="item" items="${discountItem}">
									<option value="${item.id}">${item.discountpercent}</option>
								</c:forEach>
							</select>
						</div> --%>
					<br> Available:
					<form:radiobutton name="available" path="available" value="true" />
					Show
					<form:radiobutton name="available" path="available" value="false" />
					Hidden <br> <br> Image: <input type="file" name="attach">
					<br> <br>
					<div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label">Details</label>
						<form:textarea class="form-control"
							id="exampleFormControlTextarea1" path="details" rows="3"></form:textarea>
					</div>
					<div style="margin-bottom: 10px">
						<button class="btn btn-primary" formaction="/itemmanament/product/create">Create</button>
						<button class="btn btn-danger" formaction="/itemmanament/product/delete/${product.id}">Delete</button>
						<button class="btn btn-warning" formaction="/itemmanament/product/update/${product.id}">Update</button>
						<button class="btn btn-secondary" formaction="/itemmanament/product/create">Clear</button>
					</div>

				</div>
			</div>
		</form:form>
		<div class="table">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Id</th>
						<th>Product name</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Category</th>
						<th>Supplier</th>
						<th>Available</th>
						<th>Image</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${items}">
						<tr>
							<td>${item.id}</td>
							<td>${item.productname}</td>
							<td>${item.price}</td>
							<td>${item.quantity}</td>
							<td>${item.category.id}</td>
							<td>${item.supplier.id}</td>
							<td>${item.available}</td>
							<td>${item.image}</td>
							<td><a href="/itemmanament/product/edit/${item.id}"><button
										type="submit" class="btn btn-warning">Edit</button></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<form action="/itemmanament/index/export" method="get">
				<button type="submit" class="btn btn-primary">Export to
					Excel</button>
			</form>
		</div>
	</div>

	<hr>

	<div class="category">
		<div class="row">
			<div class="col-sm-6">
				<h1>Category</h1>
				<form:form action="/itemmanament/index" modelAttribute="category">
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">Catogory
							name </span>
						<form:input type="text" class="form-control"
							placeholder="Category name" aria-label="" path="categoryname"
							aria-describedby="basic-addon1" />
					</div>
					<div>
						<button class="btn btn-primary" formaction="/itemmanament/category/create">Create</button>
						<button class="btn btn-danger" formaction="/itemmanament/category/delete/${category.id}">Delete</button>
						<button class="btn btn-warning" formaction="/itemmanament/category/update/${category.id}">Update</button>
						<button class="btn btn-secondary" formaction="/itemmanament/category/create">Clear</button>
					</div>
				</form:form>
			</div>
			<div class="col-sm-6 table-container">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Id</th>
							<th>Category Name</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item1" items="${categoryItem}">
							<tr>
								<td>${item1.id}</td>
								<td>${item1.categoryname}</td>
								<td><a href="/itemmanament/category/edit/${item1.id}" class="btn btn-warning">Edit</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-sm-6">
				<h1>Supplier</h1>
				<form:form action="/itemmanament/index" modelAttribute="supplier">
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">Supplier
							name </span>
						<form:input type="text" class="form-control"
							placeholder="Category name" aria-label="" path="suppliername"
							aria-describedby="basic-addon1" />
					</div>
					<div>
						<button class="btn btn-primary" formaction="/itemmanament/supplier/create">Create</button>
						<button class="btn btn-danger" formaction="/itemmanament/supplier/delete/${supplier.id}">Delete</button>
						<button class="btn btn-warning" formaction="/itemmanament/supplier/update/${supplier.id}">Update</button>
						<button class="btn btn-secondary" formaction="/itemmanament/supplier/create">Clear</button>
					</div>
				</form:form>
			</div>
			<div class="col-sm-6 table-container">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Id</th>
							<th>Supplier Name</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item2" items="${supplierItem}">
							<tr>
								<td>${item2.id}</td>
								<td>${item2.suppliername}</td>
								<td><a href="/itemmanament/supplier/edit/${item2.id}" class="btn btn-warning">Edit</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-sm-6">
				<h1>Discount</h1>
				<form:form action="/itemmanament/index" modelAttribute="discount">
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">Start date
						</span>
						<form:input type="text" class="form-control"
							placeholder="Category name" aria-label="" path="startdate"
							aria-describedby="basic-addon1" />
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">End date </span>
						<form:input type="text" class="form-control"
							placeholder="Category name" aria-label="" path="enddate"
							aria-describedby="basic-addon1" />
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">Discount
							percent </span>
						<form:input type="text" class="form-control"
							placeholder="Category name" aria-label="" path="discountpercent"
							aria-describedby="basic-addon1" />
					</div>
					<div>
						<button class="btn btn-primary" formaction="/itemmanament/discount/create">Create</button>
						<button class="btn btn-danger" formaction="/itemmanament/discount/delete/${discount.id}">Delete</button>
						<button class="btn btn-warning" formaction="/itemmanament/discount/update/${discount.id}">Update</button>
						<button class="btn btn-secondary" formaction="/itemmanament/discount/create">Clear</button>
					</div>
				</form:form>
			</div>
			<div class="col-sm-6 table-container">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Id</th>
							<th>Start date</th>
							<th>End date</th>
							<th>Discount percent</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item3" items="${discountItem}">
							<tr>
								<td>${item3.id}</td>
								<td>${item3.startdate}</td>
								<td>${item3.enddate}</td>
								<td>${item3.discountpercent}</td>
								<td><a href="/itemmanament/discount/edit/${item3.id}" class="btn btn-warning">Edit</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</div>







	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>