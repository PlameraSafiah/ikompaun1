<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>i-Kompaun : Jenis Kesalahan</title>
</head>
<body topmargin="0" leftmargin="0">

<%Set objConn = Server.CreateObject("ADODB.Connection")
  objConn.Open "dsn=12c;uid=majlis;pwd=majlis;"

  tkh1 = request.querystring("tkh1") 
  tkh2 = request.querystring("tkh2") 
  kod11 = request.querystring("kod11")
  kod22 = request.querystring("kod22") 
  dt = cstr(mid(tkh1,1,2)) + "/" + cstr(mid(tkh1,3,2)) + "/" + cstr(mid(tkh1,5,4))
  ddt = cstr(mid(tkh2,1,2)) + "/" + cstr(mid(tkh2,3,2)) + "/" + cstr(mid(tkh2,5,4))
    
  	f = " select kod, initcap(keterangan) as terang "
	f = f & " from kompaun.perkara "'
	f = f & " where kod = '"& kod11 &"' "
	f = f & " order by kod "
	Set objRsf = objConn.Execute(f)
	
	if not objRsf.eof then
		trg11 = objRsf("terang")
	end if
	
	 g = " select kod as kodz, initcap(keterangan) as terang "
 	 g = g & " from kompaun.jenis_kesalahan  where perkara = '"&kod11&"' and kod ='"&kod22&"'"
 	 g = g & " and perkara <> 'P01' order by kod "
	 Set objRsg = objConn.Execute(g)
	
	if not objRsg.eof then
		trg22 = objRsg("terang")
	end if
  
     d = " select no_akaun, nama, to_char(tkh_masuk,'ddmmyyyy') as tkh_masuk, nvl(amaun,0) as amaun, "
	 d = d & " to_char(tkh_bayar,'ddmmyyyy') as tkh_bayar, no_resit "
	 d = d & " from hasil.bil "
  	 d = d & " where perkara = '"&kod11&"' "
	 d = d & " and no_rujukan2 like '%'||'"& kod22&"'||'%' "
		d = d & " and (no_akaun like '76410'||'%' or no_akaun like '76420'||'%' or no_akaun like '76413'||'%' "
		''kompaun perbandaran -mimi-pn.raja
		d = d & " or no_akaun like '76412'||'%' or no_akaun like '76415'||'%' "
		'kompaun bangunan & veterinar
		d = d & " or no_akaun like '76101'||'%'or no_akaun like '76441'||'%') "
		'18042014 : jun tambah boleh papar kod 76413 jugak, sebelum ni 76410 & 76420 saja
	 d = d & " and tkh_masuk between to_date('"& tkh1 &"','ddmmyyyy') "
 	 d = d & "	and to_date('"& tkh2 &"','ddmmyyyy')  " 
	 
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

	 Set objRs2 = objConn.Execute(d) 
  
     f = "select to_char(sysdate,'dd-mm-yyyy  hh24:mi:ss') as tkhs from dual "
     Set Rsf = objConn.Execute(f)	
  	 tkhs = rsf("tkhs")
  
     s = "select nama from majlis.syarikat "
     Set Rss = objConn.Execute(s)
  
     namas = Rss("nama")
     muka = 0
     mula
     badan

'****************************************** SUB MULA ************************************************
  sub mula	
  muka = cdbl(muka) + 1
%>
<table width="100%" border="0" >
<tr>
<td width="20%" ><i><font size="2" color="#808080"><%=tkhs%></font></i></td>
<td width="60%" align="center"></td>
<td width="20%" align="right" ><font size="2" color="#808080">Page <%=muka%></font></td>
</tr>
</table>

<table width="100%" border="0">
<tr>
<td width="100%" align="center"><b><font face="MS Serif" size="4"><%=namas%></font></b></td>
</tr>
<tr>
    <td width="100%" align="center"><font face="MS Serif" size="3"><b>LAPORAN 
      KOMPAUN BIASA <br>&nbsp;MENGIKUT JENIS KESALAHAN</b></font></td>
</tr></table>

<p></p>
<table width="100%" border="0">
<tr>
    <td width="20%">&nbsp;&nbsp;<font size="2" face="Verdana"><b>Akta UUK</b></font></td>
  <td width="1%"><font size="2" face="Verdana"><b>&nbsp;:&nbsp;</b></font></td>
  <td ><font size="2" face="Verdana"><%=kod11%> - <%=trg11%></font></td>
</tr>

