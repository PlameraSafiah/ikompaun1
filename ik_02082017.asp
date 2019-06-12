<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
<link href='http://fonts.googleapis.com/css?family=Oswald:700' rel='stylesheet' type='text/css'>
<!--link href="css/style.css" rel="stylesheet" type="text/css"-->
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.vertical.rtl.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/default/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<script src="js/main.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<%response.buffer=true%>
<title>Sistem Pengurusan Kompaun (i-Kompaun)</title>
</head>
<body background="wallpaper.jpg">
<%  Dim color1, color2, color3, color4
	
	color1 = "#CC6666"  // background color
	color2 = "#710F31"  // header color
	color3 = "#FFE9E8" // display color
	color4 = "#CC6666" // background color
	
Set objConn = Server.CreateObject("ADODB.Connection")
  objconn.Open "dsn=12c;uid=majlis;pwd=majlis;"
  
  pekz = request.cookies("gnop")
  
  	'******** select hari **********
	k = " select to_char(sysdate,'DY')arini,to_char(sysdate,'dd/mm/yyyy')tkhni from dual "
	set sk = objconn.execute(k)
	
		if not sk.eof then
			arini = sk("arini")
				if arini = "TUE" then hari = "Selasa"		
				if arini = "WED" then hari = "Rabu"
				if arini = "THU" then hari = "Khamis"
				if arini = "FRI" then hari = "Jumaat"
				if arini = "SAT" then hari = "Sabtu"
				if arini = "SUN" then hari = "Ahad"
				if arini = "MON" then hari = "Isnin"
			tkhni = sk("tkhni")
		end if	

 checkid = "select a.nama, a.lokasi, b.keterangan, to_char(sysdate,'dd / mm / yyyy') tkh  from payroll.paymas a, iabs.jabatan b where a.no_pekerja = '"&pekz&"' and b.kod = a.lokasi"
	set cid = objconn.execute(checkid)
	if not cid.eof then
		pnama = cid("nama")
		plokasi = cid("lokasi")
		pjab = cid("keterangan")
		tkh = cid("tkh")
	end if

  if pekz = "" then
     response.redirect "../sistemnet.asp"
  else
     a =     "select jabatan from majlis.pengguna "
     a = a & " where no_pekerja = '"& pekz &"' "
     Set rsa = objConn.Execute(a)
     
     if rsa.eof then
        response.redirect "../sistemnet.asp"
     end if
  end if

  ikmenu = request.querystring("ik")
  'response.Write(ikmenu)
  if ikmenu = "" then 
     ikmenu = request.cookies("ikmenu")
  end if
 
  s =     "select kod,keterangan ket,perkara,paras,tamat,to_char(sysdate,'dd / mm / yyyy') tkh "
  s = s & "  from majlis.menu_2002 "
  s = s & " where kod = substr('"& ikmenu &"',1,instr('"& ikmenu &"','.',1)-1) and sistem = 'ik' "
  'response.Write(s)
  Set rss = objConn.Execute(s)
  
  if not rss.eof then
     perkara = rss("perkara")
     ket = rss("ket")
     tkh = rss("tkh")
     response.cookies("ikmenu") = rss("kod") + ".asp"
     ikmenu = request.cookies("ikmenu")
	 'response.Write(ket)
     
     paras = rss("paras")
     tamat = rss("tamat")
     
     if tamat = "Y" then
        paras = cdbl(paras) - 1
        
        sx =      "select keterangan as ket from majlis.menu_2002 "
        sx = sx & " where substr('"& ikmenu &"',1,instr('"& ikmenu &"','.',1)-1) like kod||'%' and sistem = 'ik' "
        sx = sx & "   and paras = '"& paras &"' and tamat = 'T' "
        Set rssx = objConn.Execute(sx)
        
        ket = cstr(rssx("ket")) + " >> " + cstr(ket)
     end if  
  end if
%>

