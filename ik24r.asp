<!-- '#INCLUDE FILE="ik.asp" -->
<%'response.buffer = False %>
<script language="javascript">
print();
</script>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>i-Kompaun : Kompaun belum Bayar</title>
</head>

<body topmargin="0" leftmargin="0">
<%	'Set objConn = Server.CreateObject("ADODB.Connection")
'	objConn.Open "dsn=12c;uid=majlis;pwd=majlis;"
	
  proses = Request.form("B2")
  tkh1 = Request.form("ftkh1")
  tkh2 = Request.form("ftkh2")
  'daerah = Request.form("fdaerah")
  tkh1a = cstr(mid(tkh1,1,2)) + "/" + cstr(mid(tkh1,3,2)) + "/" + cstr(mid(tkh1,5,4))
  tkh2a = cstr(mid(tkh2,1,2)) + "/" + cstr(mid(tkh2,3,2)) + "/" + cstr(mid(tkh2,5,4))
	
	if proses = "Cetak" then
	
	
			'******************************************************************
		'ika tambah user view jabatan masing2.admin view semua (23/09/2016)
		admin = "select id from hasil.superadmin where id='"&pekz&"' "
		Set objRAdmin = objConn.Execute(admin)
		
		if objRAdmin.eof then
		
		lokasi = "select lokasi from payroll.paymas where no_pekerja='"&pekz&"' "
		Set objRLokasi = objConn.Execute(lokasi)
		
		lok = objRLokasi("lokasi")
		
		
				
		end if
		'end view ikut jabatan
		'******************************************************************


		ff = " select stesyen, no_akaun,nvl(amaun_bayar,0) am,to_char(tarikh,'yyyy') yy,to_char(tarikh,'mm') mm ,to_char(tarikh,'dd') dd, no_resit "
 	    ff = ff & " from kutipan.kutipan where (status = 'B' or status is null) and no_resit is null"
		
		if lok = "112" then 'jabatan perlesenan
		ff = ff & " and no_akaun like '76410'||'%' "
		end if 
		
		if lok = "105" then  'bangunan 
		ff = ff & " and (no_akaun like '76101'||'%' "
		end if
		
		if lok = "103" then  'perbandaran 
		ff = ff & " and (no_akaun like '76412'||'%' or no_akaun like '76415'||'%' or no_akaun like '76416'||'%' )"
		end if 
		
		if lok = "113" then  'kesihatan & veterinar 
		ff = ff & " and ( no_akaun like '76413'||'%' or no_akaun like '76420'||'%' ) "
		end if 
		
		ff = ff & " union "
		ff = ff & " select stesyen, no_akaun, nvl(amaun_bayar,0) am,to_char(tkh_bayar,'yyyy') yy,to_char(tkh_bayar,'mm') mm,"
		ff = ff & " to_char(tkh_bayar,'dd')dd,no_resit "
	    ff = ff & " from hasil.bil where tkh_masuk between to_date('"& tkh1 &"', 'ddmmyyyy') "		
		ff = ff & " and to_date('"& tkh2 &"' , 'ddmmyyyy') "
		ff = ff & " and jabatan = '"& lok &"' and no_resit is null and (post is null or post ='B' )"
		if lok = "112" then 'jabatan perlesenan
		ff = ff & " and no_akaun like '76410'||'%' "
		end if 
		
		if lok = "105" then  'bangunan 
		ff = ff & " and (no_akaun like '76101'||'%' "
		end if
		
		if lok = "103" then  'perbandaran 
		ff = ff & " and (no_akaun like '76412'||'%' or no_akaun like '76415'||'%' or no_akaun like '76416'||'%' )"
		end if 
		
		if lok = "113" then  'kesihatan & veterinar 
		ff = ff & " and ( no_akaun like '76413'||'%' or no_akaun like '76420'||'%' ) "
		end if 

		
		ff = ff & " union "
		
		ff = ff & " select 'MPSPPAY' stesyen,  no_akaun,nvl(amaun,0) am,to_char(tarikh,'yyyy') yy,to_char(tarikh,'mm') mm,"
 	    ff = ff & " to_char(tarikh,'dd')dd,no_resit "
 	    ff = ff & " from hasil.ebayar_trxid where flag <> 'SUCCESSFUL' and status_kutipan is null"
		if lok = "112" then 'jabatan perlesenan
		ff = ff & " and no_akaun like '76410'||'%' "
		end if 
		
		if lok = "105" then  'bangunan 
		ff = ff & " and (no_akaun like '76101'||'%' "
		end if
		
		if lok = "103" then  'perbandaran 
		ff = ff & " and (no_akaun like '76412'||'%' or no_akaun like '76415'||'%' or no_akaun like '76416'||'%' )"
		end if 
		
		if lok = "113" then  'kesihatan & veterinar 
		ff = ff & " and ( no_akaun like '76413'||'%' or no_akaun like '76420'||'%' ) "
		end if 
		
		ff = ff & " order by yy asc,mm asc,dd asc"

		Set objRs2 = objConn.Execute(ff)	

	''response.Write(ff)
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
<table border="0" width="100%" align="center">
  <tr> 
