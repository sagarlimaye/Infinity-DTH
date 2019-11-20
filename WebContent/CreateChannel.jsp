<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<% 
String error = (String)request.getAttribute("error");
String success = (String)request.getAttribute("success");
if(!error.isEmpty())
%>
	<h3>There was an error</h3>
<%
else if(success != null && success.equalsIgnoreCase("true")) 
%>
	<h3>Successfully created channel!</h3>
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
              <input type="number" id="videoFreq" name="videoFreq" placeholder="Enter VideoFrequency in number" required min="0" /> 
        </div> 
        <div>
            <label for="audioFreq">Audio carrier frequency</label>
        <input type="number" id="audioFreq" name="audioFreq" placeholder="Enter AudioFrequency in number" required min="0" /> 
        </div>
        <div>
            <label for="chargeType">Channel charge type</label>
           <select id="chargeType" name="chargeType">
                <option value="fta">FTA</option>
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
            <input type="number" id="charge" name="charge" placeholder="Enter Channel charge in number" min="0" required/> 
        </div> 
        <input type="submit" value="Create"/>
        
    </div>
</form>
</body>
</html>