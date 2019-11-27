<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Admin.jsp"/>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
<script src="js/channelsToPackage.js"></script>
<script src="js/categoryToPackage.js"></script>

<style type="text/css">
body{
background-image: url("1.jpg");
 height: 1000px;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;

}

</style>
</head>
<body>
<div class="container">
<div class="row justify-content-center">
	<div class="col-md-8">
    	<div class="card">
        	<div class="card-header">Manage Channel Packages</div>
        	
           	<div class="card-body">
	 			<form class="form-horizontal" method="post" action="HomeController">
                   	<input type="hidden" name="option" value="CreatePackage"/>
                   	
       				<div class="form-group">
         				<label for="name" class="cols-sm-2 control-label">Package Name</label>
            			<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
              			<input type="text" class="form-control" name="pkgName" id="name"
              			placeholder="Enter package name" required />
       				</div>
       				
       				<div class="form-group">
          				<label for="charge" class="cols-sm-2 control-label">Package Charging Type</label>
              			<div class="charge" id="charge">
              				<div class="form-check-inline">
                 				<label class="form-check-label" for="radio1">
                 					<input type="radio" class="form-check-input" name="chargeType" value="paid">Paid by default
                 				</label>
               				</div>
               				<div class="form-check-inline">
                 				<label class="form-check-label" for="radio2">
                 					<input type="radio" class="form-check-input" name="chargeType" 
                 						value="fta" checked>FTA
                 				</label>
               				</div>
              			</div>
           			</div>
           			
           			<div class="form-group">
            			<label for="transmission" class="cols-sm-2 control-label">Package Transmission Type</label>
             			<div class="Transmission" id="transmission">
               				<div class="form-check-inline">
                 				<label class="form-check-label" for="radio3">
                 					<input type="radio" class="form-check-input" name="transmissionType" value="hd">HD
                 				</label>
                			</div>
                			<div class="form-check-inline">
                				<label class="form-check-label" for="radio4">
                 					<input type="radio" class="form-check-input" name="transmissionType" 
                 						value="standard" checked>Standard
                 				</label>
                			</div>
               			</div>
              		</div>
              		
       				<div class="form-group">
       					<label for="channels" class="cols-sm-2 control-label">Channels in this package</label>
       					<div class="channels">
               				<select class="form-control selectpicker" name="channels" id="channelSelect" multiple>
                			</select>
               			</div>
           			</div>
           			
        			<div class="form-group">
         				<label for="category" class="cols-sm-2 control-label">Package Category</label>
             			<div class="category">
             				<select class="form-control" name="category" id="categorySelect">
								<c:forEach items="${categories}" var="category">
									<option value="${category.category_id}">${category.categoryName}</option>
								</c:forEach>
                 			</select>
             			</div>
               		</div>
               		
               		<div class="categories">
	                    <button type="button" class="btn btn-info" data-toggle="modal"
	                        data-target="#categories">Add / Remove Categories</button>
					</div>
               		
       				<div class="form-group">
           				<label for="fdate" class="cols-sm-2 control-label">Package Available from date</label>
               			<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                 		<input type="date" class="form-control" name="availableFrom" id="fdate" 
                 			placeholder="YYYY/MM/DD" required />
            		</div>
         			<div class="form-group">
           				<label for="tdate" class="cols-sm-2 control-label">Package Available to date</label>
               			<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                 		<input type="date" class="form-control" name="availableTo" id="tdate" placeholder="YYYY/MM/DD"
                 			required />
           	 		</div>
           	 		
         			<div class="form-group">
            			<label for="default" class="cols-sm-2 control-label">Add by Default</label>
            			<div class="add-by-default">
            				<div class="form-check-inline">
	                 			<label class="form-check-label" for="radio5">
	                 				<input type="radio" class="form-check-input" name="addedByDefault" value="true">Yes
	                 			</label>
	                		</div>
	                		<div class="form-check-inline">
	                 			<label class="form-check-label" for="radio6">
	                 				<input type="radio" class="form-check-input" name="addedByDefault" value="false" checked>No
	                 			</label>
	                		</div>
            			</div>
               		</div>
               		
        			<div class="form-group ">
           				<button type="submit" class="btn btn-primary btn-lg btn-block login-button">Submit</button>
       				</div>
          		</form>
            </div>
		</div>
	</div>
</div>
</div>

<div class="modal fade" id="categories" tabindex="-1" role="dialog"
	aria-labelledby="categories" aria-hidden="true">
	<div class="modal-dialog">
		<form action="HomeController" method="Post">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title custom_align" id="Heading">Add Categories</h4>
	                <button type="button" data-dismiss="modal" aria-hidden="true">X</button>
	            </div>
	               
				<div class="modal-body">
	                <div class="form-group">
	                    <input type="text" id="categoryName" placeholder="Category Name"/>
	                    <input type="number" id="minChannels" placeholder="Min Channels"/>
	                    <input type="number" id="maxChannels" placeholder="Max Channels"/>
	                    <input type="button" value="add to list" id="add" />
	                </div>
	
	                <ul id="list">
	                	<c:forEach items="${categories}" var="category">
	                    	<li>
	                        	<c:out value="${category.categoryName}"></c:out>
	                            <span class="close" id="${category.category_id}">X</span>
	                        </li>
	                    </c:forEach>
	                </ul>
				</div>
	        </div><!-- /.modal-content -->
   	    </form>  
  	</div><!-- /.modal-dialog -->
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