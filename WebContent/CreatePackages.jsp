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
                  			<input type="text" class="form-control" name="pkgName" id="name" placeholder="Enter package name" />
           				</div>
           				<div class="form-group">
              				<label for="charge" class="cols-sm-2 control-label">Package Charging Type</label>
               				<div class="cols-sm-10">
                 			<div class="input-group">
                  			<div class="charge" id="charge">
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
                 			</div>
                			</div>
             			</div>
             <div class="form-group">
              <label for="transmission" class="cols-sm-2 control-label">Package Transmission Type</label>
              <div class="cols-sm-10">
               <div class="input-group">
                <div class="Transmission" id="transmission">
                  <div class="form-check-inline">
                   <label class="form-check-label" for="radio3">
                   <input type="radio" class="form-check-input" name="transmissionType" value="hd">HD
                   </label>
                  </div>
                  <div class="form-check-inline">
                   <label class="form-check-label" for="radio4">
                   <input type="radio" class="form-check-input" name="transmissionType" value="standard">Standard
                   </label>
                  </div>
                 </div>
                </div>
               </div>
              </div>
           <div class="form-group">
             <label for="channels" class="cols-sm-2 control-label">Channels in this package</label>
             <div class="cols-sm-10">
               <div class="input-group">
                 <select class="selectpicker" name="channels" id="channelSelect" multiple>
	                 
                 </select>
               </div>
            </div>
           </div>
           <div class="form-group">
            <label for="pack" class="cols-sm-2 control-label">Package Category</label>
              <div class="cols-sm-10">
               <div class="input-group">
                <div class="category">
                       
                    <select name= "category">
                     	<c:forEach items="${categoryInf}" var="category">
                    		<option value="${category.categoryName}">${category.categoryName}</option>                  	
                    	</c:forEach>                   
                    </select>
                    
                    <input type="hidden" value = "InputCategory">
                    <button type="submit" formaction = "HomeController">Submit</button>
                
                   </div>
                  </div>
                 </div>
                </div>
               </div>
              </div>
             </div>
            </div>
         <div class="form-group">
             <label for="fdate" class="cols-sm-2 control-label">Package Available from date</label>
             <div class="cols-sm-10">
               <div class="input-group">
                 <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                   <input type="date" class="form-control" name="availableFrom" id="fdate" placeholder="YYYY/MM/DD" />
              </div>
            </div>
           </div>
           <div class="form-group">
             <label for="tdate" class="cols-sm-2 control-label">Package Available to date</label>
             <div class="cols-sm-10">
               <div class="input-group">
                 <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                   <input type="date" class="form-control" name="availableTo" id="tdate" placeholder="YYYY/MM/DD" />
              </div>
            </div>
           </div>
           <div class="form-group">
              <label for="default" class="cols-sm-2 control-label">Add by Default</label>
              <div class="cols-sm-10">
               <div class="input-group">
                <div class="default">
                  <div class="form-check-inline">
                   <label class="form-check-label" for="radio5">
                   <input type="radio" class="form-check-input" name="addedByDefault" value="true">Yes
                   </label>
                  </div>
                  <div class="form-check-inline">
                   <label class="form-check-label" for="radio6">
                   <input type="radio" class="form-check-input" name="addedByDefault" value="false">No
                   </label>
                  </div>
                 </div>
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