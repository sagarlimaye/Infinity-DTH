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
<script><!-- Creating a dummy channel array. Replace this later by DB objects

var channel1 = {Name:"HBO",Band:"Type 1",Audio_Frequency:2.3, Video_Frequency:1.3,Charge_Type:"FTA",Transmission_Type:"STD",charge:"50$"
};

var channel2 = {Name:"HBO",Band:"Type 1",Audio_Frequency:2.3, Video_Frequency:1.3,Charge_Type:"FTA",Transmission_Type:"STD",charge:"50$"
};
var channel3 = {Name:"HBO",Band:"Type 1",Audio_Frequency:2.3, Video_Frequency:1.3,Charge_Type:"FTA",Transmission_Type:"STD",charge:"50$"
};

-->


</script>
<title>Insert title here</title>
<script language="JavaScript" src="https://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
<script language="JavaScript" src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script language="JavaScript" src="https://cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.css">
<script>
$(document).ready(function() {
    $('#datatable').dataTable();
    
     $("[data-toggle=tooltip]").tooltip();
    
} );
</script>
</head>
<body>
<form name="form1" action="HomeController" >
<input type="hidden" name="option" value="ChannelInformation">
<button type = "submit">Information</button>
</form>
<div class="container">
	<div class="row">
		<h2 class="text-center">Channel Dashboard</h2>
	</div>
    
        <div class="row">
		
            <div class="col-md-12" style="width:500px;height:250px;line-height:3em;overflow:scroll;padding:5px;">
  
            
<table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
    				<thead>
						<tr>
							<th>Channel</th>
							<th>Band</th>
							<th>Video Frequency</th>
							<th>Audio Frequency</th>
							<th>Charge Type</th>
							<th>Transmission Type</th>
							<th>Channel Charge</th>
                             	<th>Edit</th>
                                 <th>Delete</th>
						</tr>
					</thead>			
					
					<tbody>	
					<c:forEach items="${channelInf}" var="channel">
                <tr>
                    <td><c:out value="${channel.name}" /></td>
                    <td><c:out value="${channel.band}" /></td>
                    <td><c:out value="${channel.videoFreq}" /></td>
                    <td><c:out value="${channel.audioFreq}" /></td>
                     <td><c:out value="${channel.chargeType}" /></td>
                    <td><c:out value="${channel.transmissionType}" /></td>
                    <td><c:out value="${channel.charge}" /></td>
                    
                    
                      <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td> 
    				  <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td> 
             </tr> 
            </c:forEach>
					
					</tbody>
					</table>
				
	
	</div>
	</div>
</div>

<div align="center" class="add-container">
 <button onclick="location.href = 'CreateChannel.jsp';" id="myButton" class="float-none submit-button" >Add Channel</button>
</div>

<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
      </div>
      <div class="modal-body">
          <div class="form-group">
             <input class="form-control " type="text" placeholder="Channel Name">
          </div>
          <div class="form-group">
             <input class="form-control " type="text" placeholder="Channel Band">
          </div>
          <div class="form-group">
             <input class="form-control " type="number" placeholder="Video Carrier Frequency">
          </div>
          <div class="form-group">
             <input class="form-control " type="number" placeholder="Audio Carrier Frequency">
          </div>
          <div class="form-group">
             <input class="form-control " type="text" placeholder="Channel Charge Type">
          </div>
          <div class="form-group">
             <input class="form-control " type="text" placeholder="Channel Transmission Type">
          </div>
          <div class="form-group">
             <input class="form-control " type="number" placeholder="Channel Charge">
          </div>
      </div>
          <div class="modal-footer ">
            <button type="button" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
         </div>
     </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
    
    
    
    <div class="modal fade" id="delete" role="dialog" >
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
      </div>
          <div class="modal-body">
       
       <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>
       
      </div>
        <div class="modal-footer ">
        <button type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" ><span class="glyphicon glyphicon-remove"></span> No</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
    
   
</body>
</html>