<tr>
    <td >&nbsp;&nbsp;<font size="2" face="Verdana"><b>Jenis Kesalahan</b>&nbsp;</font></td>
  <td ><font size="2" face="Verdana"><b>&nbsp;:&nbsp;</b></font></td>
    <td ><font size="2" face="Verdana">
        <%=kod22%>&nbsp;-&nbsp;<%=trg22%>
      </font></td>
</tr>

<tr>
    <td width="20%">&nbsp;&nbsp;<font size="2" face="Verdana"><b>Tarikh Dari</b></font></td>
  <td width="1%"><font size="2" face="Verdana"><b>&nbsp;:&nbsp;</b></font></td>
    <td ><font size="2" face="Verdana"> <%=dt%>&nbsp;<b>Hingga</b>&nbsp;<%=ddt%></font></td>
</tr>

</table>
<%	end sub	
	sub badan		%>

<table width="100%" border="0">
  <tr align="center" bgcolor="#FFFFFF"> 
    <td width="34"><b><font face="Arial" size="2">Bil</font></b></td>
    <td width="94"><b><font face="Arial" size="2">No Kompaun</font></b></td>
    <td width="256"><b><font face="Arial" size="2">Nama</font></b></td>
    <td width="89"><b><font face="Arial" size="2">Tarikh</font></b></td>
    <td width="77"><b><font face="Arial" size="2">Amaun</font></b></td>
    <td width="92"><b><font face="Arial" size="2">Tarikh Bayar</font></b></td>
    <td width="97"><b><font face="Arial" size="2">No Resit</font></b></td>
    <td width="97"><b><font face="Arial" size="2">Jabatan</font></b></td>
  </tr>
  <% 	ctr = 0
  		ctrz = 0
  		bil = 0	
  		
    	Do while not objRs2.EOF
    	
    	bil = bil + 1
    	ctr = cdbl(ctr) + 1
    	ctrz = cdbl(ctrz) + 1
    	if ctr = 39 then
    		ctr = 1  
				
		kodJbtn = objRs2("jabatan")
		
		q1="select keterangan from payroll.ptj where kod='"&kodJbtn&"'"
		set rq1 = objConn.execute(q1)
		
		if not rq1.eof then namaJabatan = rq1("keterangan")
  %>
</table><br>
<hr>
<%mula%>
<table width="100%" border="0">
  <tr align="center" bgcolor="#FFFFFF"> 
    <td width="34"><b><font face="Arial" size="2">Bil</font></b></td>
    <td width="94"><b><font face="Arial" size="2">No Kompaun</font></b></td>
    <td width="256"><b><font face="Arial" size="2">Nama</font></b></td>
    <td width="89"><b><font face="Arial" size="2">Tarikh</font></b></td>
    <td width="77"><b><font face="Arial" size="2">Amaun</font></b></td>
    <td width="92"><b><font face="Arial" size="2">Tarikh Bayar</font></b></td>
    <td width="97"><b><font face="Arial" size="2">No Resit</font></b></td>
    <td width="97"><b><font face="Arial" size="2">Jabatan</font></b></td>
  </tr>
  <%	 end if	%> 
 
  <tr bgcolor="#FFFFFF"> 
    <td width="34" align="center" valign="top"><font face="Verdana" size="2"><%=bil%></font></td>
    <td width="94" align="center" valign="top"><font face="Verdana" size="2">&nbsp;<%=objRs2("no_akaun")%></font></td>
    <td width="256" align="left" valign="top"><font face="Verdana" size="2">&nbsp;<%=objRs2("nama")%></font></td>
    <td width="89" align="center" valign="top"><font face="Verdana" size="2">&nbsp;<%=objRs2("tkh_masuk")%>&nbsp;</font></td>
    <td width="77" align="right" valign="top"><font face="Verdana" size="2">&nbsp;<%=formatnumber(objRs2("amaun"),2)%> 
      </font></td>
    <td width="92" align="center" valign="top"><font face="Verdana" size="2">&nbsp;<%=objRs2("tkh_bayar")%> 
      </font></td>
    <td width="97" align="center" valign="top"><font face="Verdana" size="2">&nbsp;<%=objRs2("no_resit")%></font></td>
    <td><%=namaJabatan%></td>
</tr>

<%
	ab = objRs2("amaun")
		total_ab = cdbl(total_ab) + cdbl(ab)
			objRs2.MoveNext			
  	Loop		
%> 
  <tr>
 <td colspan="3" align="right">&nbsp;</td>
 <td align="center"><b><font face="arial" size="2"><b>Jumlah</font></b></td>
 <td align="right"><b><font face="arial" size="2">RM <%=FormatNumber(total_ab,2)%></font></b></td></tr>
  <tr>
</table>
<%	end sub	%>

</body>
</html>