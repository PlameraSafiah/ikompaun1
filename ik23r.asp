<title>i-Kompaun : Jenis Kesalahan & Tahun</title>
<body>
<%
	Set objConn = Server.CreateObject("ADODB.Connection")
  	objconn.Open "dsn=12c;uid=majlis;pwd=majlis;"

	tahun = request.querystring("tahun")
	kod11 = request.querystring("kod11")	 
	kod2 = request.querystring("kod2") 
	'kod11="U05"
	'kod2="5"
	'response.write "<p>"&vtkh1&"</p>"
	'response.write "<p>"&tahun&"</p>"
	'response.write "<p>"&kod1&"</p>"
	'response.write "<p>"&kodz&"</p>"	
	muka = 0
	
	if kod11 <> "" then
	   papar
	end if

sub papar 

 	z = "select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') tkh from dual"
  	Set oz = objConn.Execute(z)

	r = " select kod||' - '||initcap(keterangan) as perk, kod "
	r = r & " from kompaun.jenis_kesalahan where kod = '"& kod2 &"' "
	r = r & " and perkara = '"& kod11 &"' "
	Set objRsr = Server.CreateObject ("ADODB.Recordset")
   	Set objRsr = objConn.Execute(r)
	
	f = " select kod, initcap(keterangan) as terang "
	f = f & " from kompaun.perkara "
	f = f & " where kod = '"&kod11&"' "
			
	Set objRsf = Server.CreateObject ("ADODB.Recordset")
   	Set objRsf = objConn.Execute(f)
  	muka = cint(muka) + 1
%>

<table align = "center" border="0" width="100%" cellspacing="0" >
<tr>
  <td><font face="Trebuchet MS" size="1"><%=oz("tkh")%></font></td>
  <td align="right"><font face="Trebuchet MS" size="1">Page : <%=muka%></font></td>
</tr>
</table>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
  <td align="center"><b><font size="3" face="Trebuchet MS">
      MAJLIS PERBANDARAN SEBERANG PERAI<br>
      LAPORAN RINGKASAN JENIS KESALAHAN BAGI<br>
      AKTA <%=kod1%> - <%=objRsf("terang")%><br>
	  <%=objRsr("perk")%><br>
      &nbsp;
      </font></b></td>
</tr>
</table>
<%
		d = " select perkara, no_rujukan2, nvl(sum(amaun_bayar),0) as amaunb, "
		d = d & " count(rowid) as rekod, count(amaun_bayar) as sudah "
		d = d & " from hasil.bil "
		d = d & " where perkara = '"&kod11&"' "
		d = d & " and no_rujukan2 like '%'||'"& kod2 &"' "
		d = d & " and to_char(tkh_masuk,'yyyy') = '"& tahun &"' "
		d = d & " and (no_akaun like '76410'||'%' or no_akaun like '76420'||'%' or no_akaun like '76413'||'%' "
		''kompaun perbandaran
		d = d & " or no_akaun like '76412'||'%' or no_akaun like '76415'||'%' "
		'kompaun bangunan & veterinar
		d = d & " or no_akaun like '76101'||'%') "
		'18042014 : jun tambah boleh papar kod 76413 jugak, sebelum ni 76410 & 76420 saja
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
		d = d & " group by perkara, no_rujukan2 "
		d = d & " order by perkara, no_rujukan2 "
		Set objRs2 = Server.CreateObject ("ADODB.Recordset")
		Set objRs2 = objConn.Execute(d)
	
		if not objRs2.eof then 
	
%>
<table border="0" cellpadding="0" cellspacing="0" width="92%" align="center">
  <tr> 
<td width="5%" align="center" bgcolor=""><b><font size="2" face="Verdana">Bil</font></b></td>
<td width="11%" align="center" bgcolor=""><b><font size="2" face="Verdana">Akta / UUK</font></b></td>
<td width="16%" align="center" bgcolor=""><b><font size="2" face="Verdana">Jenis Kesalahan</font></b></td>
<td width="14%" align="center" bgcolor=""><b><font size="2" face="Verdana">Amaun Bayar</font></b></td>
<td width="10%" align="center" bgcolor=""><b><font size="2" face="Verdana">Rekod</font></b></td>
<td width="14%" align="center" bgcolor=""><b><font size="2" face="Verdana">Sudah Bayar</font></b></td>
<td width="15%" align="center" bgcolor=""><b><font size="2" face="Verdana">Belum Bayar</font></b></td>
</tr>

  <tr> 
    <td align="center" colspan="7" bgcolor="<%=color1%>"> 
      <hr>
    </td>
  </tr>
  <%
  		bil = 0
   		belum = 0
   			
    	Do while not objRs2.EOF
    	
    	rekod = objRs2("rekod")
    	sudah = objRs2("sudah")
    	
    	belum = cdbl(rekod) - cdbl(sudah)
    	bil = bil + 1
%>
 <tr>
    <td width="5%" bgcolor="lightgrey" align="center"><font size="2" face="Verdana"><%=bil%></font></td>
	<td width="11%" bgcolor="lightgrey" align="center"><font size="2" face="Verdana"><%=objRs2("perkara")%></font></td>
	<td width="16%" bgcolor="lightgrey" align="center"><font size="2" face="Verdana"><%=objRs2("no_rujukan2")%></font></td>
	<td width="14%" bgcolor="lightgrey" align="right"><font size="2" face="Verdana"><%=FormatNumber(objRs2("amaunb"),2)%>&nbsp;&nbsp;</font></td>
	<td width="10%" bgcolor="lightgrey" align="center"><font size="2" face="Verdana"><%=objRs2("rekod")%></font></td>
	<td width="14%" bgcolor="lightgrey" align="center"><font size="2" face="Verdana"><%=objRs2("sudah")%></font></td>
	<td width="15%" bgcolor="lightgrey" align="center"><font size="2" face="Verdana"><%=belum%></font></td>
</tr>
  <%
  	objRs2.MoveNext			
  	Loop
%> 
  <tr> 
    <td colspan="7"><font size="2" face="Trebuchet MS"> 
      <hr>
      </font></td>
  </tr>
  
</table>
<%end if%>
<%end sub %>

</body>