<td width="28" class="hd1" align="center"><b>Bil</b></td>
<td width="65" class="hd1" align="center"><b>No Kompaun</b></td>
<td width="143" class="hd1" align="center"><b>Nama</b></td>
<td width="60" class="hd1" align="center"><b>No Kad Pengenalan</b></td>
<td width="142" class="hd1" align="center"><b>Alamat</b></td>
<td width="90" class="hd1" align="center"><b>Akta</b></td>
<td width="90" class="hd1" align="center"><b>Kesalahan</b></td>
<td width="78" class="hd1" align="center"><b>Tarikh</b></td>
<td width="150" class="hd1" align="center"><b>Tempat</b></td>
<td width="40" class="hd1" align="center"><b>Daerah</b></td>
  </tr>
  <tr>
  <td colspan="10"><hr></td></tr>
  
  <%	ctr = 0
  	ctrz = 0
	bil = 0

	Do while not objRs2.eof
	
	bil = bil + 1
	ctr = cdbl(ctr) + 1
    	ctrz = cdbl(ctrz) + 1
		
		noakaun = objRs2("no_akaun")
		
    	if ctr = 40 then
    		ctr = 1  	
			
			''response.Write(noakaun)
			
		
  %>
</table>

<%mula%>

<center>
<table width="100%" height="46" border="0" align="center">
  <tr> 
<td width="28" class="hd1" align="center"><b>Bil</b></td>
<td width="65" class="hd1" align="center"><b>No Kompaun</b></td>
<td width="143" class="hd1" align="center"><b>Nama</b></td>
<td width="60" class="hd1" align="center"><b>No Kad Pengenalan</b></td>
<td width="142" class="hd1" align="center"><b>Alamat</b></td>
<td width="90" class="hd1" align="center"><b>Akta</b></td>
<td width="90" class="hd1" align="center"><b>Kesalahan</b></td>
<td width="78" class="hd1" align="center"><b>Tarikh</b></td>
<td width="150" class="hd1" align="center"><b>Tempat</b></td>
<td width="40" class="hd1" align="center"><b>Daerah</b></td>
  </tr>
  <tr>
  <td colspan="10"><hr></td></tr>
  
  <%	end if
  
  d = " select no_akaun,perkara, kp,alamat1 ,alamat2,alamat3, no_rujukan2, nama, to_char(tkh_masuk,'ddmmyyyy') tkh_masuk,jabatan, "
		d = d & " perkara1, perkara2,daerah, "
		d = d & " nvl(amaun_bayar,0) amaun_bayar, to_char(tkh_bayar,'ddmmyyyy') tkh_bayar, no_resit "
		d = d & " from hasil.bil "
		'd = d & " where (perkara <> 'P01' or perkara is null) "
		d = d & " where no_akaun = '"& noakaun &"' "
		
		set objRss = objconn.execute(d)
		'response.Write "<br><br>"&(d)
		if not objRss.eof then
		abayar = objRss("amaun_bayar")
		perkara = objRss("perkara")
		kp = objRss("kp")
		alamat1 = objRss("alamat1")
		alamat2 = objRss("alamat2")
		alamat3 = objRss("alamat3")
		no_rujukan2 = objRss("no_rujukan2")
		nama = objRss("nama")
		tkh_masuk =objRss("tkh_masuk")
		jabatan = objRss("jabatan")
		perkara1 = objRss("perkara1")
		perkara2 = objRss("perkara2")
		daerah = objRss("daerah")
		tkh_bayar = objRss("tkh_bayar") 
		no_resit = objRss("no_resit")
		end if 
		
		'jumlah keseluruhan
		
		jamaun = cdbl(jamaun) + cdbl(abayar)
		

		q1="select keterangan from payroll.ptj where kod='"&lok&"'"
		set rq1 = objConn.execute(q1)
		
		if not rq1.eof then namaJabatan = rq1("keterangan")	%>
  <tr> 
    <td height="20" align="center" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=bil%></font></td>
    <td height="20" align="center" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=noakaun%> &nbsp;&nbsp;</font></td>
    
    <td height="20" valign="top" align="left" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=nama%>&nbsp;&nbsp;</font></td>
    <td height="20" align="left" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=kp%>&nbsp;</font></td>
    <td height="20" valign="top" align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=alamat1%>&nbsp;<%=alamat2%><br><%=alamat3%></font></td>
   <% 	

	'------------Akta
	f = " select kod, initcap(keterangan) as terang "
	f = f & " from kompaun.perkara "
	f = f & " where kod = '"&perkara &"' "
   	Set objRsf = objConn.Execute(f)
	
	if not objRsf.eof then
	
	akta = objRsf("terang")
	
	end if
	
	
	'------------kesalahan
	g = " select kod, initcap(keterangan) as terang "
	g = g & " from kompaun.jenis_kesalahan "
	g = g & " where perkara = '"& perkara &"' "
	g = g & " and kod = '"& no_rujukan2 &"' "
	Set objRsg = objConn.Execute(g)
	
	if not objRsg.eof then
	
	kesalahan = objRsg("terang")
	
	end if
		
	
%>
    <td height="20"  valign="top" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=perkara%> : <%=akta%></font></td>
    <td height="20"  valign="top" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=no_rujukan2%> : <%=kesalahan%></font></td>
    <td height="20" align="left"  valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;<%=tkh_masuk%></font></td>
    <td height="20" align="left"  valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;<%=perkara1%>, <%=perkara2%></font></td>
    <td height="20" align="center"  valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=daerah%></font></td>
  </tr>
  <tr>
  <td colspan="10"><hr>
  </td>
  </tr>
  <%Response.flush %>
  <%	objRs2.MoveNext
	Loop
	
	'sresponse.flush
%>
</table>
<%	end sub	%>
<%response.Clear%>
</body>
</html>