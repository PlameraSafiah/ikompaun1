<!-- '#INCLUDE FILE="connection.asp" -->
<%response.buffer = True %>
<%server.scripttimeout=600%>
<html>
<head>
<style type="text/css">
#try
{  text-align: justify;}
</style>
<title>i-Kompaun : Notis Kesalahan</title>
</head>
<body topmargin="0" leftmargin="0">
<form method="POST" action="ik12ntest.asp">
<% 
Function Capitalize(X)
 'return a string with the first letter of the word capitalised
 If IsNull(X) Then
  Exit Function
 Else
  lowercaseSTR = CStr(LCase(X))
  OldC = " "
  MyArray = Split(lowercaseSTR," ")
  For IntI = LBound(MyArray) To UBound(MyArray)
   For I = 1 To Len(MyArray(IntI))
    If Len(MyArray(IntI)) = 1 Then
     newString = newString & UCase(MyArray(IntI)) & " "
    ElseIf I=1 Then
     newString = newString & UCase(Mid(MyArray(IntI), I, 1))
    ElseIf I = Len(MyArray(IntI)) Then
     newString = newString & Mid(MyArray(IntI), I, 1) & " "
    Else
     newString = newString & Mid(MyArray(IntI), I, 1)
    End If
   Next
  Next 'IntI
  Capitalize = Trim(newString)
 End If
End Function

	'Set objConn = Server.CreateObject("ADODB.Connection")
'	objConn.Open "dsn=12c;uid=majlis;pwd=majlis;"

	ftkh = Request.querystring("ftkh")
	tkh1 = Request.querystring("tkhd")
	tkh2 = Request.querystring("tkhh")
	
	pek = request.cookies("gnop")
	response.write "pek"&pek
	f = "select jabatan from majlis.pengguna where no_pekerja='"&pek&"' "
	set rf = objconn.execute(f)
	
	if not rf.eof then	jab = rf("jabatan")	
	
	tt = " select to_char(sysdate,'ddmmyyyy') tkhs, to_char(sysdate,'mm') tkhss from dual "
	Set pt = objConn.Execute(tt)
	tkhd = pt("tkhs")
	bulan = pt("tkhss")
	
	if bulan = "01" then namabulan = "JANUARI"
	if bulan = "02" then namabulan = "FEBRUARI"
	if bulan = "03" then namabulan = "MAC"
	if bulan = "04" then namabulan = "APRIL"
	if bulan = "05" then namabulan = "MEI"
	if bulan = "06" then namabulan = "JUN"
	if bulan = "07" then namabulan = "JULAI"
	if bulan = "08" then namabulan = "OGOS"
	if bulan = "09" then namabulan = "SEPTEMBER"
	if bulan = "10" then namabulan = "OKTOBER"
	if bulan = "11" then namabulan = "NOVEMBER"
	if bulan = "12" then namabulan = "DISEMBER"
	
	tkhdd = mid(tkhd,1,2)+" "+cstr(namabulan)+" "+mid(tkhd,5,4)
		
  '****************************************		SELECT		**************************************************	
		bilcount = Request.form("bilrec")				
		for i = 1 to bilcount
		
		fpost = "fpost"+ cstr(i)
		fid = "frowid" + cstr(i)
				
		vpost = Request.form(""&fpost&"")
		vrowid = Request.form(""&fid&"")				
		
		if vpost = "N" then
		
		d = " select perkara, no_rujukan2, initcap(perkara1||' '||perkara2) tempat, no_akaun, upper(nama) nama, "
		d = d & " alamat1, alamat2, alamat3, to_char(masa) masa, to_char(tkh_masuk,'dd/mm/yyyy') as tkh_masuk, post, "
		d = d & " nvl(amaun,0) amaun, tarikh_notis1, tarikh_notis2, tarikh_notis3,tred from hasil.bil "
		d = d & " where rowid = '"&vrowid&"' and tkh_bayar is null and post='N' "
		d = d & " order by no_akaun "		
		Set r2 = objConn.Execute(d)
		
		Do while not r2.eof
		kara = r2("perkara")
		rujuk2 = r2("no_rujukan2")
		waktu = r2("masa")
		tnotis1 = r2("tarikh_notis1")
		tnotis2 = r2("tarikh_notis2")
		tnotis3 = r2("tarikh_notis3")
		tred = r2("tred")
				
		if tnotis3 > "0" then
			bilnotis = "Notis Ketiga"
		elseif isNull(tnotis3) and not isNull(tnotis2) then
			bilnotis = "Notis Kedua"	
		elseif isNull(tnotis2) and tnotis1 > "0" then
			bilnotis = "Notis Pertama"	
		end if
		
		g = "update hasil.bil set cetak = null, tkh_cetak = to_date('"&tkhd&"','ddmmyyyy') where rowid = '"&vrowid&"' "
		'response.Write(g)
		set gg = objconn.execute(g)		
			
		c = " select initcap(keterangan||' '||keterangan2) terang from kompaun.jenis_kesalahan " 
		c = c & " where perkara = '"&kara&"' and kod = '"&rujuk2&"' "
		Set objRsc = objConn.Execute(c)
		
		if not objRsc.eof then
			jenis_salah = objRsc("terang")
		end if	
				
    	if waktu = 24 then
   				waktu1 = 12
   				ampm = "pm"
   			else
   			if waktu >=  13 then
   				waktu1 = waktu - 12
   				ampm = "pm"   			
   			else
   				if waktu < 13.00 or waktu = 12 then
   				waktu1 = waktu
   				ampm = "am"	
   			end if
   			end if
   		end if
		   		%>

