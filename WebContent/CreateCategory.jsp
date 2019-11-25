<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Channel</title>
<script
	src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<script src="js/createChannel.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/form.css">
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
            <label for="maxChannels">Minimum Channels</label>
        	<input type="text" id="maxChannels" name="maxChannels" placeholder="Enter minimum number of channels" required min="0" /> 
        </div>
        
        <input type="hidden" name="option" value="CreateCategory"/>
        <input type="submit" value="Create category" onclick = "window.history.back()">     
        
</div>
</form>
</body>
</html>
       
           
        