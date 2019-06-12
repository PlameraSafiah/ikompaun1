<%Response.Buffer = True%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>i-Kompaun : No Kompaun, Nama & Alamat</title>

</head>

<body topmargin="0" leftmargin="0">

<form method = "POST" action= "ha2126c.asp">
<% 	Set objConn = Server.CreateObject("ADODB.Connection")
   	objConn.Open "dsn=12c;uid=majlis;pwd=majlis;"


	proses = "CETAK"
	nakaun1 = Request.form("akaunz")
	
	if proses = "CETAK" then
	
	
	
	b = "select a.no_akaun,a.jabatan,a.kategori,a.nama,a.alamat1,a.alamat2,a.alamat3, "
	b = b & " to_char(a.tkh_entry,'dd/mm/yyyy') tkh1, a.perkara1,a.perkara2,a.perkara3,a.no_rujukan,"
	b = b & " a.no_rujukan2,nvl(a.amaun,0) as amaun, lpad(a.penyedia,5,0)penyedia, initcap(b.keterangan) as jab "
	b = b & " from hasil.bil a, iabs.jabatan b "
	b = b & " where a.rowid = '"&nakaun1&"' and a.jabatan = b.kod "
	b = b & " and (no_akaun like '76410'||'%' or no_akaun like '76420'||'%' or no_akaun like '76413'||'%' "
	''kompaun perbandaran
	b = b & " or no_akaun like '76412'||'%' or no_akaun like '76415'||'%' "
	'kompaun bangunan & veterinar
	b = b & " or no_akaun like '76101'||'%') "
		'18042014 : jun tambah boleh papar kod 76413 jugak, sebelum ni 76410 & 76420 saja
	Set objRs2 = Server.CreateObject("ADODB.Recordset")
	Set objRs2 = objConn.Execute(b) 
	
	if not objRs2.eof then
		nopek = objRs2("penyedia")
	end if	
	
	
	
	d = " select initcap(nama) nama from payroll.paymas where no_pekerja = '"&nopek&"' "
	Set objRs3 = Server.CreateObject ("ADODB.Recordset")
	Set objRs3 = objConn.Execute(d)        		 		
        		
   	if not objRs3.eof then
   		napek = objRs3("nama")
   else
   		napek = ""
	end if

	
response.write"<p>&nbsp;</p>"
		response.write"<p>&nbsp;</p>"
		response.write"<p>&nbsp;</p>"
		response.write"<p>&nbsp;</p><br><br>"
		response.write"<p>&nbsp;&nbsp;&nbsp;"&objRs2("nama")&"<br>"
		response.write"&nbsp;&nbsp;&nbsp;"&objRs2("alamat1")&"<br>"
		response.write"&nbsp;&nbsp;&nbsp;"&objRs2("alamat2")&"<br>"
		response.write"&nbsp;&nbsp;&nbsp;"&objRs2("alamat3")&"</p></br>"
		response.write"<p>&nbsp;</p>"
		response.write"<p><b>Tarikh :</b>"&objRs2("tkh1")&"</p>"
		response.write"<p></p>"
		response.write"<p><b>No.Akaun :</b>"&objRs2("no_akaun")&"</p>"
		response.write"<p></p>"
		response.write"<p><b>No.Rujukan :</b>"&objRs2("no_rujukan")&"</p>"
		response.write"<p></p>"
		response.write"<p><b>Jabatan :</b>"&objRs2("jab")&"</p>"
		response.write"<p></p>"
		response.write"<p><b>Perihal :</b>"&objRs2("perkara1")&"</p>"
		response.write"<p></p>"
<!--		response.write"<p><b>Jumlah Perlu Dibayar :&nbsp;RM&nbsp;</b>"&FormatNumber(objRs2("amaun"),2)&"</p>"-->
		response.write"<p>SALINAN KOMPAUN</p>"
		response.write"<p><b>Disediakan :&nbsp;"&nopek&"&nbsp;-</b>&nbsp;"&napek&"</p>"
		response.write"<p>&nbsp;</p>"
		response.write"<p>&nbsp;</p>"
		response.write"<p>&nbsp;</p>"
		response.write"<p>&nbsp;</p><br><br>"
	%>
<table width="100%" height="7">
<tr><td width="100%" height="7"></td>
</tr>
</table>	
	
<%	
		response.write"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"&objRs2("kategori")&"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"&objRs2("nama")&"<br>"
		response.write"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"&objRs2("alamat1")&"<br>"
		response.write"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"&objRs2("alamat2")&"<br>"
		response.write"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"&objRs2("alamat3")&""
		response.write"<p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No.Rujukan :</b>"&objRs2("no_rujukan")&"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>"
		response.write"<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Jumlah Perlu Dibayar :&nbsp;RM&nbsp;</b>"&FormatNumber(objRs2("amaun"),2)&"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>"
		response.write"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"&objRs2("no_akaun")&"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"&objRs2("tkh1")&"&nbsp;&nbsp;&nbsp;&nbsp;"&objRs2("jabatan")&"&nbsp;&nbsp;-&nbsp;&nbsp;"&objRs2("kategori")&"<br>"	
		response.write"<b>Disediakan :&nbsp;&nbsp;&nbsp;"&nopek&"&nbsp;-</b>&nbsp;"&napek&""
	end if
%>


</form>
</body>

</html>
