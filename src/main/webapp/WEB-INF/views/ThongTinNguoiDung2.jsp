<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<title>Insert title here</title>
<link rel="stylesheet" href="CSS/nguoidung.css">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- Bootstrap Bundle with Popper.js -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<!-- Popper.js -->
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
<jsp:include page="menu.jsp"/>
	<div class="nguoidung py-5 px-5">
		<div class="usemanage">
			<form:form action="/account/update" modelAttribute="item"
				method="post" enctype="multipart/form-data" class="row g-3">
					<div class="col-md-4">
					<img
						src="${pageContext.request.contextPath}/uploadimages/${item.photo}"
						class="img-fluid" id="photo">
				</div>
				<div class="col-md-8">
					<form:input path="id" type="hidden" />
					<div class="row mb-3">
						<div class="col-sm-3">
							<label for="username" class="col-form-label"
								style="margin-left: 60px">Username:</label>
						</div>
						<div class="col-sm-9">
							<form:input path="username" placeholder="Username ?"
								id="username" class="form-control" />
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-sm-3">
							<label for="username" class="col-form-label"
								style="margin-left: 60px">Password:</label>
						</div>
						<div class="col-sm-9">
							<form:input path="password" placeholder="password ?"
								id="password" class="form-control" />
						</div>
					</div>
					<div class="row mb-3">
					<div class="col-sm-3">
							<label for="username" class="col-form-label"
								style="margin-left: 60px">Email:</label>
						</div>
						<div class="col-sm-9">
							<form:input path="email" placeholder="email ?" id="email"
								class="form-control" />
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-sm-3">
							<label for="username" class="col-form-label"
								style="margin-left: 60px">Fullname:</label>
						</div>
						<div class="col-sm-9">
							<form:input path="fullname" placeholder="Fullname ?"
								id="fullname" class="form-control" />
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-sm-3">
							<label for="username" class="col-form-label"
								style="margin-left: 60px">Role:</label>
						</div>
						<div class="col-sm-9">
							<select id="roleid" name="roleid" class="form-select"
								style="width: 200px">
								<option value="1" ${item.roleid == 1 ? 'selected' : ''}>Admin</option>
								<option value="2" ${item.roleid == 2 ? 'selected' : ''}>Nhân viên</option>
								<option value="3" ${item.roleid == 3 ? 'selected' : ''}>Người dùng</option>
							</select>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-sm-3">
							<label for="username" class="col-form-label"
								style="margin-left: 60px">Photo:</label>
						</div>
						<div class="col-sm-9">
							<input type="file" name="attach" id="attach" class="form-control">
						</div>
					</div>
					<div style="margin-left: 500px">
						<button formaction="/account/create" class="btn btn-primary"
							style="width: 100px">Create</button>
						<button formaction="/account/update" class="btn btn-primary"
							style="width: 100px">Update</button>
						<button formaction="/account/delete/${item.id}"
							class="btn btn-danger" style="width: 100px">Delete</button>
						<button formaction="/account/clear" class="btn btn-secondary"
							style="width: 100px">Clear</button>
					</div>
				</div>
			</form:form>
		</div>

		<div class="usetable">
			<table class="table" style="margin-top: 50px; height: 100%;">
				<thead>
					<tr>
						<th scope="col">id</th>
						<th scope="col">Username</th>
						<th scope="col">Password</th>
						<th scope="col">Email</th>
						<th scope="col">Fullname</th>
						<th scope="col">Role</th>
						<th scope="col">Photo</th>
						<th scope="col"></th>
					</tr>
				</thead>

				<c:forEach var="item" items="${items}">
					<tr>
						<td>${item.id}</td>
						<td>${item.username}</td>
						<td>${item.password}</td>
						<td>${item.email}</td>
						<td>${item.fullname}</td>
						<td>${item.roleid}</td>
						<td>${item.photo}</td>
						<td><a href="/account/edit/${item.id}">Edit</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<form action="/ThongTinNguoiDung2/export" method="get">
				<button type="submit" class="btn btn-primary">Export to
					Excel</button>
			</form>
	</div>










	<script>
		document
				.getElementById('attach')
				.addEventListener(
						'change',
						function() {
							var file = this.files[0];
							var reader = new FileReader();
							reader.onload = function(event) {
								document.getElementById('photo').src = event.target.result;
							}
							reader.readAsDataURL(file);
						});
	</script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>


	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
</body>
</html>