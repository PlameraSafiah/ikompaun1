<%response.cookies("ikmenu") = "ik24.asp"%>
<!-- '#INCLUDE FILE="ik.asp" -->
<%Response.Buffer = True%>
<html>
<head>
<title>i-Kompaun : Kompaun Belum Bayar</title>
<META content="text/html; charset=iso-8859-1" http-equiv=Content-Type>
<link type="text/css" href="menu.css" REL="stylesheet">
<BODY leftMargin=0 onLoad="" topMargin=0 bgcolor="<%=color4%>">

<SCRIPT LANGUAGE="JavaScript">
<!-- Begin
nextfield = "tkhdari";
netscape="";
ver=navigator.appVersion; len=ver.length;
for(iln=0;iln<len;iln++)if(ver.charAt(iln)=="(")break;
netscape=(ver.charAt(iln+1).toUpperCase()!="C");

function keyDown(DnEvents){
k=(netscape)?DnEvents.which:window.event.keyCode;
if(k==13){
if(nextfield=='done')return true;
else{
eval('document.myform.'+nextfield+'.focus()');
return false;
		}
	}
}
document.onkeydown=keyDown;
if(netscape)document.captureEvents(Event.KEYDOWN|Event.KEYUP);
//End -->
</script>

<script language="javascript">
   function invalid_data(a)
    {  
       alert (a+" Tiada Rekod !!! ");
		return(true);
    }
    function invalid_tarikh(b)
    {  
       alert (b+" Tarikh Salah !!! ");
		return(true);
    }
</script>
</head>

<form name=myform method="POST" action="ik24.asp">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top"> 
<td width="100%">
<%
	'Set objConn = Server.CreateObject("ADODB.Connection")
'   objConn.Open "dsn=12c;uid=majlis;pwd=majlis;"
   	
   	proses = Request.form("B1")
'   if proses = "Cetak" then
'			response.cookies("tkh1") = tkh1
'			response.cookies("tkh2") = tkh2
'            response.redirect "ik24a.asp"
'	end if		
	if proses <> "Cari" and proses <> "Cetak" then	
		e = " select '01'||to_char(sysdate,'mm')||to_char(sysdate,'yyyy') tkh1, to_char(sysdate,'ddmmyyyy') tkh2 from dual "
		Set objRse = Server.CreateObject ("ADODB.Recordset")
   		Set objRse = objConn.Execute(e)	
   		tkh1 = objRse("tkh1")
   		tkh2 = objRse("tkh2")
   		 		
	end if

	
	if proses = "Cari" then
		tkh1 = Request.form("tkhdari")	
		tkh2 = Request.form("tkhhingga")
	end if

	dtkh1 = Request.QueryString("dtkh1")
	
	if dtkh1 <> "" then
		tkh1 = Request.QueryString("dtkh1")
		tkh2 = Request.QueryString("dtkh2")
	end if
    
%>
 <table width="50%" cellpadding="1" cellspacing="5" class="hd">
  <tr> 
    <td class="hd">Tarikh Kompaun&nbsp;</td>
    <td>
<input type="text" name="tkhdari" value="<%=tkh1%>" size="8" maxlength="8" onFocus="nextfield='tkhhingga';">
Hingga
<input type="text" name="tkhhingga" value="<%=tkh2%>" size="8" maxlength="8" onFocus="nextfield='done';">&nbsp;
<input type="submit" value="Cari" name="B1" class="button">
              &nbsp;&nbsp; </td>
</tr>
<script>
	document.myform.tkhdari.focus();
  </script>
</table>

