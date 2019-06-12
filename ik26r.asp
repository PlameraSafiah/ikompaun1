<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>i-Kompaun : No Kompaun, Nama & Alamat</title>
</head>

<body onload='self.print()' topmargin="0" leftmargin="0">
<%	Set objConn = Server.CreateObject("ADODB.Connection")
	objConn.Open "dsn=12c;uid=majlis;pwd=majlis;"
	
  proses = Request.form("B2")
  rujuk = Request.form("frujuk1")
  add2 = Request.form("fadd2")
  nama2= Request.form("fnama2")

	
	if proses = "Cetak" then
	
		d = " select no_akaun, perkara, no_rujukan2 , initcap(nama) nama, to_char(tkh_masuk,'dd/mm/yyyy') tkh_masuk, " 
		d = d & " nvl(amaun_bayar,0) amaun_bayar, decode(tkh_bayar,null,'0',to_char(tkh_bayar,'dd/mm/yyyy')) tkh_bayar, nvl(no_resit,'-') no_resit "
		d = d & " from hasil.bil "
		d = d & " where (perkara <> 'P01' or perkara is null) "
		d = d & " and no_akaun like '"& rujuk &"'||'%' "
		d = d & " and (no_akaun like '76410'||'%' or no_akaun like '76420'||'%' or no_akaun like '76413'||'%' "
		''kompaun perbandaran
		d = d & " or no_akaun like '76412'||'%' or no_akaun like '76415'||'%' "
		'kompaun bangunan & veterinar
		d = d & " or no_akaun like '76101'||'%') "
		'18042014 : jun tambah boleh papar kod 76413 jugak, sebelum ni 76410 & 76420 saja
		d = d & " and nama like '"& nama2 &"'||'%' "
		d = d & " and alamat1||alamat2||alamat3 like decode('"& add2 &"',null, "
		d = d & " alamat1||alamat2||alamat3,'%'||'"& add2 &"'||'%') "	
		'd = d & " order by no_akaun "  
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
    <td width="100%" align="center"><font face="MS Serif" size="3"><b>LAPORAN 
      MENGIKUT NO.KOMPAUN,NAMA@ALAMAT</b></font></td>
</tr></table>

<p></p>
<table width="85%" align="center" border="0">
  <tr> 
    <td nowrap><font size="2" face="Verdana"><b> No. Kompaun</b></font></td>
    <td ><strong><font size="2" face="Arial"> :</font></strong></td>
    <td width="85%" ><font size="2" face="Verdana"><%=rujuk%></font></td>
  </tr>
  <tr> 
    <td width="14%" nowrap>&nbsp;&nbsp;<font size="2" face="Verdana"><b>Nama</b></font></td>
    <td width="1%" ><strong><font size="2" face="Arial">:&nbsp;</font></strong></td>
    <td ><font size="2" face="Verdana"><%=nama2%>&nbsp;&nbsp;</font></td>
  </tr>
  <tr> 
    <td nowrap><font size="2" face="Verdana"><b> Alamat</b></font></td>
    <td ><strong><font size="2" face="Arial">:</font></strong></td>
    <td ><font size="2" face="Verdana"><%=add2%></font></td>
  </tr>
</table>
<hr>
<%	end sub	%>



<%	sub badan		%>

<center>
<table border="0" width="100%" align="center">
  <tr> 
    <td align="center"><b><font size="2" face="Arial">Bil</font></b></td>
    <td align="center"><b><font size="2" face="Arial">No Kompaun</font></b></td>
    <td align="center"><b><font size="2" face="Arial">Akta</font></b></td>
    <td align="center"><b><font size="2" face="Arial">Jenis</font></b></td>
    <td width="40%" align="center"><b><font size="2" face="Arial">Nama</font></b></td>
    <td align="center"><b><font size="2" face="Arial">Tkh Kompaun</font></b></td>
    <td align="center"><strong><font size="2" face="Arial">Amaun</font></strong></td>
    <td align="center"><b><font size="2" face="Arial">Tkh Bayar</font></b></td>
    <td align="center"><b><font size="2" face="Arial">Resit</font></b></td>
  </tr>
  <%	ctr = 0
  	ctrz = 0
	bil = 0

	Do while not objRs2.eof
	
	tb=objrs2("tkh_bayar")
	name=objrs2("nama")
	nama=mid(name,1,30)
		 if tb="0" then
		  tkh="-"
		  else
		  tkh=objrs2("tkh_bayar")
		  end if
	
	bil = bil + 1
	ctr = cdbl(ctr) + 1
    	ctrz = cdbl(ctrz) + 1
    	if ctr = 30 then
    		ctr = 1  	
  %>
</table>

<%mula%>

<center>
<table width="100%" height="46" border="0" align="center">
  <tr> 
    <td align="center"><b><font size="2" face="Arial">Bil</font></b></td>
    <td align="center"><b><font size="2" face="Arial">No Kompaun</font></b></td>
    <td align="center"><b><font size="2" face="Arial">Akta</font></b></td>
    <td align="center"><b><font size="2" face="Arial">Jenis</font></b></td>
    <td width="40%" align="center"><b><font size="2" face="Arial">Nama</font></b></td>
    <td align="center"><b><font size="2" face="Arial">Tkh Kompaun</font></b></td>
    <td align="center"><strong><font size="2" face="Arial">Amaun</font></strong></td>
    <td align="center"><b><font size="2" face="Arial">Tkh Bayar</font></b></td>
    <td align="center"><b><font size="2" face="Arial">Resit</font></b></td>
  </tr>
  <%	end if	%>
  <tr> 
    <td height="20" align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=bil%></font></td>
    <td height="20" align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=objRs2("no_akaun")%></font></td>
    <td align="left" nowrap><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=objRs2("perkara")%></font></td>
    <td align="left" nowrap><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;<%=objRs2("no_rujukan2")%></font></td>
    <td width="40%" align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=name%></font></td>
    <td height="20" align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;<%=objRs2("tkh_masuk")%></font></td>
    <td align="center" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=formatnumber(objRs2("amaun_bayar"),2)%></font></td>
    <td height="20" align="center" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=tkh%>&nbsp;&nbsp;</font></td>
    <td height="20" align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=objRs2("no_resit")%></font></td>
  </tr>
  <%ab = objRs2("amaun_bayar")
		total_ab = cdbl(total_ab) + cdbl(ab)
			objRs2.MoveNext
	Loop
%>
  <tr>
 <td colspan="6" align="center"><b><font size="2" face="Arial">Jumlah</font></b></td>
 <td align="right"><b><font size="2" face="Arial">RM <%=FormatNumber(total_ab,2)%></font></b></td></tr>
  <tr>

</table>
<%	end sub	%>

</body>
</html>