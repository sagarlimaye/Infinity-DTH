<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Admin.jsp"/>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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

<script type="text/javascript"> 
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
</head>
<body>
<div class="container">
<div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header">Manage Set Top Box</div>
                            <div class="card-body">

                                <form class="form-horizontal" method="post" action="#">

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
                                    
                                    
                                       
                                    
                                    <div class="form-group ">
                                        <button type="button" class="btn btn-primary btn-lg btn-block login-button">Submit</button>
                                    </div>
                                    
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
</div>
</body>
</html>