<% 'Option Explicit %>

<%
Set objConn = Server.CreateObject("ADODB.Connection")
  objconn.Open "dsn=12c;uid=majlis;pwd=majlis;"
  
Set objConn11g = Server.CreateObject("ADODB.Connection")
  objconn11g.Open "dsn=mpsp11g;uid=kehadiran;pwd=kehadiran;"
  


%>

