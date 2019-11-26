<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Admin.jsp"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Packages</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="https://cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>

<script src="js/updatePackage.js"></script>
<script src="js/channelsToPackage.js"></script>
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
<form name="viewform" action="HomeController" method = "post" >
<input type="hidden" name="option" value="ViewPackage">
<button class="btn btn-primary" type = "submit">Refresh</button>
</form>
</div>
<div class="container">
	<div class="row">
		<h2 class="text-center">Package Dashboard</h2>
	</div>
    
        <div class="row">
		
            <div class="col-md-12" style="width:500px;height:250px;line-height:3em;overflow:scroll;padding:5px;">
  
            
				<table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
    				<thead>
						<tr>
							<th>Name</th>
							<th>Charging Type</th>
							<th>Transmission Type</th>
							<th>Cost</th>
							<th>Available From</th>
							<th>Available To</th>
							<th>Add By Default</th>
							<th>Channels</th>
                            <th>Edit</th>
                            <th>Delete</th>
						</tr>
					</thead>			
					
					<tbody>	
					<c:forEach items="${inf}" var="pac">
               		<tr>
                    <td><c:out value="${pac.name}" /></td>
                    <td><c:out value="${pac.chargingType}" /></td>
                    <td><c:out value="${pac.transmissionType}" /></td>
                    <td><c:out value="${pac.cost}" /></td>
                    <td><c:out value="${pac.availableFrom}" /></td>
                    <td><c:out value="${pac.availableTo}" /></td>
                    <td><c:out value="${pac.addedByDefault}" /></td>
                    <td class="channels">
	                    <c:forEach items="${channels}" var="channel">
	                    	<c:if test = "${pac.packageID == channel.packageId}">
	                    		<c:out value="${channel.name},"/>
	                    	</c:if>
	                    </c:forEach>
                    </td>
                    <input type = "hidden" name = "updateID" value = "${pac.packageID} ">                   
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
 <button onclick="location.href = 'HomeController?option=PrepareCreatePackage';" id="myButton" class="btn btn-primary float-none submit-button" >Add Package</button>
</div>

<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
      <form id="edit-form" action = "HomeController" method = "Post">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title custom_align" id="Heading">Edit Package</h4>
      </div>
      <div class="modal-body">
      	<div class="form-group">
				<input class="form-control " type="text" name = "packageName" placeholder="Package Name">
			</div>
			<div class="form-group">
	          	<div class="form-check-inline">
					<label class="form-check-label" for="radio1">
						<input type="radio" class="form-check-input" name="chargeType" value="paid">Paid by default
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label" for="radio2">
						<input type="radio" class="form-check-input" name="chargeType" value="fta">FTA
					</label>
				</div>
          	</div>
          	<div class="form-group">
	          	<div class="form-check-inline">
					<label class="form-check-label" for="radio1">
						<input type="radio" class="form-check-input" name="transmissionType" value="hd">HD
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label" for="radio2">
						<input type="radio" class="form-check-input" name="transmissionType" value="standard">Standard
					</label>
				</div>
          	</div>
          	<div class="form-group">
          		<div class="input-group">
		            <select class="selectpicker" name="channels" id="channelSelect" multiple>
		             
		            </select>
	            </div>
          	</div>
         	<div class="form-group">
            	<input class="form-control " type="text" name = "chargeCost" placeholder="Cost">
         	</div>
          	<div class="form-group">
             	<input class="form-control " type="date" name = "availableFrom" placeholder="Available From">
          	</div>
          	<div class="form-group">
            	<input class="form-control " type="date" name = "availableTo" placeholder="Available To">
          	</div>
			<div class="form-group">
	          	<div class="form-check-inline">
					<label class="form-check-label" for="radio1">
						<input type="radio" class="form-check-input" name="addedByDefault" value="true">Add by default
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label" for="radio2">
						<input type="radio" class="form-check-input" name="addedByDefault" value="false">Not added by default
					</label>
				</div>
          	</div>
      </div>
          <div class="modal-footer ">
			<input type = "hidden" name = "option" value = "UpdatePackage">
			<input type = "hidden" name = "package_Id">
            <button type="submit" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
         
         </div>
     </div>
     </form>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
    
    
    
    <div class="modal fade" id="delete" role="dialog" >
      <div class="modal-dialog">
      <form action = "HomeController" method = "post">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
      </div>
          <div class="modal-body">
       
       <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>
       
      </div>
        <div class="modal-footer ">
        <input type = "hidden" name = "option" value = "DeletePackage">
		<input type = "hidden" name = "remove_id">
        <button type="submit" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" ><span class="glyphicon glyphicon-remove"></span> No</button>
      </div>
       </form>
        </div>
       
    <!-- /.modal-content --> 
  </div>
    
<div class="channelList">
	<c:forEach items="${channels}" var="channel">
		<div class="channelItem" 
			 id="${channel.channel_id}"
			 data-band="${channel.band}" 
			 data-audioFreq="${channel.audioFreq}" 
			 data-videoFreq="${channel.videoFreq}"
			 data-chargeType="${channel.chargeType}"
			 data-transmissionType="${channel.transmissionType}"
			 data-charge="${channel.charge}"><c:out value="${channel.name}"/>
		</div>
	</c:forEach>
</div>
</body>
</html>