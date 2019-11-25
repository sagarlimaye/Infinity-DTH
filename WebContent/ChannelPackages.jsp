<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
<style type="text/css">
body{
background-image: url("1.jpg");
 height: 1000px;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;

}
.card{heigth:50%;}
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
                     					<input type="radio" class="form-check-input" name="chargeType" value="pbd">Paid by default
                     				</label>
                   				</div>
                   				<div class="form-check-inline">
                     				<label class="form-check-label" for="radio2">
                     					<input type="radio" class="form-check-input" name="chargeType" value="fta">FTR
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
               
              <div class="dropdown">
                     <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Category</button>
                       <ul class="dropdown-menu">      
						<c:forEach items ="${categoryInf}" var = "category">
							<li><c:out value="${category.categoryName}"></c:out></li>
						</c:forEach>
						</ul>
					<br><br>

			<!-- 	</form>- --> 


<!--                  <button type="submit" class="btn btn-light dropdown-toggle" data-toggle="dropdown">Categories</button>
 -->
   <!--               <div class="category-names-list">
                <button onclick="myFunction()" class="btn btn-light dropdown-toggle">Categories</button>
    -->           
                
                <!--  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#category">Add Category</button>
                 <div class="modal fade" id="category" role="dialog">
                  <div class="modal-dialog">
                   <div class="modal-content">
                    <div class="modal-header">
                    <h4 class="modal-title">Add Category</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>                                                             
                   </div>
                   <div class="modal-body">
                     <div class="form-group">
                       <label for="cname" class="cols-sm-2 control-label">Name</label>
                       <input class="form-control" type="text" placeholder="Category Name">
                     </div>
                      <div class="input-group">
                       <label for="min" class="cols-sm-2 control-label">Min Channels </label>
                       <span class="input-group-addon" style="width:10px"></span>
                       <input type="text" class="form-control" placeholder="0"/>
                       <span class="input-group-addon" style="width:30px"></span>
                       <label for="max" class="cols-sm-2 control-label">Max Channels </label>
                       <span class="input-group-addon" style="width:10px"></span>
                       <input type="text" class="form-control" placeholder=" "/>
                      </div>
                   </div>
                   <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Create</button>
                     -->
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
                   <input type="date" class="form-control" name="availableFrom" id="fdate" placeholder="MM/DD/YYYY" />
              </div>
            </div>
           </div>
           <div class="form-group">
             <label for="tdate" class="cols-sm-2 control-label">Package Available to date</label>
             <div class="cols-sm-10">
               <div class="input-group">
                 <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                   <input type="date" class="form-control" name="availableTo" id="tdate" placeholder="MM/DD/YYYY" />
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
           <!-- <div class="form-group">
             <label for="AddChannels" class="cols-sm-2 control-label">Add Channels</label>
             <div class="cols-sm-10">
               <div class="input-group">
                 <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                 <input type="button" value="AddChannels" name="AddChannels" onclick="openPage('AddChannelToPackage.jsp')"/>
              </div>
            </div>
           </div>
           <script type="text/javascript">
                   function openPage(pageURL)
                      {
                           window.location.href = pageURL;
                      }
          </script> -->
          
          <div class="form-group ">
             <button type="submit" class="btn btn-primary btn-lg btn-block login-button">Submit</button>
         </div>
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
<script>
$(function() {
	$("div.channelList").hide();
	var channelSelect = $("#channelSelect");
	var channelList = $("div.channelItem").map(function() {
		return {
			id: $(this).attr("id"),
			band: $(this).data("band"),
			name: $(this).text(),
			videoFreq: $(this).data("videofreq"),
			audioFreq: $(this).data("audiofreq"),
			chargeType: $(this).data("chargetype"),
			transmissionType: $(this).data("transmissiontype"),
			charge: $(this).data("charge")
		}
	}).get();
	
	$("input[name='chargeType'], input[name='transmissionType']").click(function() {
		var checkbox = $(this);
		if(checkbox.is(":checked")) {
			let ctype = $("input[name='chargeType']:checked").val();
			let transType = $("input[name='transmissionType']:checked").val();
			let selection = channelList;
			if(ctype == 'fta')
			{
				selection = channelList.filter(channel => channel.chargeType == 'fta');
			}
			if(transType == 'standard')
			{
				selection = selection.filter(channel => channel.transmissionType == 'standard');
			}
			channelSelect.children("option").remove();
			$.each(selection, function(id, channel) {
				channelSelect.append("<option value='" + channel.id+"'>"+channel.name+"</option>");
			});
			channelSelect.selectpicker("refresh");
		}
	});
});
</script>
</html>