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
function addOption() { 
	 var ddl = document.getElementById("select1");
    var option = document.createElement("OPTION");
    option.innerHTML = document.getElementById("feature").value;
    option.value = document.getElementById("feature").value;
    ddl.options.add(option);
  //var optionText = document.getElementById("feature").value; 
  //window.alert(optionText);
  //var optionValue = document.getElementById("feature").value; 

   //$('#select1').append($('<option>').val(optionValue).text(optionText)); 
} 
function fun()
{
	 
        var ele = document.getElementsByName('box'); 
          
        for(i = 0; i < ele.length; i++) { 
            if(ele[i].checked) 
           	 {
           	 
           		
           		if(ele[i].value == "Standard")
           			{
           			document.getElementById("Upcharge").disabled = true;
           			}
           		else
           			{
           			document.getElementById("Upcharge").disabled = false;
           			}
           	 
           	 }
            
        } 
    
	
	}
function dis()
{
	 
        var ele = document.getElementsByName('billing'); 
          
        for(i = 0; i < ele.length; i++) { 
            if(ele[i].checked) 
           	 {
           	 
           		
           		if(ele[i].value == "Prepaid")
           			{
           			document.getElementById("refund").disabled = true;
           			}
           		else
           			{
           			document.getElementById("refund").disabled = false;
           			}
           	 
           	 }
            
        } 
    
	
	}
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
					    <th>Serial Number</th>
						<th>Type</th>
						<th>Features</th>
						<th>Dimensions</th>
						<th>Price</th>
						<th>Installation Charges</th>
						<th>Upgradation Charge</th>
						<th>Discount</th>
                       	<th>Billing Type</th>
                        <th>Refundable Deposit Amount</th>
					</tr>
				</thead>			
			
				<tbody>	
					<tr>
						<td>123456</td>
						<td>HD</td>
						<td>New</td>
						<td>25X23X22</td>
						<td>220</td>
						<td>20</td>
						<td>40</td>
						<td>20</td>
						<td>Billing Type</td>
						<td>50</td>
						<td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs editChannel" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td> 
    			        <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs removeChannel" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td> 
					</tr>
						
				</tbody>
			</table>		
		</div>
	</div>
</div>

<div align="center" class="add-container">
	<button onclick="location.href = '/HomeController?option=PrepareCreateSetTopBox';" id="myButton" class="btn btn-primary float-none submit-button" >Add Set Top Box</button>
</div>

<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
	<div class="modal-dialog">
		<form action = "HomeController" method = "Post">
	    	<div class="modal-content">
	          	<div class="modal-header">
	          		<h4 class="modal-title custom_align" id="Heading">Edit Set Top Box</h4>
		        	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	      		</div>
		      	<div class="modal-body" style=' max-height: calc(100vh - 210px);overflow-y:auto'>
		        	 <div class="form-group">
                                        <label for="name" class="cols-sm-2 control-label">Type</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                                <input type="radio" name="box" value="Standard" id="std" checked onclick="fun()" >Standard
                                                <input type="radio" name="box" value="HD" id="hd" onclick="fun()" >HD
                                                <input type="radio" name="box" value="HD+" id="hd+" onclick="fun()">HD+
                                                <input type="radio" name="box" value="IPTV" id="iptv" onclick="fun()">IPTV
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label  class="cols-sm-2 control-label">Features</label>
                                         <div class="cols-sm-10">
                                             <div class="input-group">
                                               <select id="select1"> 
           										 <option value="free">Free</option> 
           											 <option value="basic">Basic</option> 
       												 </select>  <br>
                                               			<input type="text" id="feature">
													 <button onclick="addOption()"> 
     															 Add option 
  													</button> 
                                            </div>
                                          </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="username" class="cols-sm-2 control-label">Dimensions</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                                <input type="text" class="form-control" name="dimension" id="dimension" placeholder="Enter length x breadth x width" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="cols-sm-2 control-label">Price</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                <input type="number" class="form-control" name="price" id="price" placeholder="Enter price" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="confirm" class="cols-sm-2 control-label">Installation Charges</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                <input type="number" class="form-control" name="charge" id="charge" placeholder="Enter Installation Charges" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="confirm" class="cols-sm-2 control-label">Upgradation Charges</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                <input type="number" class="form-control" name="Upcharge" id="Upcharge" placeholder="Enter Upgradation Charges" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="confirm" class="cols-sm-2 control-label">Discount</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                <input type="text" class="form-control" name="discount" id="discount" placeholder="Discount" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="confirm" class="cols-sm-2 control-label">Billing Type</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                 <input type="radio" name="billing" id="pre" value="Prepaid" onclick="dis()">Prepaid
                                                <input type="radio" name="billing" id="post" value="postPaid" onclick="dis()">Post Paid
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="confirm" class="cols-sm-2 control-label">Refundable Deposit Amount</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                <input type="number" class="form-control" name="refund" id="refund" placeholder="Enter Refundable Deposit Amount" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="confirm" class="cols-sm-2 control-label">Set Top Box Inventory</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                <input type="file" name="myFile" multiple>
                                                 <input type="submit" value="upload" />
                                            </div>
                                        </div>
                                    </div>
                                    
		      	</div>
		        <div class="modal-footer ">
					<input type = "hidden" name = "option" value = "UpdateChannel">
					<input type = "hidden" name = "channel_Id">
		            <button type="submit" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
		        </div>
	     	</div><!-- /.modal-content --> 
	    </form>
	</div><!-- /.modal-dialog --> 
</div>
    
<div class="modal fade" id="delete" role="dialog" >
	<div class="modal-dialog">
    	<form action = "HomeController" method = "post">
    		<div class="modal-content">
          		<div class="modal-header">
          			<h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
        			<button type="button" class="close" data-dismiss="modal">&times;</button>
      			</div>
	        	<div class="modal-body">
	      			<div class="alert alert-danger">
	      				<span class="glyphicon glyphicon-warning-sign">Are you sure you want to delete this Record?</span>
	      			</div>
	       		</div>
	        	<div class="modal-footer ">
			        <input type = "hidden" name = "option" value = "DeleteSetTopBox">
					<input type = "hidden" name = "remove_id">
			        <button type="submit" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal" ><span class="glyphicon glyphicon-remove"></span> No</button>
	      		</div>
      		</div><!-- /.modal-content --> 
     	</form>
 	</div><!-- /.modal-dialog --> 
</div>
   
</body>
</html>