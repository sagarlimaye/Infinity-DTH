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
		<h3 align="center">Add New Channel</h3> 
        <div>
            <label for="channelName">Channel name</label>
            <input type="text" id="channelName" name="channelName" placeholder="Enter ChannelName" required />
        </div>
        <div>
            <label for="channelBand">Channel band</label>
            <input type="text" id="channelBand" name="channelBand" placeholder="Enter ChannelBand" required/>
        </div>
        <div>
            <label for="videoFreq">Video carrier frequency</label>
            <input type="text" id="videoFreq" name="videoFreq" placeholder="Enter VideoFrequency in number" required min="0" /> 
        </div> 
        <div>
            <label for="audioFreq">Audio carrier frequency</label>
        	<input type="text" id="audioFreq" name="audioFreq" placeholder="Enter AudioFrequency in number" required min="0" /> 
        </div>
        <div>
            <label for="chargeType">Channel charge type</label>
           	<select id="chargeType" name="chargeType">
                <option value="fta">Free</option>
                <option value="paid">Paid</option>
            </select> 
        </div>
        <div>
            <label for="transmissionType">Transmission type</label>
            <select id="transmissionType" name="transmissionType">
                <option value="standard">Standard</option>
                <option value="hd">High-definition</option>
            </select>
        </div>
        <div>
           	<label for="charge">Channel charge</label>
            <input type="text" id="charge" name="charge" placeholder="Enter Channel charge in number" min="0" required/> 
        </div> 
        
        <input type="hidden" name="option" value="CreateChannel"/>
        <input type="submit" value="Create"/>
        <input type="button" name="Back" value="Back" onclick="window.history.back()">
    </div>
</form>
</body>
</html>