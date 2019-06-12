<!--#include file="connection.asp"-->
<!-- '#INCLUDE FILE="ik.asp" -->
<%Response.Buffer = True%>
<html>
<head>
<title>i-Kompaun : Notis Kesalahan</title>
<META content="text/html; charset=iso-8859-1" http-equiv=Content-Type>
<link type="text/css" href="menu.css" REL="stylesheet">
<BODY leftMargin=0 onLoad="" topMargin=0 bgcolor="<%=color4%>">

<%response.buffer = True %>
<%server.scripttimeout=600%>
<html>
<head>
<script language="Javascript">
function invalid_post(a)
    {  
       alert (a+" Tiada Rekod ");
		return(true);
    }
function invalid_tarikh(b)
    {  
       alert (b+" Tarikh Salah ");
		return(true);
    }
function invalid_bayar(c)
    {  
       alert (c+" Kompaun Telah Dijelaskan ");
		return(true);
    }    
 
</script>

<body OnLoad="cssHorScrolls();">
<form name=komp method="POST" action="ik12kb.asp">
<%	
	proses=Request.form("B1")
	b2 = Request.form("B2")
	b3 = Request.form("B3")
	ftkh = Request.form("ftkh")
	tkhd = Request.form("tkhd")
	tkhh = Request.form("tkhh")
	dtkhd = request.form("dtkhd")
	dtkhh = request.form("dtkhh")
	nopek = request.cookies("gnop")
	ac = Request.form("fakaun") 
	Response.cookies("vac") = ""  	
   
	dtkh = request.QueryString("dtkh")
	tkhdr = request.QueryString("tkhdr")
	tkhhg = request.QueryString("tkhhg")
		
	if tkhdr <> "" then tkhd = tkhdr
	if tkhhg <> "" then tkhh = tkhhg
	if dtkh <> "" then ftkh = dtkh
		
	if tkhd = "" or tkhh = "" or ftkh = "" then		
   		f = " select to_char(sysdate,'ddmmyyyy') as tkhs,'0101'||to_char(sysdate,'yyyy') td from dual "
   		Set objRsf = objConn.Execute(f)	
   		ftkh = objRsf("tkhs")
		tkhd=objRsf("td")
		tkhh=objRsf("tkhs")
	end if
	
'***************************************** SUB KEPALA *******************************************************

	sub kepala
%>
 <table width="50%" cellpadding="1" cellspacing="5" class="hd">
  <tr align="center" bgcolor="<%=color2%>"> 
<td class="hd">
<input type="submit" value="Pencarian" name="B1" class="button2">
<input type="submit" value="Cetak Semula Notis" name="B1" class="button1">
<input type="submit" value="Reset" name="B1" class="button">
</td></tr></table>

<%	end sub	
'********************************* 	PROSES UPDATE		*************************************************

'*********************************************************************************************************

	Dim iPageSize,iPageCount,iPageCurrent,iRecordsShown
	Dim S
	iPageSize = 20

	If Request.QueryString("page") = "" Then
		iPageCurrent = 1
	Else
		iPageCurrent = CInt(Request.QueryString("page"))
	End If
	
	if proses = "" then
		kepala
	elseif proses = "Pencarian" then
		kepala
		mula	
	elseif proses = "Cetak Semula Notis" then
		kepala
		mula2
	elseif proses = "Reset" then
		proses = ""
		kepala		
	end if

  b4 = Request.QueryString("b2")  
  
  if b2 = "Cari" or b4 = "Cari" or proses = "Hantar" then  
		f = " select to_char(round(to_date('"& ftkh &"','ddmmyyyy') - 14 ),'ddmmyyyy') tkhs from dual "
		'response.Write(f)
		Set objRsf = objConn.Execute(f)
		if objRsf.eof then
			mula
		response.write "<script language=""javascript"">"
       	response.write "var timeID = setTimeout('invalid_tarikh(""  "");',1) "
       	response.write "</script>"     
		else 		
			tkhs = objRsf("tkhs")
			mula
			form
		end if	
	end if			

	if b3 = "Cetak" then
		c = " select no_kompaun as no_akaun, amaun_bayar from osc.kompaun_kebersihan_maklumat where no_kompaun = '"&ac&"' "
	
		c = c & "  and tarikh_bayar is null  "
	
		Set rs4 = objConn.Execute(c)
		
		if rs4.eof then
		mula2
		response.write "<script language=""javascript"">"
       	response.write "var timeID = setTimeout('invalid_post(""  "");',1) "
       	response.write "</script>" 
       else
       if not isNull(rs4("amaun_bayar")) then	    
		mula2
		response.write "<script language=""javascript"">"
       	response.write "var timeID = setTimeout('invalid_bayar(""  "");',1) "
       	response.write "</script>" 
       else
			Response.cookies("vac") = Request.form("fakaun")	
			response.redirect "ik12n2.asp"
		end if	
		end if
	end if	