<%	Dim iPageSize,iPageCount,iPageCurrent,iRecordsShown
	Dim S
	iPageSize = 50

	If Request.QueryString("page") = "" Then
		iPageCurrent = 1
	Else
		iPageCurrent = CInt(Request.QueryString("page"))
	End If
	

	if proses = "Cari" or dtkh1 <> "" then
	
		b = " select to_date('"&tkh1&"','ddmmyyyy') tkha,"
		b = b & " to_date('"&tkh2&"','ddmmyyyy') tkhb from dual "
		Set objRsb = Server.CreateObject ("ADODB.Recordset")
   		Set objRsb = objConn.Execute(b)
   		
   		if objRsb.eof  then
   		  		response.write "<script language=""javascript"">"
       		response.write "var timeID = setTimeout('invalid_tarikh(""  "");',1) "
      			response.write "</script>"
       	else
      		tkha = objRsb("tkha")
			tkhb = objRsb("tkhb")
			
      		if tkha > tkhb then
      			response.write "<script language=""javascript"">"
       		response.write "var timeID = setTimeout('invalid_tarikh(""  "");',1) "
      			response.write "</script>"
      		else
   		  
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
		ff = ff & " and (no_akaun like '76410'||'%') "
		end if 
		
		if lok = "105" then  'bangunan 
		ff = ff & " and (no_akaun like '76101'||'%') "
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
		ff = ff & " and (no_akaun like '76410'||'%') "
		end if 
		
		if lok = "105" then  'bangunan 
		ff = ff & " and (no_akaun like '76101'||'%' )"
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
		ff = ff & " and (no_akaun like '76410'||'%' )"
		end if 
		
		if lok = "105" then  'bangunan 
		ff = ff & " and (no_akaun like '76101'||'%' )"
		end if
		
		if lok = "103" then  'perbandaran 
		ff = ff & " and (no_akaun like '76412'||'%' or no_akaun like '76415'||'%' or no_akaun like '76416'||'%' )"
		end if 
		
		if lok = "113" then  'kesihatan & veterinar 
		ff = ff & " and ( no_akaun like '76413'||'%' or no_akaun like '76420'||'%' ) "
		end if 
		
		ff = ff & " order by yy asc,mm asc,dd asc"
		'response.write(ff)
		Set objRs2 = Server.CreateObject ("ADODB.Recordset")
		
		objRs2.PageSize = iPageSize
		objRs2.CacheSize = iPageSize
 		
		objRs2.CursorLocation = 3
		objRs2.Open ff, objConn
		iPageCount = objRs2.PageCount 
		
		
		if not objRs2.bof and not objRs2.eof then
		kira=objRs2.recordcount
		rekod="ada"
		If iPageCurrent > iPageCount Then iPageCurrent = iPageCount
		If iPageCurrent < 1 Then iPageCurrent = 1

		bil=0
		bilangan=Request.QueryString("bilangan")
		ms=Request.QueryString("ms")
		
		If bilangan <>"" and ms="next" then
			bil = bilangan
		End If
		If bilangan <>"" and ms="pre" then
			bil = bilangan
		End If
		
		If iPageCount <> 0 Then
			objRs2.AbsolutePage = iPageCurrent
   			iRecordsShown = 0
			count = 0
		Do While iRecordsShown <iPageSize And Not objRs2.eof 
			iRecordsShown = iRecordsShown + 1
			count = count + 1
			bil=bil + 1
		objRs2.movenext
		loop
		end if
		end if

			
			
		if objRs2.bof and objRs2.eof then
			response.write "<script language=""javascript"">"
       	response.write "var timeID = setTimeout('invalid_data(""  "");',1) "
       	response.write "</script>"
		else

		if kira > 0 then
%>  

 <table width="50%" cellpadding="1" cellspacing="5" class="hd1">
  <tr align="right">
  	<td align="left" width="20%" ><b><font face="rockwell" size="2">Jumlah Rekod : <%=kira%></font></b></td>
    <td width="75%" >
      <font face="rockwell" size="2">
	  <% If iPageCurrent <> 1 Then %>
      <a href="ik24.asp?page=1&bilangan=0&ms=pre&dtkh1=<%=tkh1%>&dtkh2=<%=tkh2%>&proses=CARI">
		<img name="firstrec" border="0" src="images/firstrec.jpg" width="20" height="20" alt="Halaman Mula"></a>  
      <% End If %>
      <% If iPageCurrent <> 1 Then%>
      <a href="ik24.asp?page=<%= iPageCurrent - 1 %>&bilangan=<%=bil-count-iPageSize%>&ms=pre&dtkh1=<%=tkh1%>&dtkh2=<%=tkh2%>&proses=Cari">
      	<img name="previous" border="0" src="images/previous.jpg" width="20" height="20" alt="Rekod Sebelum"></a> 
      <% End If %>
      Halaman <%=iPageCurrent%>/<%if iPageCount=0 then%>1<%else%><%=iPageCount%><%end if%>
      <% If iPageCurrent < iPageCount Then	%>
      <a href="ik24.asp?page=<%= iPageCurrent + 1 %>&bilangan=<%=bil%>&ms=next&dtkh1=<%=tkh1%>&dtkh2=<%=tkh2%>&proses=Cari">
      	<img name="next" border="0" src="images/next.jpg" width="20" height="20" alt="Rekod Seterusnya"></a> 
      <% End If 
	  If iPageCurrent < iPageCount Then
	  bil = (iPageCount - 1) * iPageSize %>
      <a href="ik24.asp?page=<%=iPageCount %>&bilangan=<%=bil%>&ms=next&dtkh1=<%=tkh1%>&dtkh2=<%=tkh2%>&proses=Cari">
      	<img name="lastrec" border="0" src="images/lastrec.jpg" width="20" height="20" alt="Halaman Akhir"></a> 
      <% End If %>	
      </font>	
	</td>
  </tr>
