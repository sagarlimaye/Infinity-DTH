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
<title>Packages</title>
<!--  <script src="js/updateChannelID.js"></script>-->
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.css">
</head>
<body>
<form name="viewform" action="HomeController" >
<input type="hidden" name="option" value="ViewPackage">
<button class="btn btn-primary" type = "submit">Refresh</button>
</form>
<div class="container">
	<div class="row">
		<h2 class="text-center">Package Dashboard</h2>
	</div>          
				<table class="table table-striped table-bordered">
    				<thead>
						<tr>
							<th>Name</th>
							<th>Charging Type</th>
							<th>Transmission Type</th>
							<th>Cost</th>
<!-- 							<th>Available From</th> -->
<!-- 							<th>Available To</th> -->
							<th>Add By Default</th>
<!-- 							<th>Channels</th> -->
							
                             	<th>Edit</th>
                                 <th>Delete</th>
						</tr>
					</thead>			
					
					<tbody>	
					<c:forEach items="${inf}" var="package">
               		<tr>
                    <td><c:out value="${package.name}" /></td>
                    <td><c:out value="${package.chargingType}" /></td>
                    <td><c:out value="${package.transmissionType}" /></td>
                    <td><c:out value="${package.cost}" /></td>
                    <td><c:out value="${package.addedByDefault}" /></td> 
             </tr> 
            </c:forEach>
					
					</tbody>
					</table>
				
	
	</div>

 </body>
</html>