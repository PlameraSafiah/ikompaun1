<%response.cookies("ikmenu") = "ik25.asp"%>
<!-- '#INCLUDE FILE="ik.asp" -->
<%Response.Buffer = True%>
<html>
<head>
<title>i-Kompaun : Pembatalan Kompaun</title>
<META content="text/html; charset=iso-8859-1" http-equiv=Content-Type>
<link type="text/css" href="menu.css" REL="stylesheet">
<BODY leftMargin=0 onLoad="" topMargin=0 bgcolor="<%=color4%>">

<SCRIPT LANGUAGE="JavaScript">
<!-- Begin
nextfield = "tkhdari";
netscape = "";
ver = navigator.appVersion; len = ver.length;
for(iln = 0; iln < len; iln++) if (ver.charAt(iln)=="(")break;
netscape = (ver.charAt(iln+1).toUpperCase()!="C");

function keyDown(DnEvents){
k = (netscape)?DnEvents.which : window.event.keyCode;
if(k==13){//enter key pressed
if (nextfield=='done') return true; //submit
else{//send focus to next box
eval('document.myform.'+nextfield + '.focus()');
return false;
	}
  }
 }
document.onkeydown = keyDown;// work together to analyze keystrokes
if (netscape)document.captureEvents(Event.KEYDOWN|Event.KEYUP);
//End-->
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

<form name=myform method="POST" action="ik25.asp">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top"> 
<td width="100%">


<%
	Set objConn = Server.CreateObject("ADODB.Connection")
   objConn.Open "dsn=12c;uid=majlis;pwd=majlis;"
   	
   	proses = Request.form("B1")
   		
	if proses <> "Cari" then
		
		e = " select '01'||to_char(sysdate,'mm')||to_char(sysdate,'yyyy') as tkh1s from dual "
		Set objRse = Server.CreateObject ("ADODB.Recordset")
   		Set objRse = objConn.Execute(e)	
   		tkh1 = objRse("tkh1s")
		
		f = " select to_char(sysdate,'ddmmyyyy') as tkh2s from dual "
		Set objRsf = Server.CreateObject ("ADODB.Recordset")
   		Set objRsf = objConn.Execute(f)	
   		tkh2 = objRsf("tkh2s")
  		
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
    <td class="hd">Tarikh Kompaun Dari&nbsp; :&nbsp;&nbsp; </td>
            <td>  <input type="text" name="tkhdari" value="<%=tkh1%>" onFocus="nextfield='tkhhingga';" size="8" maxlength="8">&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;Hingga&nbsp;
<input type="text" name="tkhhingga" value="<%=tkh2%>" onFocus="nextfield='done';" size="8" maxlength="8">&nbsp;
<input type="submit" value="Cari" name="B1" class="button"></td>
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
	
		b = " select to_date('"&tkh1&"','ddmmyyyy') as tkha, to_date('"&tkh2&"','ddmmyyyy') as tkhb from dual "
   		Set objRsb = objConn.Execute(b)
   		
   		if objRsb.eof then
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
			
		d = " select no_akaun, nama, to_char(tkh_masuk,'dd/mm/yyyy') tkh_masuk, "
		d = d & " to_char(tarikh_post,'dd/mm/yyyy') tarikh_post, "
		d = d & " decode(siri,1,'YDP',2,'SU',3,'Pengarah',null) siri "
		d = d & " from hasil.bil "
		d = d & " where tkh_masuk between to_date('"& tkh1 &"', 'ddmmyyyy') "
		d = d & " and to_date('"& tkh2 &"' , 'ddmmyyyy') "
		d = d & " and (perkara <> 'P01' or perkara is null) "
		d = d & " and (no_akaun like '76410'||'%' or no_akaun like '76420'||'%' or no_akaun like '76413'||'%' "
		''kompaun perbandaran
		d = d & " or no_akaun like '76412'||'%' or no_akaun like '76415'||'%' "
		'kompaun bangunan & veterinar
		d = d & " or no_akaun like '76101'||'%') "
		'18042014 : jun tambah boleh papar kod 76413 jugak, sebelum ni 76410 & 76420 saja
		d = d & " and post = 'B' "
		'******************************************************************
		'ika tambah user view jabatan masing2.admin view semua (23/09/2016)
		admin = "select id from hasil.superadmin where id='"&pekz&"' "
		Set objRAdmin = objConn.Execute(admin)
		
		if objRAdmin.eof then
		
		lokasi = "select lokasi from payroll.paymas where no_pekerja='"&pekz&"' "
		Set objRLokasi = objConn.Execute(lokasi)
		
		lok = objRLokasi("lokasi")
		
		d = d & " and jabatan = '"& lok &"' "
		
		end if
		'end view ikut jabatan
		'******************************************************************
		
		d = d & " order by no_rujukan "	
		
		'response.Write(d)
		Set objRs2 = Server.CreateObject ("ADODB.Recordset")

		objRs2.PageSize = iPageSize
		objRs2.CacheSize = iPageSize
 		
		objRs2.CursorLocation = 3
		objRs2.Open d, objConn
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
       	'proses="Cari"
       else
       if kira > 0 then

