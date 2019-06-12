<%		 Response.buffer = "True"	 %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title> Senarai Akta / UUK</title>
</head>

<body topmargin="0" leftmargin="0" bgcolor="#FFCCCC">



<form method="POST" action ="akta.asp" >

<%Set objConn = Server.CreateObject("ADODB.Connection")
  objConn.Open "dsn=12c;uid=majlis;pwd=majlis;"
  
  	menu = Request.cookies("kmenu")
	proses = Request.Form("B2")
	kodz = ucase(Request.form("kodz"))
%>
<p align="center">
<font face="Verdana" size="2"><b>Akta / UUK :</b></font>
<input type="text" name="kodz" value="<%=kodz%>" size=10 ><input type="submit" name="B2" value="Hantar" size="2" style="font-family: Verdana">
<%  
	bilakt = Request.form("bilakt")
	
	no = request.cookies("fac")
	if bilakt <> "" then
  
     for i = 1 to bilakt
		
     	fakt1 = "akt" + cstr(i)
		fketer1 = "dakt" + cstr(i)
       B2 = "B2" + cstr(i)
       
   		fakt2 = request.form(""& fakt1 &"")
       B2z = request.form(""& B2 &"")


       if B2z = "p" then
       	response.cookies("fakt") = fakt2
       	response.cookies("fasp") = "akta.asp"
       		if menu = "ik11.asp" then
	         		response.redirect "ik11.asp"
	       	elseif menu = "ik11b.asp" then
	       		response.cookies("pilihakta") = "akta"
	       		response.redirect "ik11b.asp"
  				end if
       else 
       	fakt = ""
       	bilakt = ""
       end if
     next
  end if



   
 if proses = "Hantar" then
 
    a = " select rowid, kod, initcap(keterangan) keterangan from kompaun.perkara "
    a = a & " where kod like '"& kodz &"'||'%' "
    a = a & " and kod <> 'P01' order by kod "
    Set objRsa = Server.CreateObject("ADODB.Recordset")
    Set objRsa = objConn.Execute(a)
%>

<table  border="0" width="85%" align="center" cellspacing="1">
<tr bgcolor="#9D2024"> 
<td width="13%" align="center"><b><font face="Verdana" size="2" color="#FFFFFF">Akta / UUK</font></b></td>
<td width="65%" align="center"><b><font face="Verdana" size="2" color="#FFFFFF">Keterangan</font></b></td>
<td width="7%" align="center"><b><font face="Verdana" size="2" color="#FFFFFF">Pilih</font></b></td>
</tr>
<%	ctrz = 0
	Do while not objRsa.EOF
	
	   ctrz = cdbl(ctrz)  + 1  
%>
<tr>
<td width="13%" bgcolor="#C0C0C0" align="center"><font face="Century Gothic" size="2"><%=objRsa("kod")%></font></td>
<td width="65%" bgcolor="#C0C0C0"><font face="Century Gothic" size="2"><%=objRsa("keterangan")%></font>
	<input type="hidden" name="akt<%=ctrz%>" value="<%=objrsa("kod")%>" >
	<input type="hidden" name="dakt<%=ctrz%>" value="<%=objrsa("keterangan")%>" >
	<input type="hidden" name="rowid<%=ctrz%>" value="<%=objrsa("rowid")%>" >
</td>
<td width="7%" bgcolor="#COCOCO" align="center"><input type="submit" name="B2<%=ctrz%>" value="p"></td>
</tr>
<%  objRsa.MoveNext
	Loop
	objRsa.Close
%>
<input type="hidden" name="bilakt" value="<%=ctrz%>" >
<%	objConn.Close
	end if
%>
</table>
</form>
</body>

</html>









