<table width="100%">
<tr>
<td width="15%" align="center"><img src="images/mpsp1.jpg" width="70" height="71"></td>
<td ><font face="Verdana" size="2">MAJLIS PERBANDARAN SEBERANG PERAI
<br>JALAN PERDA UTAMA,BANDAR PERDA
<br>14000 BUKIT MERTAJAM
<br>
<br>TEL : 04-5497555
<br>Laman Web : www.mpsp.gov.my
</font></td>
</tr>
</table>
______________________________________________________________________________________________

<p class="standard"><font face="Verdana" size="2">PEMBERITAHUAN TENTANG KESALAHAN DI BAWAH UNDANG-UNDANG 
KECIL MAJLIS PERBANDARAN SEBERANG PERAI</font></p>
<br>
<p class="standard"><font face="Verdana" size="2">Kepada :</font>
<table width="100%" cellspacing=0 cellpadding=0 >
<tr><td><font face="Verdana" size="2"><%=r2("nama")%></font></td></tr>
<tr><td><font face="Verdana" size="2"><%=r2("alamat1")%></font></td></tr>
<tr><td><font face="Verdana" size="2"><%=r2("alamat2")%>&nbsp;</font></td></tr>
<tr><td><font face="Verdana" size="2"><%=r2("alamat3")%>&nbsp;</font></td></tr>
</table>

<p class="standard"><u><b><font face="Times New Roman" size="2">KOMPAUN UNTUK TINDAKAN MAHKAMAH <!--(<%=bilnotis%>)--></font></b></u></p>
<p class="standard" id="try"><font face="Verdana" size="2">Lanjutan kepada kompaun bernombor</font><font face="Arial" size="2"> <b><%=r2("no_akaun")%></b></font>
<font face="Verdana" size="2">yang telah anda terima pada </font><font face="Arial" size="2"><b><%=r2("tkh_masuk")%></b></font> 
<font face="Verdana" size="2">dengan ini dimaklumkan bahawa anda belum lagi menjelaskan denda yang telah ditawarkan sebanyak RM250.00 .</font></p>
<br>
<p class="standard"><u><b><font face="Times New Roman" size="2">BUTIR-BUTIR KESALAHAN</font></b></u>

