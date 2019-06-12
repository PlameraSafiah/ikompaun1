<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>i-Kompaun : Senarai Akta/UUK</title>
</head>

<body >
<form method="POST" action = "akta2.asp" >

<%
  Set objConn = Server.CreateObject("ADODB.Connection")
  objConn.Open "dsn=12c;uid=majlis;pwd=majlis;"
  
  kara = Request.QueryString("rujuk")

    a = " select kod, initcap(keterangan) keterangan from kompaun.perkara "
    a = a & " where kod <> 'P01' order by kod "
    Set objRsa = Server.CreateObject("ADODB.Recordset")
    Set objRsa = objConn.Execute(a)
   
%>

<p align="center"><b><font color="#003300" size="3" face="MS Serif">Senarai Akta / UUK</font></b></p>  


<table align = "center" border="0" width="85%" bordercolor="#FFFFFF" cellspacing="1"  bgcolor="#333300">
<tr bgcolor="#006633"> 
<td width="5%" align="center" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF"><b><font face="MS Serif" color="#FFFFFF">Bil</font></b></td>
<td width="10%" align="center" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF"> 
<b><font face="MS Serif" color="#FFFFFF">Kod</font></b></td>
<td width="70%" align="center" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF"> 
<b><font face="MS Serif" color="#FFFFFF">Keterangan</font></b></td>
</tr>
<%	
	bil = 0

	Do while not objRsa.EOF
	bil = bil + 1
	
	 kod = objRsa("kod")
%> 
<%	if 	kod = kara then		%>
  <tr bgcolor="#CCCC00"> 
   <td width = "5%" height="25" bgcolor="#CCFFCC" align="center"><font face="Century Gothic" size="2"><%=bil%></font></td>
   <td width = "10%" height="25" bgcolor="#CCFFCC" align="center"><font face="Century Gothic" size="2"><%=objRsa("kod")%></font></td>
   <td width="70%" height="25" bgcolor="#CCFFCC"> 
   <font face="Century Gothic" size="2">&nbsp;&nbsp;<%=objRsa("keterangan")%></font></td>
</tr>

<%	else	%>

<tr> 
<td width = "5%" bgcolor="lightgrey" height="25" align="center"><font face="Century Gothic" size="2"><%=bil%></font></td>
<td width = "10%" bgcolor="lightgrey" height="25" align="center"><font face="Century Gothic" size="2"><%=objRsa("kod")%></font></td>
<td width="70%" bgcolor="lightgrey" height="25"><font face="Century Gothic" size="2">&nbsp;&nbsp;<%=objRsa("keterangan")%></font></td>
</tr>
<%	end if		%>
<%
    objRsa.Movenext  
    Loop
%> 

</table>
</form>

<form action="javascript:history.back(-1);">
<p align="center"><input type="submit" value="BACK" name="B2"></form>

</body>









