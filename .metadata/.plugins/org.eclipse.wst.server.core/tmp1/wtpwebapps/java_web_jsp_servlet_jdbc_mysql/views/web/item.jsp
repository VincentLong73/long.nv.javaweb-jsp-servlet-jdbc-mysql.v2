<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item</title>
</head>
<body>
	<!-- Page Content -->
 
<div class="layout" style="background-color: #696969;">

		<div class="row">

			<div class="col-lg-4">
				<h1 class="my-4 text-center">${model.title}</h1>
				<div class="col-sm-1"></div>
				<div class="col-sm-12">
				<div class="list-group">
				<div class="zoom"></div>
						<br>
					<img class="card-img-top img-fluid"
						src="${model.thumbnail}" alt="">
						<br>
					<img class="card-img-top img-fluid"
						src="${model.thumbnail}" alt="">
				</div>
				</div>
			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-8">

				<div class="card mt-4">
					<img class="card-img-top img-fluid"
						src="${model.thumbnail}" alt="">
					<div class="card-body">
						<h3 class="card-title">${model.title}</h3>
						<h4>$24.99</h4>
						<span class="text-warning">&#9733; &#9733; &#9733; &#9733;
							&#9734;</span> 4.0 stars
						<p class="card-text">${model.content}</p>
						
					</div>
				</div>
				<!-- /.card -->

				<div class="card card-outline-secondary my-4">
					<div class="card-header" ><h5><b>Product Reviews</b></h5></div>
					<div class="card-body">
					<c:forEach var="item" items="${commentModel.listResult}" varStatus="user">
						<h6>${item.content}</h6>
						<small class="text-muted">Posted by ${userModel.listResult[user.index].userName}</small>
						<small class="text-muted">at ${item.createdDate}</small>
						<hr>
					</c:forEach>
						<form class="form-horizontal" method="post">
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right"><b><i>Write Comment</i></b></label>
							<div class="col-sm-9" >
							<!-- <input type="text" id="content" name="content"/> -->
								<textarea rows="" cols="" id="content" name="content" style="width:820px;height:50px" ></textarea>
								<button type="submit" class="btn btn-primary" >Enter</button>
							</div>
						</div>
						</form>
						<div class="row">
							<div class="col-sm-9"></div>
							<div class="col-sm-3">
								<button type="button" class="btn btn-success" onclick="back_previous_page()">Previous Page</button>
							</div>
						</div>
					</div>
				<!-- /.card -->

			</div>
			<!-- /.col-lg-9 -->

		  </div> 

	</div>
	<!-- /.container -->
	
	<script>
	var editor='';
	$(document).ready(function(){
		editor=CKEDITOR.replace('content');
	});
	
		function back_previous_page(){
			history.back();
		}
	</script>
</div>
</body>
</html>