<table width="100%" height="50" bgcolor="#710F31">
  <tr> 
    <td rowspan="1" width="75%" ><img src="banner1.jpg"></td>
   <td width="25%" align="right"><font style="font-size:11pt" color="#FFFFFF" face="Calibri"><b>VERSI 1.0<BR/><%=pekz%> - <%=pnama%><br>
	<%=plokasi%> - <%=pjab%><br>
<%=tkh%>&nbsp;</b></font></td>
  </tr>
 
</table>


<%if ikmenu <> "ik.asp" then

  s = " select kod,keterangan ket,perkara,paras,tamat from majlis.menu_2002 "
  s = s & " where kod = substr('"& ikmenu &"',1,instr('"& ikmenu &"','.',1)-1) and sistem = 'ik' "
  Set rss = objConn.Execute(s)

  if not rss.eof then
     perkara = rss("perkara")
     ket = rss("ket")
     response.cookies("ikmenu") = rss("kod") + ".asp"
     ikmenu = request.cookies("ikmenu")
     
     paras = rss("paras")
     tamat = rss("tamat")
     
     if tamat = "Y" then
        paras = cdbl(paras) - 1
        
        sx =      "select keterangan ket from majlis.menu_2002 "
        sx = sx & " where substr('"& ikmenu &"',1,instr('"& ikmenu &"','.',1)-1) like kod||'%' and sistem = 'ik' "
        sx = sx & "   and paras = '"& paras &"' and tamat = 'T' "
        Set rssx = objConn.Execute(sx)
        
        ket = cstr(rssx("ket")) + " >> " + cstr(ket)
		'response.Write(ket)
     end if  
  end if %>

<%  end if 


  t = "Select to_char(sysdate,'dd/mm/yyyy') tkh from dual "
  Set objt = objConn.Execute(t)
  tkh = objt("tkh")
  
s0 =      "select skrin from majlis.kebenaran_2002 "
s0 = s0 & " where no_pekerja = '"& pekz &"' and sistem = 'ik' "
  'response.Write(s0)
set rss0 = objConn.Execute(s0)
do while not rss0.eof 
hkod = cstr(rss0("skrin"))

'*********INPUT DATA **************************************************************************

	if mid(hkod,1,3) = "ik1" then kod_ik1 = "ik1"					'Input
		if mid(hkod,1,4) = "ik11" then kod_ik11 = "ik11"			'maklumat kesalahan
		if mid(hkod,1,4) = "ik12" then kod_ik12 = "ik12"			'notis kesalahan
		if mid(hkod,1,4) = "ik13" then kod_ik13 = "ik13"			'sen ke jbtn undang2
		if mid(hkod,1,4) = "ik14" then kod_ik14 = "ik14"			'pembatalan kompaun
		if mid(hkod,1,4) = "ik15" then kod_ik15 = "ik15"			'kemaskini bayaran
		
'*********PERTANYAAN **************************************************************************

	if mid(hkod,1,3) = "ik2" then kod_ik2 = "ik2"					
		if mid(hkod,1,4) = "ik21" then kod_ik21 = "ik21"    'jenis kesalahn
		if mid(hkod,1,4) = "ik22" then kod_ik22 = "ik22" 	'Ringkasan jenis kesalahan
		if mid(hkod,1,4) = "ik23" then kod_ik23 = "ik23"	'Jenis kesalahn & tahun
		if mid(hkod,1,4) = "ik24" then kod_ik24 = "ik24"	'Kompaun Belum Bayar	
		if mid(hkod,1,4) = "ik25" then kod_ik25 = "ik25"	'Pembatalan kompaun		
		if mid(hkod,1,4) = "ik26" then kod_ik26 = "ik26" 	'Mengikut no komp, nama, alamat
		if mid(hkod,1,4) = "ik27" then kod_ik27 = "ik27"	'pegawai pengeluar kompaun
		if mid(hkod,1,4) = "ik28" then kod_ik28 = "ik28" 	'mengikut tred
		if mid(hkod,1,4) = "ik29" then kod_ik29 = "ik29" 	'kompaun sudah bayar
		if mid(hkod,1,5) = "ik210" then kod_ik210 = "ik210" 	'ring ikut pegawai
		if mid(hkod,1,5) = "ik211" then kod_ik211 = "ik211" 	'sen kompaun ikut daerah
		if mid(hkod,1,5) = "ik212" then kod_ik212 = "ik212" 	'ring kompaun mengikut daerah
		if mid(hkod,1,5) = "ik213" then kod_ik213 = "ik213" 	'mengikut no resit
		if mid(hkod,1,5) = "ik214" then kod_ik214 = "ik214" 	'bil kompaun mngikut daerah
		if mid(hkod,1,5) = "ik215" then kod_ik215 = "ik215" 	'statistik kompaun
		