'************************************* SUB MULA *********************************************************
sub mula%> <br>
 <table width="50%" cellpadding="1" cellspacing="5" class="hd">
  <tr> 
<td class="hd">
     Tarikh Kompaun : </td><td>
          <input name="tkhd" type="text" value="<%=tkhd%>" size="8" maxlength="8"> &nbsp;Hingga &nbsp;
        <input name="tkhh" type="text" value="<%=tkhh%>" size="8" maxlength="8">
          </td>
          </tr>
  <tr> 
<td class="hd">Tarikh Notis :</td><td>
          
          <input type="submit" value="Cari" name="B2"  class="button"></td>
    </tr>
  </table>
<%end sub%>

<%'************************************* SUB MULA2 *********************************************************
		sub mula2		%>
        <br>
 <table width="50%" cellpadding="1" cellspacing="5" class="hd">
  <tr> 
<td class="hd">No Akaun</td><td>
<input type="text" name="fakaun" size="11" value="<%=ac%>" maxlength="11">
<input type="submit" value="Cetak" name="B3" onFocus="nextfield='done';" class="button"></td>
</tr></table>
<%		end sub		
'****************************************** SUB FORM ***************************************************	
 
	sub form
		d = " select rowid, akta as perkara, jenis_kompaun as no_rujukan2, no_kompaun as no_akaun, initcap(nama_pemilik) nama,"
		d = d & " to_char(tarikh_kompaun,'ddmmyyyy') as tkh_masuk"
     	d = d & " from osc.kompaun_kebersihan_maklumat "
		d = d & " where tarikh_kompaun< to_date('"& tkhs &"','ddmmyyyy') "
		d = d & " and tarikh_kompaun between to_date('"&tkhd&"','ddmmyyyy') and to_date('"&tkhh&"','ddmmyyyy')"
			d = d & " and tarikh_bayar is null "
	 
				'******************************************************************
		d = d & " order by substr(tarikh_kompaun,5,4),substr(tarikh_kompaun,3,2),substr(tarikh_kompaun,1,2),no_kompaun"
		'response.Write(d)
		Set r2 = Server.CreateObject("ADODB.Recordset")
   		
			r2.PageSize = iPageSize
			r2.CacheSize = iPageSize
 		
			r2.CursorLocation = 3
			r2.Open d, objConn
			iPageCount = r2.PageCount 		
		
			if not r2.bof and not r2.eof then
			kira=r2.recordcount
			rekod="ada"
			If iPageCurrent > iPageCount Then iPageCurrent = iPageCount
			If iPageCurrent < 1 Then iPageCurrent = 1

			bil=0
			bilangan=Request.QueryString("bilangan")
			ms=Request.QueryString("ms")
		
			If bilangan <>"" and ms="next" then				bil = bilangan
			If bilangan <>"" and ms="pre" then				bil = bilangan
		
			If iPageCount <> 0 Then
				r2.AbsolutePage = iPageCurrent
   				iRecordsShown = 0
				count = 0
			Do While iRecordsShown <iPageSize And Not r2.eof 
				iRecordsShown = iRecordsShown + 1
				count = count + 1
				bil=bil + 1
			r2.movenext
			loop
			end if
			end if	
	
		if r2.bof and r2.eof then
		response.write "<script language=""javascript"">"
       	response.write "var timeID = setTimeout('invalid_post(""  "");',1) "
       	response.write "</script>"     
	 else 		%>
 <table width="50%" cellpadding="1" cellspacing="5" class="hd1">
    <tr align="center"> 
  	<td colspan="3" align="left" class="hd1">Jumlah Rekod : <%=kira%></td>
    <td colspan="6"  class="hd1">
	  <% If iPageCurrent <> 1 Then %>
      <a href="ik12kb.asp?page=1&bilangan=0&ms=pre&dtkh=<%=ftkh%>&tkhdr=<%=tkhd%>&tkhhg=<%=tkhh%>&b2=Cari">
		<img name="firstrec" border="0" src="images/firstrec.jpg" width="20" height="20" alt="Halaman Mula"></a>  
      <% End If %>
      <% If iPageCurrent <> 1 Then%>
      <a href="ik12kb.asp?page=<%= iPageCurrent - 1 %>&bilangan=<%=bil-count-iPageSize%>&ms=pre&dtkh=<%=ftkh%>&tkhdr=<%=tkhd%>&tkhhg=<%=tkhh%>&b2=Cari">
      	<img name="previous" border="0" src="images/previous.jpg" width="20" height="20" alt="Rekod Sebelum"></a> 
      <% End If %>
      Halaman <%=iPageCurrent%>/<%if iPageCount=0 then%>1<%else%><%=iPageCount%><%end if%>
      <% If cint(iPageCurrent) < cint(iPageCount) Then	%>
      <a href="ik12kb.asp?page=<%= iPageCurrent + 1 %>&bilangan=<%=bil%>&ms=next&dtkh=<%=ftkh%>&tkhdr=<%=tkhd%>&tkhhg=<%=tkhh%>&b2=Cari">
      	<img name="next" border="0" src="images/next.jpg" width="20" height="20" alt="Rekod Seterusnya"></a> 
      <% End If 
	  If cint(iPageCurrent) < cint(iPageCount) Then
	  bil = (iPageCount - 1) * iPageSize %>
      <a href="ik12kb.asp?page=<%=iPageCount %>&bilangan=<%=bil%>&ms=next&dtkh=<%=ftkh%>&tkhdr=<%=tkhd%>&tkhhg=<%=tkhh%>&b2=Cari">
      	<img name="lastrec" border="0" src="images/lastrec.jpg" width="20" height="20" alt="Halaman Akhir"></a> 
      <% End If %>	
	</td>
  </tr>  
  
    <tr align="center"> 
  <td width="5%" class="hd1" >Bil</td>
  <td width="11%" class="hd1">Akta/ UUK</td>
  <td width="10%" class="hd1">Kesalahan</td>
  <td width="14%" class="hd1">No Kompaun</td>
  <td width="30%" class="hd1">Nama</td>
  <td width="9%" class="hd1">Tarikh Kompaun</td>
  <td width="10%" class="hd1">Bil Notis</td>
  <td width="6%" class="hd1">Tarikh Cetakan Terakhir</td>
  <td width="8%" class="hd1" >Notis</td>
  </tr>
    <% 	bil = 0
		ctrz = 0
	
		bilangan=Request.QueryString("bilangan")
		ms=Request.QueryString("ms")
		page = Request.QueryString("page")
	
		if page = "" or page = 1 then
			tot = 0
		else
			tot = (page-1)*20
		end if	

		If bilangan <>"" and ms="next" then
			bil = bilangan
		End If
		If bilangan <>"" and ms="pre" then
			bil = bilangan
		End If
		If iPageCount <> 0 Then
			r2.AbsolutePage = iPageCurrent
   			iRecordsShown = 0
			count = 0			
			
		Do While iRecordsShown <iPageSize And Not r2.eof 		
		
    	bil = bil + 1
		tot = cdbl(tot) + 1		
		
    	tnotis1 = "tiada"'r2("tarikh_notis1")
    	tnotis2 = "tiada"'r2("tarikh_notis2")
    	tnotis3 = "tiada"'r2("tarikh_notis3")
		ctk = "tiada"'r2("cetak")
    	
    	if tnotis3 <> "" then
    		bilnotis = 3
    	elseif tnotis2 <> "" then
    		bilnotis = 2
    	elseif tnotis1 <> "" then
    		bilnotis = 1
    	else
    		bilnotis = "" 	
    	end if		    	
