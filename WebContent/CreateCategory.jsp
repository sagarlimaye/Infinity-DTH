<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Admin.jsp"/>
<meta charset="ISO-8859-1">
<title>Add Category</title>
<script
	src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="css/form.css">
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
<form action="HomeController" method="post">

<div>
		<h3 align="center">Add New Category</h3> 
		<div>
            <label for="channelName">Category name</label>
            <input type="text" id="categoryName" name="categoryName" placeholder="Enter Category Name" required />
        </div>
        
         <div>
            <label for="minChannels">Minimum Channels</label>
        	<input type="text" id="minChannels" name="minChannels" placeholder="Enter minimum number of channels" required min="0" /> 
        </div>
        
         <div>
            <label for="maxChannels">Maximum Channels</label>
        	<input type="text" id="maxChannels" name="maxChannels" placeholder="Enter maximum number of channels" required min="0" /> 
        </div>
        
        <input type="hidden" name="option" value="CreateCategory"/>
        <input type="submit" value="CreateCategory" onclick = "window.history.back()">     
        
</div>
</form>
</body>
</html>
       
           
        