<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Entities.adminLogin_entities"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Properties"%>
<%@page import="ConnectionPackage.dbms_Connection"%>
<%@page import="java.sql.*"%>


<%
    adminLogin_entities ad = (adminLogin_entities) session.getAttribute("currentUser");
    String userName = ad.getUsername().toString();
    String ide = request.getParameter("id");
    String tel;
    String firstName;
    String lastName;
    String wentLocation;
    String Reason;
    
    int num = Integer.parseInt(ide);
    Connection con = dbms_Connection.getConnection();
    ResultSet rs;
    Statement stmt = con.createStatement();
    try {
        stmt.executeQuery("Update permissiondetails set Status = 'Not Allowed', ProcessedBy = '" + userName + "'  where PermissionID='" + num + "'");
        
    } catch (Exception e) {
        System.out.println(e);
    }
    response.sendRedirect("profile.jsp");

 try {
        rs = stmt.executeQuery("Select * from permissiondetails where PermissionID = '"+ num +"'");
        while (rs.next())
        {
         tel = rs.getString("PhoneNumber");
         firstName = rs.getString("FirstName");
         lastName = rs.getString("LastName");
         wentLocation = rs.getString("wentLocation");     
        
String apiKey="5fungeYSPkhApobRWH6GcU9sMJwidV1qIz2D87XmxT4lrQK3CjYsZkuCRqL6mJFEw358hIibtjH7OanG";
String senderID="FSTSMS";
//important step...
StringBuilder sb = new StringBuilder();
sb.append("Permission ID: AGR");
sb.append(ide); sb.append("\n");
sb.append("Name: "); sb.append(firstName); sb.append(" "); sb.append(lastName); sb.append("\n");
sb.append("Location: "); sb.append(wentLocation);
sb.append("\nStatus: Not Allowed");
DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
Calendar cal = Calendar.getInstance();
String currenttime = cal.getTime().toString();
sb.append("\nValid From:- ");
sb.append(currenttime);
cal.add(Calendar.HOUR, 2);
String latertime = cal.getTime().toString();
sb.append("\nValid Upto:- ");
sb.append(latertime);
String msg = sb.toString();
System.out.println(msg);

String message = URLEncoder.encode(msg, "UTF-8");
String language = "english";
String route = "p";

String msgURL = "https://www.fast2sms.com/dev/bulk?authorization="+apiKey+"&sender_id="+senderID+"&message="+message+"&language="+language+"&route="+route+"&numbers="+tel;

//sending get request using java

URL url = new URL(msgURL);
HttpURLConnection httpcon = (HttpURLConnection)url.openConnection();
httpcon.setRequestMethod("GET");

httpcon.setRequestProperty("User-Agent", "Mozilla/5.0");
httpcon.setRequestProperty("cache-control", "no-cache");
System.out.println("wait...............");

int code = httpcon.getResponseCode();

System.out.println("Response Code: "+code);
StringBuffer reader = new StringBuffer();
BufferedReader br = new BufferedReader(new InputStreamReader(httpcon.getInputStream()));
while(true)
{
String line = br.readLine();
if(line == null)
{
break;
}
reader.append(line);
}

//System.out.println(reader);
        }
}
catch(Exception e)
{
e.printStackTrace();
}


%>