%>  
 <table width="50%" cellpadding="1" cellspacing="5" class="hd1">
  <tr >
  	<td align="left" colspan=2 width="143"><b><font face="rockwell" size="2">Jumlah Rekod : <%=kira%></font></b></td>
    <td align="right" colspan=4 width="570" >
      <font face="rockwell" size="2">
	  <% If iPageCurrent <> 1 Then %>
      <a href="ik25.asp?page=1&bilangan=0&ms=pre&dtkh1=<%=tkh1%>&dtkh2=<%=tkh2%>&proses=Cari">
		<img name="firstrec" border="0" src="images/firstrec.jpg" width="20" height="20" alt="Halaman Mula"></a>  
      <% End If %>
      <% If iPageCurrent <> 1 Then%>
      <a href="ik25.asp?page=<%= iPageCurrent - 1 %>&bilangan=<%=bil-count-iPageSize%>&ms=pre&dtkh1=<%=tkh1%>&dtkh2=<%=tkh2%>&proses=Cari">
      	<img name="previous" border="0" src="images/previous.jpg" width="20" height="20" alt="Rekod Sebelum"></a> 
      <% End If %>
      Halaman <%=iPageCurrent%>/<%if iPageCount=0 then%>1<%else%><%=iPageCount%><%end if%>
      <% If iPageCurrent < iPageCount Then	%>
      <a href="ik25.asp?page=<%= iPageCurrent + 1 %>&bilangan=<%=bil%>&ms=next&dtkh1=<%=tkh1%>&dtkh2=<%=tkh2%>&proses=Cari">
      	<img name="next" border="0" src="images/next.jpg" width="20" height="20" alt="Rekod Seterusnya"></a> 
      <% End If 
	  If iPageCurrent < iPageCount Then
	  bil = (iPageCount - 1) * iPageSize %>
      <a href="ik25.asp?page=<%=iPageCount %>&bilangan=<%=bil%>&ms=next&dtkh1=<%=tkh1%>&dtkh2=<%=tkh2%>&proses=Cari">
      	<img name="lastrec" border="0" src="images/lastrec.jpg" width="20" height="20" alt="Halaman Akhir"></a> 
      <% End If %>	
      </font>	
	</td>
  </tr>
  </table>

 <table width="50%" cellpadding="1" cellspacing="5" class="hd1">
    <tr align="center"> 
<td width="32"  class="hd1">Bil</td> 
<td width="105" class="hd1">No Kompaun</td>
<td width="250" class="hd1">Nama</td>
<td width="120" class="hd1">Tarikh Kompaun</td>
<td width="89" class="hd1">Tarikh Batal</td>
<td width="93" class="hd1">Dibatal Oleh</td>
</tr>
<% 
		bil = 0
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

    	
    	ac = objRs2("no_akaun")
    	bil = bil + 1
    	
    	s = " select decode(siri,1,'YDP',2,'SU',3,'Pengarah',null) siri from kompaun.batal_catatan "
    	s = s & " where no_akaun = '"&ac&"' "
    	Set objRss = Server.CreateObject("ADODB.Recordset")
    	Set objRss = objConn.Execute(s)
    	
    	if not objRss.eof then
    		batal = objRss("siri")
    	else batal = ""
    	end if	
%> 
<tr align="center">
<td><%=bil%></td> 
<td><%=objRs2("no_akaun")%></td>
<td><%=objRs2("nama")%></td>
<td><%=objRs2("tkh_masuk")%></td>
<td><%=objRs2("tarikh_post")%></td>
<td><%=batal%></td>
</tr>
<%	iRecordsShown = iRecordsShown + 1
	count = count + 1

  	objRs2.MoveNext			
  	Loop
%> 
</table>
<%	end if	 
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
<form method="post" action="ik25r.asp"> 
 <table width="50%" cellpadding="1" cellspacing="5" class="hd1">
    <tr>
      <td align="center" class="hd"> 
        <input type="submit" value="Cetak" name="B2" class="button">
<input type="hidden" name="ftkh1" value="<%=tkh1%>">
<input type="hidden" name="ftkh2" value="<%=tkh2%>">
</td></tr>
</table>
</form>
<%end if%>
</body>
</html>