</table>

 <table width="50%" cellpadding="1" cellspacing="5" class="hd1">
    <tr align="center"> 
<td width="28" class="hd1">Bil</td>
<td width="71" class="hd1">No Kompaun</td>
<td width="143" class="hd1">Nama</td>
<td width="60" class="hd1">No Kad Pengenalan</td>
<td width="142" class="hd1">Alamat</td>
<td width="90" class="hd1">Akta</td>
<td width="90" class="hd1">Kesalahan</td>
<td width="78" class="hd1">Tarikh</td>
<td width="150" class="hd1">Tempat</td>
<td width="40" class="hd1">Daerah</td>
</tr>
<%		bil = 0
		ctrz = 0
	
		bilangan=Request.QueryString("bilangan")
		page = Request.QueryString("page")
		ms=Request.QueryString("ms")

		If bilangan <>"" and ms="next" then
			bil = bilangan
		End If
		If bilangan <>"" and ms="pre" then
			bil = bilangan
		End If
		If iPageCount <> 0 Then
			objRs2.AbsolutePage = iPageCurrent
   			iRecordsShown = 0
			count = 0
			
		Do While iRecordsShown <iPageSize And Not objRs2.eof 


		bil = bil + 1
		ctrz = cdbl(ctrz) + 1
					noakaun = objRs2("no_akaun")
			'response.Write(noakaun)
			
			
		stesyen = objRs2("stesyen")
	 	amq = objRs2("am")
		yy = objRs2("yy")
		mm = objRs2("mm")
		dd = objRs2("dd")		
		'tkhq = cstr(dd)+"/"+cstr(mm)+"/"+cstr(yy)
		resitq = objRs2("no_resit")
		
		
			
			
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
		tkh_masuk = objRss("tkh_masuk")
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
		
		if not rq1.eof then namaJabatan = rq1("keterangan")

%>
 <tr>
<td align="center" valign="top"><%=bil%></td>
<td align="center" valign="top"><%=noakaun%></td>
<td valign="top"><%=nama%></td>
<td valign="top"><%=kp%></td>
<td valign="top"><%=alamat1%>&nbsp;<%=alamat2%><br><%=alamat3%></td>
<% 	

	'------------Akta
	f = " select kod, initcap(keterangan) as terang "
	f = f & " from kompaun.perkara "
	f = f & " where kod = '"& perkara &"' "
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
<td valign="top"><%=perkara%> : <%=akta%></td>
<td valign="top"><%=no_rujukan2%> : <%=kesalahan%> </td>
<td align="center" valign="top"><%=tkh_masuk%></td>
<td align="left"> <%=perkara1%>, <%=perkara2%></td>
<td valign="top" align="center"><%=daerah%></td>
</tr>
<%	iRecordsShown = iRecordsShown + 1
	count = count + 1

  	objRs2.MoveNext			
  	Loop
%> 
</table>
<%  		end if	
  			end if
  			end if
      		end if
  			end if	  
  			'end if
%>

</td>  
</tr>
</table>
</form>
<form method="post" action="ik24r.asp"> 
 <table width="50%" cellpadding="1" cellspacing="5" class="hd1">
    <tr>
      <td align="center" class="hd"> 
        <input type="submit" value="Cetak" name="B2" class="button">
<input type="hidden" name="ftkh1" value="<%=tkh1%>">
<input type="hidden" name="ftkh2" value="<%=tkh2%>">
</td></tr>
</table>
<p>&nbsp;</p></form>
<%end if%>
</body>