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
<title>Channels</title>
<script language="JavaScript" src="https://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
<script language="JavaScript" src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script language="JavaScript" src="https://cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.js" type="text/javascript"></script>
<script src="js/updateChannelID.js"></script>
<script src="js/createChannel.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/channel.css">
<script>
$(document).ready(function() {
    $('#datatable').dataTable();
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
<title>Set Top Box Dashboard</title>
</head>
<body>

<div align="center" class="refresh-container">
	<form name="form1" action="HomeController" >
		<input type="hidden" name="option" value="SetTopBoxInformation">
		<button class="btn btn-primary" type = "submit">Refresh</button>
	</form>
</div>

<div class="container">
	<div class="row">
		<h2 class="text-center">Set Top Box Dashboard</h2>
	</div>
    
	<div class="row">
		<div class="col-md-12" style="padding:5px;">
  			<table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
  				<thead>
					<tr>
						<%--<th>Serial #</th>--%>
						<th>Type</th>
						<th>Dimensions</th>
						<th>Price</th>
						<th>Installation Charge</th>
						<th>Upgrade Charge</th>
						<th>Mac ID</th>
                       	<th>Control Asset ID</th>
                        <th>Billing Type</th>
                        <th>Discount</th>
                        <th>Dish Asset ID</th>
                        <th>Refundable Deposit</th>
                        <th>Status</th>
                        <th>Inventory Details CSV</th>
                       	<th>Edit</th>
                        <th>Delete</th>                                                                                                                                                
					</tr>
				</thead>			
					
				<tbody>	
					<c:forEach items="${setTopBoxInf}" var="settopbox">
                		<tr>
                    		<%--<td><c:out value="${settopbox.serialNumber}" /></td>--%>
                    		<td><c:out value="${settopbox.type}" /></td>
                    		<td><c:out value="${settopbox.dimensions}" /></td>
                    		<td><c:out value="${settopbox.price}" /></td>
                    		<td><c:out value="${settopbox.installation_charges}" /></td>
                    		<td><c:out value="${settopbox.upgradation_charges}" /></td>
                    		<td><c:out value="${settopbox.mac_id}" /></td>
                    		<td><c:out value="${settopbox.control_asset_id}" /></td>
                    		<td><c:out value="${settopbox.billing_type}" /></td>
                    		<td><c:out value="${settopbox.discount}" /></td>
                    		<td><c:out value="${settopbox.dish_asset_id}" /></td>
                    		<td><c:out value="${settopbox.refundable_deposit}" /></td>
                    		<td><c:out value="${settopbox.status}" /></td>
                    		<td><c:out value="${settopbox.inventory_details}" /></td>
		                    <input type = "hidden" name = "updateID" value = "${settopbox.serialNumber} ">                   
		                    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs editChannel" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td> 
		    			    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs removeChannel" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>                    				 
             			</tr> 
            		</c:forEach>
				</tbody>
			</table>		
		</div>
	</div>
</div>

<div align="center" class="add-container">
	<button onclick="location.href = 'CreateChannel.jsp';" id="myButton" class="btn btn-primary float-none submit-button" >Add Channel</button>
</div>
   
</body>
</html>