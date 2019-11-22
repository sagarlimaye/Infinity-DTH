<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
$("#mytable #checkall").click(function () {
        if ($("#mytable #checkall").is(':checked')) {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", true);
            });

        } else {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", false);
            });
        }
    });
    
    $("[data-toggle=tooltip]").tooltip();
});
</script>
<form action="">
<div class="container">
	<div class="row">
		
        
        <div class="col-md-12">
        <h4>Add Channels</h4>
        <div class="table-responsive" style="width:500px;height:250px;line-height:3em;overflow:scroll;padding:5px;">

                
              <table id="mytable" class="table table-bordred table-striped">
                   
                   <thead>
                   <tr>
                   <th><input type="checkbox" id="checkall" /></th>
                   <th>Channel Name</th>
                  </tr>
                </thead>
                  
    <tbody>
    
    <tr>
    <td><input type="checkbox" class="checkthis" /></td>
    <td>Mohsin</td>
    </tr>  
    <tr>
    <td><input type="checkbox" class="checkthis" /></td>
    <td>Mohsin</td>
    </tr>  
    <tr>
    <td><input type="checkbox" class="checkthis" /></td>
    <td>Mohsin</td>
    </tr>  
    <tr>
    <td><input type="checkbox" class="checkthis" /></td>
    <td>Mohsin</td>
    </tr>  
    <tr>
    <td><input type="checkbox" class="checkthis" /></td>
    <td>Mohsin</td>
    </tr>  
    <tr>
    <td><input type="checkbox" class="checkthis" /></td>
    <td>Mohsin</td>
    </tr>  
    
    </tbody>
        
</table>

        </div>    
        </div>
	</div>
	
	
<div>	
    <br>
    <button type="button" onclick="" title="Calculates the default charge based on the channels selected.This can be changed.">Calculate Charges</button>
  	<input type="text" name="charges"><br><br>
 		
</div>	
<div align="center" class="add-container">
	<input type=Submit value = "Submit">
</div>
</div>
</form>
 
</body>
</html>