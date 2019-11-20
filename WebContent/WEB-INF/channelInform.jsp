<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib  prefix="c"   uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	
					<c:forEach items="${channelInf}" var="channel">
                
                  <c:out value="${channel.name}" />
                   
                    </c:forEach>
</body>
</html>