'********* PENYELENGGARAAN KOD *****************************************************************************
	if mid(hkod,1,3) = "ik4" then kod_ik4 = "ik4"				'Penyelenggaraan Kod  
		if mid(hkod,1,4) = "ik41" then kod_ik41 = "ik41"			'Akta /uuk
		if mid(hkod,1,4) = "ik42" then kod_ik42 = "ik42"			'jenis kesalahan
		if mid(hkod,1,4) = "ik43" then kod_ik43 = "ik43"			'Akta /uuk
		if mid(hkod,1,4) = "ik44" then kod_ik44 = "ik44"			'jenis kesalahan


'********* DAFTAR *****************************************************************************
	if mid(hkod,1,3) = "ik8" then kod_ik8 = "ik8"				'Daftar  
		if mid(hkod,1,4) = "ik81" then kod_ik81 = "ik81"			'pengguna
		if mid(hkod,1,4) = "ik82" then kod_ik82 = "ik82"			'superadmin
				    	
    rss0.movenext
    loop %>

<!--menu-->
<ul id="nav" class="dropdown dropdown-horizontal">

    <% if kod_ik1 = "ik1" then 
	'-------menu input data---------- %>
    <li><span class="dir">Input Data</span>
        <ul>
            <% if kod_ik11 = "ik11" then %>
            <li><a href="ik11.asp?a=ik11.asp">Maklumat Kesalahan</a></li>
            <% end if %>
            
            <% if kod_ik12 = "ik12" then %>
            <li><a href="ik12.asp?a=ik12.asp">Notis Kesalahan (>14 hari)</a></li>
            <% end if %>
            
            <% if kod_ik13 = "ik13" then %>
            <li><a href="ik13.asp?a=ik13.asp">Senarai Ke Jabatan Undang2</a></li>
            <% end if %>
            
             <% if kod_ik14 = "ik14" then %>
            <li><a href="ik14.asp?a=ik14.asp">Pembatalan Kompaun</a></li>
            <% end if %>
            
            <% if kod_ik15 = "ik15" then %>
            <li><a href="ik15.asp?a=ik15.asp">Kemaskini Bayaran</a></li>
            <% end if %>
        </ul>
    </li>
    <% end if %>
    
    <% if kod_ik2 = "ik2" then 
	'-------menu pertanyaan---------- %>
    <li><span class="dir">Pertanyaan</span>
        <ul>
            <% if kod_ik21 = "ik21" then %>
            <li><a href="ik21.asp?a=ik21.asp">Jenis Kesalahan</a></li>
            <% end if %>
            
            <% if kod_ik22 = "ik22" then %>
            <li><a href="ik22.asp?a=ik22.asp">Ringkasan Jenis Kesalahan</a></li>
            <% end if %>
            
            <% if kod_ik23 = "ik23" then %>
            <li><a href="ik23.asp?a=ik23.asp">Jenis Kesalahan & Tahun</a></li>
            <% end if %>
            
             <% if kod_ik24 = "ik24" then %>
            <li><a href="ik24.asp?a=ik24.asp">Kompaun Belum Bayar</a></li>
            <% end if %>
            
            <% if kod_ik25 = "ik25" then %>
            <li><a href="ik25.asp?a=ik25.asp">Pembatalan Kompaun</a></li>
            <% end if %>
            
            <% if kod_ik26 = "ik26" then %>
            <li><a href="ik26.asp?a=ik26.asp">Mengikut No Kompaun, Nama & Alamat</a></li>
            <% end if %>
            
            <% if kod_ik27 = "ik27" then %>
            <li><a href="ik27.asp?a=ik27.asp">Pengeluar Kompaun</a></li>
            <% end if %>
            
            <% if kod_ik28 = "ik28" then %>
            <li><a href="ik28.asp?a=ik28.asp">Mengikut Tred</a></li>
            <% end if %>
            
            <% if kod_ik29 = "ik29" then %>
            <li><a href="ik29.asp?a=ik29.asp">Kompaun Sudah Bayar</a></li>
            <% end if %>
            
            <% if kod_ik210 = "ik210" then %>
            <li><a href="ik210.asp?a=ik210.asp">Ringkasan Mengikut Pegawai</a></li>
            <% end if %>
            
            <% if kod_ik211 = "ik211" then %>
            <li><a href="ik211.asp?a=ik211.asp">Senarai Kompaun Mengikut Daerah</a></li>
            <% end if %>
            
            <% if kod_ik212 = "ik212" then %>
            <li><a href="ik212.asp?a=ik212.asp">Ringkasan Kompaun Mengikut Daerah</a></li>
            <% end if %>
            
            <% if kod_ik213 = "ik213" then %>
            <li><a href="ik213.asp?a=ik213.asp">Mengikut No Resit</a></li>
            <% end if %>
            
            <% if kod_ik214 = "ik214" then %>
            <li><a href="ik214.asp?a=ik214.asp">Bilangan Kompaun Mengikut Daerah</a></li>
            <% end if %>
            
            <% if kod_ik215 = "ik215" then %>
            <li><a href="ik215.asp?a=ik215.asp">Statistik Kompaun</a></li>
            <% end if %>
        </ul>
    </li>
    <% end if %>
    
      <% if kod_ik4 = "ik4" then 
	'-------menu Peyelenggaraan---------- %>
    <li><span class="dir">Penyelenggaraan Kod</span>
        <ul>
            <% if kod_ik41 = "ik41" then %>
            <li><a href="ik41.asp?a=ik41.asp">Akta /UUK </a></li>
            <% end if %>
            <% if kod_ik42 = "ik42" then %>
            <li><a href="ik42.asp?a=ik42.asp">Jenis Kesalahan</a></li>
            <% end if %>
            <% if kod_ik43 = "ik43" then %>
            <li><a href="ik43.asp?a=ik43.asp">Jenis Tred</a></li>
            <% end if %>
             <% if kod_ik44 = "ik44" then %>
            <li><a href="ik44.asp?a=ik44.asp">Jadual Pembayaran</a></li>
            <% end if %>


        </ul>
    </li>
    <% end if %>

    <% if kod_ik8 = "ik8" then 
	'-------menu daftar---------- %>
    <li><span class="dir">Daftar</span>
        <ul>
            <% if kod_ik81 = "ik81" then %>
            <li><a href="ik81.asp?a=ik81.asp">Pengguna</a></li>
            <% end if %>
            <% if kod_ik82 = "ik82" then %>
            <li><a href="ik82.asp?a=ik82.asp">Superadmin</a></li>
            <% end if %>
        </ul>
    </li>
    <% end if %>
    
        <li><span class="dir">Sistem</span>
        <ul>
            <li><a href="#" onClick="return pasti()">Logout Sistem</a></li>
        </ul>
    </li>
</ul> 
<!--end menu-->  
<br>
<table width="100%" bgcolor="<%=color1%>" style="font-family: Rockwell; font-size: 10pt;">
  <tr height="1">
    <td valign="bottom">&nbsp;&nbsp;&nbsp;<%=ket%></td>
  </tr>
</table>

</body>