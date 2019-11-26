<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Admin.jsp"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<title>Categories</title>
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.css">
<script>
$(document).ready(function() {
    $('#datatable').dataTable();
    
     //$("[data-toggle=tooltip]").tooltip();
    
} );
</script>
<style type="text/css">
body{
background-image: url("1.jpg");
 height: 500px;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;

}
</style>

</head>
<body>
<div class = "myform">
<form name="viewform" action="HomeController" method = "get" >
<input type="hidden" name="option" value="ViewCategory">
<button class="btn btn-primary" type = "submit">Refresh</button>
</form>
</div>
<div class="container">
	<div class="row">
		<h2 class="text-center">Category Dashboard</h2>
	</div>
    
        <div class="row">
		
            <div class="col-md-12" style="width:500px;height:250px;line-height:3em;overflow:scroll;padding:5px;">
  
            
				<table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
    				<thead>
						<tr>
							<th>Name</th>
							<th>Min channels</th>
							<th>Max channels</th>
						</tr>
					</thead>			
					
					<tbody>	
					<c:forEach items="${categoryInf}" var="category">
               		<tr>
                    <td><c:out value="${category.categoryName}" /></td>
                    <td><c:out value="${category.minChannels}" /></td>
                    <td><c:out value="${category.maxChannels}" /></td>                   
             		</tr> 
            		</c:forEach>
					
					</tbody>
					</table>
	</div>
	</div>
</div>

<div align="center" class="add-container">
 <button onclick="location.href = 'CreateCategory.jsp';" id="myButton" class="float-none submit-button" >Add Category</button>
</div>

</body>
</html>