<table width=100% cellspacing="0" cellpadding="0">
<tr>
<td width=15%><font face="Verdana" size="2">&nbsp;TARIKH</font></td>
<td width=85%><font face="Verdana" size="2">: <%=r2("tkh_masuk")%></font></td>
</tr>
<tr>
<td width=15%><font face="Verdana" size="2">&nbsp;WAKTU</font></td>
<td width=85%><font face="Verdana" size="2">: <%=waktu1%>&nbsp;<%=ampm%></font></td>
</tr>
<tr>
<td width=15%><font face="Verdana" size="2">&nbsp;TEMPAT</font></td>
<td width=85%><font face="Verdana" size="2">: <%=r2("tempat")%></font></td>
</tr>
<tr>
<td width=15%><font face="Verdana" size="2">&nbsp;KESALAHAN</font></td>
<td width=85%><font face="Verdana" size="2">: <%=jenis_salah%></font></td>
</tr>
</table>
<br>
  <p class=standard id=try><font face="Verdana" size="2">2. Dengan ini adalah diberitahu 
    anda bolehlah berjumpa dengan pegawai kompaun di 
    <%if jab="112" then %>Jabatan Pelesenan, Tingkat 
1, <%elseif jab="105" then%>Jabatan Bangunan, Tingkat 
6,<%elseif jab="103" then%>Jabatan Perkhidmatan Perbandaran, Tingkat 
2,<%else%>Jabatan Kesihatan, Tingkat 7, <%end if%>    Majlis Perbandaran Seberang Perai,Jalan Perda Utama, Bandar Perda,14000 Bukit 
    Mertajam pada hari kerja dalam tempoh 7 hari di antara jam 7.30 pagi hingga 
    5.30 petang di mana anda diberi peluang menjelaskan kompaun ini supaya dakwaan 
    di Mahkamah tidak perlu diteruskan.</font></p>	
<br>
<p class="standard"><font face="Verdana" size="2">Pembayaran boleh di buat dengan</font>
<b><font face="Arial" size="2"> WANG TUNAI / KIRIMAN POS / CEK</font></b>
<font face="Verdana" size="2">dibayar kepada MAJLIS PERBANDARAN SEBERANG PERAI dan di palang dengan perkataan 
'AKAUN PENERIMAAN SAHAJA'.</font></p>
<p class="standard"><font face="Verdana" size="2">Sila abaikan notis ini sekiranya bayaran telah dibuat.<br>
<br>Saya yang menurut perintah,</font></p>
<br>
<%	if jab = "113" then

	
		s = " select upper(nama) nama,jawatan from kehadiran.pengarah where lokasi='"&jab&"'"
		set nms = objconn11g.Execute(s)
	
		if not nms.eof then		nama_pengarah = nms("nama")
	
		sd = " select upper(b.nama) nama from  payroll.paymas b, hasil.kawalan a where b.no_pekerja = a.kesihatan_unit "	
		Set nmsd = objConn.Execute(sd)
	
		if not nmsd.eof then		nama_kunit = nmsd("nama")
	
	else
	
		s = " select upper(nama) nama,jawatan from kehadiran.pengarah where lokasi='"&jab&"'"
		set nms = objconn11g.Execute(s)
	
		if not nms.eof then		
			nama_pengarah = nms("nama")
			jawatan = Capitalize(nms("jawatan"))
		end if

	end if
%>

<p class="standard"><font face="Arial" size="2"><b>( <%=nama_pengarah%> )</b></font>
<br><font face="Verdana" size="2"><%if jab="113" then%>
Timbalan Pengarah Perkhidmatan Kesihatan,<%	else%>
<%=jawatan%>,
<%end if%>
<br>b.p Setiausaha Perbandaran</font></p>
<p class="standard"><font face="Verdana" size="2">Bertarikh : <%=tkhdd%></font></p>
<p class="standard"><font face="Verdana" size="2"><%if jab <> "112" then%>sk. 1.&nbsp;&nbsp;Ketua Unit<%end if%>&nbsp;</font
><br><font face="Verdana" size="1">Notis Ini Adalah Cetakan Berkomputer Tandatangan Tidak Diperlukan</font></p>
<br>
<%		r2.MoveNext
		Loop		
		end if		
		next%>
</form>
</body>
</html>