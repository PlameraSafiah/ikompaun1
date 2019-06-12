<!-- '#INCLUDE FILE="ik.asp" -->
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>i-Kompaun : Kompaun belum Bayar</title>
</head>

<body onload='self.print()' topmargin="0" leftmargin="0">
<%	'Set objConn = Server.CreateObject("ADODB.Connection")
'	objConn.Open "dsn=12c;uid=majlis;pwd=majlis;"
	
  proses = Request.form("B2")
  tkh1 = Request.form("ftkh1")
  tkh2 = Request.form("ftkh2")
  'daerah = Request.form("fdaerah")
  tkh1a = cstr(mid(tkh1,1,2)) + "/" + cstr(mid(tkh1,3,2)) + "/" + cstr(mid(tkh1,5,4))
  tkh2a = cstr(mid(tkh2,1,2)) + "/" + cstr(mid(tkh2,3,2)) + "/" + cstr(mid(tkh2,5,4))
	
	if proses = "Cetak" then
	
		d =     "select no_akaun,nama,perkara1,kawasan,to_char(tkh_masuk,'dd/mm/yyyy') tkompaun, "
		d = d & "       round(to_date(sysdate) - tkh_masuk,0) hari,no_rujukan2 "
		d = d & "  from hasil.bil "
		'd = d & " where (no_akaun like '76410'||'%' or no_akaun like '76420'||'%') "
		'18042014 : jun tambah boleh papar kod 76413 jugak, sebelum ni 76410 & 76420 saja
		d = d & " where (no_akaun like '76410'||'%' or no_akaun like '76420'||'%' or no_akaun like '76413'||'%' "
		''kompaun perbandaran-mimi-pn.raja
		d = d & " or no_akaun like '76412'||'%' or no_akaun like '76415'||'%' "
		'kompaun bangunan & veterinar
		d = d & " or no_akaun like '76101'||'%'or no_akaun like '76441'||'%') "
		d = d & " and tkh_masuk between to_date('"& tkh1 &"', 'ddmmyyyy') "
		d = d & " and to_date('"& tkh2 &"' , 'ddmmyyyy') "
		d = d & " and (perkara <> 'P01' or perkara is null) "
		d = d & " and amaun_bayar is null "
		d = d & " and (post <> 'B' or post is null) "
	 	'******************************************************************
		'ika tambah user view jabatan masing2.admin view semua (23/09/2016)
		pekz = request.cookies("gnop")
		admin = "select id from hasil.superadmin where id='"&pekz&"' "
		'response.Write(admin)
		Set objRAdmin = objConn.Execute(admin)
		
		if objRAdmin.eof then
		
		lokasi = "select lokasi from payroll.paymas where no_pekerja='"&pekz&"' "
		Set objRLokasi = objConn.Execute(lokasi)
		
		lok = objRLokasi("lokasi")
		
		d = d & " and jabatan = '"& lok &"' "
		
		end if
		'end view ikut jabatan
		'******************************************************************
	    d = d & " order by tkh_masuk,no_akaun "

		Set objRs2 = objConn.Execute(d)	

	
	end if
	
	
	f="select to_char(sysdate,'dd-mm-yyyy  hh24:mi:ss') as tkhs from dual "
   	Set objRs1a = Server.CreateObject ("ADODB.Recordset")
   	Set objRs1a = objConn.Execute(f)	
   	tkhs = objrs1a("tkhs")
   	
   	
	s = " select nama from majlis.syarikat "     	
	Set objRss = objConn.Execute(s)
	namas = objRss("nama")
       
     
    muka = 0
    mula
    badan     
%>

<%	sub mula	
		muka = cdbl(muka) + 1
%>
<table width="100%" border="0" >
<tr>
<td width="20%" align="left" ><i><font size="2" color="#COCOCO"><%=tkhs%></font></i></td>
<td width="60%" align="center"></td>
<td width="20%" align="right" ><font size="2" color="#COCOCO">Page <%=muka%></font></td>
</tr>
</table>

<table width="100%" border="0">
<tr>
    <td width="100%" align="center"><font face="MS Serif" size="4"><b><%=namas%></font></td>
</tr>
<tr>
<td width="100%" align="center"><font face="MS Serif" size="3"><b>LAPORAN KOMPAUN BELUM BAYAR</b></font></td>
</tr></table>

<p></p>
<table width="85%" align="center" border="0">
  <tr> 
    <td width="13%" nowrap>&nbsp;&nbsp;<font size="2" face="Verdana"><b>Tarikh 
      </b></font></td>
    <td width="1%" ><font size="2" face="Verdana"><b>&nbsp;:&nbsp;</b></font></td>
    <td ><font size="2" face="Verdana"><%=tkh1a%>&nbsp;<b>Hingga</b>&nbsp;<%=tkh2a%></font></td>
  </tr>
</table>
<hr>
<%	end sub	%>



<%	sub badan		%>

<center>
<table border="0" width="85%" align="center">
  <tr> 
    <td align="center"><b><font size="2" face="Arial">Bil</font></b></td>
    <td align="center"><b><font size="2" face="Arial">No Kompaun</font></b></td>
    <td align="center"><b><font size="2" face="Arial">Tkh Kompaun</font></b></td>
    <td align="center"><b><font size="2" face="Arial">No Pendaftaran</font></b></td>
    <td align="center"><b><font size="2" face="Arial">Bil Hari</font></b></td>
  </tr>
  <%	ctr = 0
  	ctrz = 0
	bil = 0

	Do while not objRs2.eof
	
	bil = bil + 1
	ctr = cdbl(ctr) + 1
    	ctrz = cdbl(ctrz) + 1
    	if ctr = 40 then
    		ctr = 1  	
  %>
</table>

<%mula%>

<center>
<table width="85%" height="46" border="0" align="center">
  <tr> 
    <td align="center"><b><font size="2" face="Arial">Bil</font></b></td>
    <td align="center"><b><font size="2" face="Arial">No Kompaun</font></b></td>
    <td align="center"><b><font size="2" face="Arial">Tkh Kompaun</font></b></td>
    <td align="center"><b><font size="2" face="Arial">No Pendaftaran</font></b></td>
    <td align="center"><b><font size="2" face="Arial">Bil Hari</font></b></td>
  </tr>
  <%	end if	%>
  <tr> 
    <td height="20" align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=bil%></font></td>
    <td height="20" align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=objRs2("no_akaun")%></font></td>
    <td height="20" align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;<%=objRs2("tkompaun")%></font></td>
    <td height="20" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=objRs2("nama")%>&nbsp;&nbsp;</font></td>
    <td height="20" align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=objRs2("hari")%></font></td>
  </tr>
  <%	objRs2.MoveNext
	Loop
%>
</table>
<%	end sub	%>

</body>
</html>