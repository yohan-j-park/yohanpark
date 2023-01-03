<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String regex = "(<img src=\')(.+?)(\'>)";
	String str = "asdfasdf<img src='./upload/a.png'>sadasdfasfd<img src='./sae/b.ing'>";

	Pattern p = Pattern.compile(regex);
	
	Matcher m = p.matcher(str);
	out.print("<li>" + str);
	out.print("<hr/>");
	while(m.find()){
		out.print("<li>" + m.group(2));
	}
	


%>
</body>
</html>