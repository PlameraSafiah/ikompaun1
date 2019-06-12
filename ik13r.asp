<!-- '#INCLUDE FILE="ik.asp" -->
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>i-Kompaun : Senarai Ke Jabatan Undang2</title>
</head>

<body>

<%		'Set objConn = Server.CreateObject("ADODB.Connection")
'    	objConn.Open "dsn=12c;uid=majlis;pwd=majlis;"

		proses = Request.form("B1")
		dtkh = Request.form("ftkh")
		
		if proses = "CETAK" then
		
		d = " select perkara, no_rujukan2, no_akaun, initcap(nama) nama,"
		d = d & " to_char(tarikh_post,'ddmmyyyy') as tarikh_post, post "
		d = d & " from hasil.bil "
		d = d & " where tarikh_post = to_date('"& dtkh &"','ddmmyyyy') "
		d = d & " and (no_akaun like '76410'||'%' or no_akaun like '76420'||'%') "
		d = d & " and amaun_bayar is null "
		d = d & " and (perkara <> 'P01' or perkara is null) "
		d = d & " and post = 'M' "
		
		Set objRs2 = Server.CreateObject ("ADODB.Recordset")
		Set objRs2 = objConn.Execute(d)
		
		r = " select to_char(sysdate,'ddmmyyyy') tkh from dual "
		Set objRs3 = Server.CreateObject ("ADODB.Recordset")
		Set objRs3 = objConn.Execute(r)
		tkhs = objRs3("tkh")

%>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="85%" > <p align="center"><font size="3" face="Verdana">
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LAPORAN KESALAHAN KOMPAUN KE JABATAN UNDANG-UNDANG&nbsp;</b></font>
</p>
</td>
<td width="15%" height="19" align="right"><i><font size="2" color="#808080"><%=tkhs%></font></i>
</td></tr>
</table>
<p></p>

<table border="0" width="758">
<tr>
<td width="750"><font face="Verdana" size="2"><b>Tarikh Notis :&nbsp; </b><%=dtkh%></font></td>
</tr>
</table>
<hr>

<p></p>
  <table border="0" width="100%" align="center">
  <tr bgcolor="#FFFFFF"> 
  <td width="5%" align="center"><b><font face="Arial" size="2">Bil</font></b></td> 
  <td width="13%" align="center"><b><font face="Arial" size="2">Akta / UUK</font></b></td></center>
  <td width="13%" align="center"><b><font face="Arial" size="2">Kesalahan</font></b></td>
  <td width="19%" align="center"><b><font face="Arial" size="2">No Kompaun</font></b></td>
  <td width="40%" align="center"><b><font face="Arial" size="2">Nama</font></b></td>
  <td width="10%" align="center"><b><font face="Arial" size="2">Tarikh</font></b></td>
  </tr>
  <% 	bil = 0	
    	Do while not objRs2.EOF
    	bil = bil + 1
  %> 
  <tr> 
  <td width="5%" bgcolor="#FFFFFF" align="center"><font size="2" face="Verdana"><%=bil%></font></td>
  <td width="13%" bgcolor="#FFFFFF" align="center"><font size="2" face="Verdana"><%=objRs2("perkara")%></font></td>
  <td width="13%" bgcolor="#FFFFFF" align="center"><font size="2" face="Verdana"><%=objRs2("no_rujukan2")%></font></td>
  <td width="19%" bgcolor="#FFFFFF" align="center"><font size="2" face="Verdana"><%=objRs2("no_akaun")%></font></td>
  <td width="40%" bgcolor="#FFFFFF"><font size="2" face="Verdana"><%=objRs2("nama")%></font></td>
  <td width="10%" bgcolor="#FFFFFF" align="center"><font size="2" face="Verdana"><%=objRs2("tarikh_post")%></font></td>
  </tr>
  <%	objRs2.MoveNext			
  		Loop
  %> 
  </table>
  
<%end if%>

</body>

</html>