%> 
  <tr bgcolor="<%=color3%>" align="center"> 
  <td><font face="Verdana" size="2"><%=tot%></font>
     <input type="hidden" name="frowid<%=bil%>" value="<%=r2("rowid")%>" ></td>
  <td><font face="Verdana" size="2"><%=r2("perkara")%></font>
  <input type="hidden" name="ftnotis1<%=bil%>" value="<%'=r2("tarikh_notis1")%>" ></td>
  <td><font face="Verdana" size="2"><%=r2("no_rujukan2")%></font>
  <input type="hidden" name="ftnotis2<%=bil%>" value="<%'=r2("tarikh_notis2")%>" ></td>
  <td><font face="Verdana" size="2"><%=r2("no_akaun")%></font></td>
  <td align="left"><font face="Verdana" size="2"><%=r2("nama")%></font></td>
  <td><font face="Verdana" size="2"><%=r2("tkh_masuk")%></font></td>
  <td><font size="2" face="Verdana"><%'=r2("post")%><%=bilnotis%></font>
  <input type="hidden" name="fstatus<%=bil%>" value="<%'=r2("post")%>" ></td>
  <td><font face="Verdana" size="2"><%'=r2("tkh_cetak")%></font></td>
  <td><input name="fpost<%=bil%>" type="checkbox" value='N' <%if ctk="Y" then %>checked><% end if%></td>
  <%	iRecordsShown = iRecordsShown + 1
		count = count + 1		
		r2.MoveNext			
  		Loop				%> 
  </tr>
</table>  
 <table width="50%" cellpadding="1" cellspacing="5" class="hd1">
<tr>
<td width="50%" height="21" align="right" class="hd">
<input type="hidden" name="bilrec" value="<%=bil%>">
<input type="submit" value="Proses Notis" name="B1" class="button2">
</td>
<td width="50%" height="21"  class="hd">
<input type="submit" value="Cetak" name="B1" onClick="this.form.action='ik12n.asp?tkhd=<%=tkhd%>&tkhh=<%=tkhh%>&ftkh=<%=ftkh%>';" class="button">
</td>
</tr></table>
<%		end if
		end if		
	end sub
%>
</form>
</body>