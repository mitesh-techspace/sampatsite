<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.net.*" %>
    <%@ page import="java.io.*" %>
    <%
 
String fullName = request.getParameter("full-name");
String email = request.getParameter("email");
String phone = request.getParameter("phone");

//Replace with your username
String user = "miteshchaturvedi";

//Replace with your API KEY (We have sent API KEY on activation email, also available on panel)
String apikey = "rPCTVkF06wTCP7q5A7b6";

//Replace with the destination mobile Number to which you want to send sms
String mobile = phone;

//Replace if you have your own Sender ID, else donot change
String senderid = "\"\"";

//Replace with your Message content
String message = "Hello "+fullName+" Thanks for supporting us";

//For Plain Text, use "txt" ; for Unicode symbols or regional Languages like hindi/tamil/kannada use "uni"
String type="txt";

//Prepare Url
URLConnection myURLConnection=null;
URL myURL=null;
BufferedReader reader=null;

//encoding message 
String encoded_message=URLEncoder.encode(message);

//Send SMS API
String mainUrl="http://smshorizon.co.in/api/sendsms.php?";

//Prepare parameter string 
StringBuilder sbPostData= new StringBuilder(mainUrl);
sbPostData.append("user="+user); 
sbPostData.append("&apikey="+apikey);
sbPostData.append("&message="+encoded_message);
sbPostData.append("&mobile="+mobile);
sbPostData.append("&senderid="+senderid);
sbPostData.append("&type="+type);

//final string
mainUrl = sbPostData.toString();
sendRequest(mainUrl);


%>
<%!
public void sendRequest(String mainUrl){

	try
	{
		URLConnection myURLConnection=null;
		URL myURL=null;
		BufferedReader reader=null;
	 //prepare connection
	 System.out.println(mainUrl);
	 myURL = new URL(mainUrl);
	 myURLConnection = myURL.openConnection();
	 myURLConnection.connect();
	 reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
	 //reading response 
	 
	 String response;
	 while ((response = reader.readLine()) != null) 
	 //print response 
	 System.out.println(response);
	 
	 //finally close connection
	 reader.close();
	} 
	catch (IOException e) 
	{ 
	e.printStackTrace();
	} 
	
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p align="center">
		<%
			out.println("Message Sent to: " + fullName + "\n");
		
		
		%>
		<a href="http://www.sampatgade.com">go back</a>
	</p>
</body>
</html>