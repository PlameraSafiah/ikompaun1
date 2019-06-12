<!-- '#INCLUDE FILE="ik.asp" -->

<title>i-Kompaun : Ringkasan Jenis Kesalahan</title>
<body>
<%
	'Set objConn = Server.CreateObject("ADODB.Connection")
'  	objconn.Open "dsn=12c;uid=majlis;pwd=majlis;"

	vtkh1 = request.querystring("tkh1")
	vtkh2 = request.querystring("tkh2")
	kod11 = request.querystring("kod11")
	kod22 = request.querystring("kod22")
	
	muka = 0
	
	if kod11 <> "" then
	   papar
	end if

sub papar 

 	z = "select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') tkh from dual"
  	Set oz = objConn.Execute(z)
	
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
      &nbsp;
      </font></b></td>
</tr>
</table>
<%		b = " select to_date('"&vtkh1&"','ddmmyyyy') as tkha,"
		b = b & " to_date('"&vtkh2&"','ddmmyyyy') as tkhb from dual "
		Set objRsb = Server.CreateObject ("ADODB.Recordset")
   		Set objRsb = objConn.Execute(b)
   		
   		if objRsb.eof then
   		response.write "<script language=""javascript"">"
       response.write "var timeID = setTimeout('invalid_date(""  "");',1) "
       response.write "</script>"
 	
		else
 		tkha = objRsb("tkha")
 		tkhb = objRsb("tkhb")	
 		
 
		
		d = " select perkara,no_rujukan2,nvl(sum(amaun_bayar),0) as amaunb, "
		d = d & " count(rowid) as rekod, count(amaun_bayar) as sudah "
		d = d & " from hasil.bil "
		d = d & " where perkara like '"&kod11&"' "
		d = d & " and no_rujukan2 like '%'||'"&kod22&"' "
		d = d & " and tkh_masuk between to_date('"&vtkh1&"','ddmmyyyy') "
		d = d & " and to_date('"&vtkh2&"','ddmmyyyy') "
		'd = d & " and (no_akaun like '76410'||'%' or no_akaun like '76420'||'%') "
		'18042014 : jun tambah boleh papar kod 76413 jugak, sebelum ni 76410 & 76420 saja
		d = d & " and (no_akaun like '76410'||'%' or no_akaun like '76420'||'%' or no_akaun like '76413'||'%' "
		''kompaun perbandaran
		d = d & " or no_akaun like '76412'||'%' or no_akaun like '76415'||'%' "
		'kompaun bangunan & veterinar
		d = d & " or no_akaun like '76101'||'%'or no_akaun like '76441'||'%') "
	 
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
		
		d = d & " group by perkara,no_rujukan2 "
		d = d & " order by perkara,no_rujukan2 "

		Set objRs2 = Server.CreateObject ("ADODB.Recordset")
		Set objRs2 = objConn.Execute(d)
end if
	
%>
<table border="0" cellpadding="0" cellspacing="0" width="92%" align="center">
  <tr> 
     <td width="74" align="center" bgcolor="<%=color1%>"><b><font size="2" face="Verdana">Bil</font></b></td>
	 <td width="74" align="center" bgcolor="<%=color1%>"><b><font size="2" face="Verdana">Akta/UUK</font></b></td>
	 <td width="121" align="center" bgcolor="<%=color1%>"><b><font size="2" face="Verdana">Jenis Kesalahan</font></b></td>
	 <td width="83" align="center" bgcolor="<%=color1%>"><b><font size="2" face="Verdana">Amaun Byr</font></b></td>
	 <td width="81" align="center" bgcolor="<%=color1%>"><b><font size="2" face="Verdana">Rekod</font></b></td>
	 <td width="100" align="center" bgcolor="<%=color1%>"><b><font size="2" face="Verdana">Sudah Byr</font></b></td>
	 <td width="106" align="center" bgcolor="<%=color1%>"><b><font size="2" face="Verdana">Belum Byr</font></b></td>
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
    <td width="74" bgcolor="lightgrey" align="center"><font size="2" face="Verdana"><%=bil%></font></td> 
	<td width="74" bgcolor="lightgrey" align="center"><font size="2" face="Verdana"><%=objRs2("perkara")%></font></td>
	<td width="121" bgcolor="lightgrey" align="center"><font size="2" face="Verdana"><%=objRs2("no_rujukan2")%></font></td>
	<td width="83" bgcolor="lightgrey" align="right"><font size="2" face="Verdana"><%=FormatNumber(objRs2("amaunb"),2)%>&nbsp;&nbsp;</font></td>
	<td width="81" bgcolor="lightgrey" align="center"><font size="2" face="Verdana"><%=objRs2("rekod")%></font></td>
	<td width="100" bgcolor="lightgrey" align="center"><font size="2" font face="Verdana"><%=objRs2("sudah")%></font></td>
	<td width="106" bgcolor="lightgrey" align="center"><font size="2" font face="Verdana"><%=belum%></font></td>
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
<%end sub %>

</body>