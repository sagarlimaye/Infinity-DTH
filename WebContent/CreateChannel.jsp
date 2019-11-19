<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="HomeController" method="post">
    <div>
    <input type="hidden" name="option" value="CreateChannel"/>
        <h3>New channel</h3>
        <div>
            <label for="channelName">Channel name</label>
            <input type="text" id="channelName"/>
        </div>
        <div>
            <label for="channelBand">Channel band</label>
            <input type="text" id="channelBand"/>
        </div>
        <div>
            <label for="videoFreq">Video carrier frequency</label>
            <input type="number" id="videoFreq" min="0"/> 
        </div> 
        <div>
            <label for="audioFreq">Audio carrier frequency</label>
            <input type="number" id="audioFreq" min="0"/> 
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
            <select id="transmissionType">
                <option value="standard">Standard</option>
                <option value="hd">High-definition</option>
            </select>
        </div>
        <div>
            <label for="charge">Channel charge</label>
            <input type="number" id="charge" min="0"/> 
        </div> 
        <input type="submit" value="Create"/>
    </div>
</form>
</body>
</html>