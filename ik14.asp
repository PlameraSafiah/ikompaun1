<%response.cookies("ikmenu") = "ik14.asp"%>
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

nextfield = "no_rujuk2";
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
<SCRIPT LANGUAGE="JavaScript">
function check(z){

if (z.no_rujuk2.value==""){
alert("Sila Masukkan No Kompaun !!!");
z.no_rujuk2.focus();
return false;}
}
</script>

<script language="javascript">
function invalid_kompaun(a)
    {  
       alert (a+" Tiada Rekod ");
		return(true);
    }
function invalid_tkhbatal(b)
    {  
       alert (a+" Tarikh mesti dimasukkan !!! ");
		return(true);
    }
function invalid_amaunbayar(c)
    {  
       alert (c+" Kompaun Telah Dijelaskan !!! ");
		return(true);
    }
function invalid_rujuk(d)
	{
		alert (d+" No Kompaun Salah !!! ");
		return(true);
	}
function invalid_tarikh(e)
	{
		alert (e+" Tarikh Salah !!! ");
		return(true);
	}
function invalid_post(f)
	{
		alert (f+" Kompaun Telah Dihantar ke Jabatan Undang² !!! ");
		return(true);
	}
</script>
</head>


<table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolorlight="#003366">
<tr valign="top"> 
          
<td width="100%" bgcolor="#FFFFFF"> 
<form name=myform method="POST" action="ik14.asp" onSubmit="return check(this)"> 

<%	Set objConn = Server.CreateObject("ADODB.Connection")
   objConn.Open "dsn=12c;uid=majlis;pwd=majlis;"
   
   proses = Request.form("B1")
   hantar = Request.form("B2")
   reset = Request.form("B3")
   rujuk = Request.form("no_rujuk2")

%> 
 <table width="50%" cellpadding="1" cellspacing="5" class="hd">
  <tr> 
<td class="hd"> 
No Kompaun </td><td>&nbsp;
<input type="text" name="no_rujuk2" size="11" value="<%=rujuk%>" maxlength="12" onFocus="nextfield='B1';">&nbsp;
<input type="submit" value="CARI" name="B1" onFocus="nextfield='done';" class="button"></td></tr></table>
<%
  '********************************	PROSES UPDATE		*********************************************
  
	
	if hantar = "HANTAR" then
	
		drujuk = Request.form("frujuk")
		dpost = Request.form("fpost")
		dtarikh_post = Request.form("ftarikh_post")
		dbatal = Request.form("fbatal")
		dbutir = Request.form("fcatat")
		dno_resit = Request.form("fno_resit")


		y = " select to_date(to_char(sysdate,'ddmmyyyy'),'ddmmyyyy') tkhs, "
		y = y & " to_date('"&dtarikh_post&"','ddmmyyyy') tkh2s from dual "
		Set objRsy = Server.CreateObject ("ADODB.Recordset")
		Set objRsy = objConn.Execute(y)
		tkhs = objRsy("tkhs")
		tkh2s = objRsy("tkh2s")
			

		if tkh2s > tkhs then
			
			response.write "<script language=""javascript"">"
       	response.write "var timeID = setTimeout('invalid_tarikh(""  "");',1) "
       	response.write "</script>"
		else
			
			if dpost = "B" then
				
				
				f = " update hasil.bil set post = '"&dpost&"', no_resit = '"& dno_resit &"', "
				f = f & " tkh_bayar = to_date('"& dtarikh_post &"','ddmmyyyy'), "
				f = f & " tarikh_post = to_date('"& dtarikh_post &"','ddmmyyyy') "
				f = f & " where no_akaun = '"& drujuk &"' "			
				Set objRs4 = Server.CreateObject ("ADODB.Recordset")
				Set objRs4 = objConn.Execute(f)
				'dah ok 
				
				j = " select * from kompaun.batal_catatan where no_akaun = '"&drujuk&"' "
				Set objRs4j = Server.CreateObject("ADODB.Recordset")
				Set objRs4j = objConn.Execute(j)
				
				if objRs4j.eof then
					k = " insert into kompaun.batal_catatan(no_akaun, siri, butir) values "
					k = k & " ('"&drujuk&"', '"&dbatal&"', '"&dbutir&"') "
					Set objRs4k = Server.CreateObject("ADODB.Recordset")
					Set objRs4k = objConn.Execute(k)
					response.Write"k :" + k
				else	
					 m = " update kompaun.batal_catatan set siri = '"&dbatal&"', butir = '"&dbutir&"' "
					 m = m & " where no_akaun = '"& drujuk &"' "
					 Set objRs4m = Server.CreateObject("ADODB.Recordset")
					 Set objRs4m = objConn.Execute(m)
					 response.Write"m :" + m
				end if	 
				
			
			else
				if dpost = "T" then
				
				g = " update hasil.bil set post = '"&dpost&"', no_resit = null, tarikh_post = null, "
				g = g & " tkh_bayar = null, siri = null "
				g = g & " where no_rujukan like '"& drujuk &"' "			
				Set objRs5 = Server.CreateObject ("ADODB.Recordset")
				Set objRs5 = objConn.Execute(g)
				
				
				n = " select * from kompaun.batal_catatan where no_akaun = '"&drujuk&"' "
				Set objRs5n = Server.CreateObject("ADODB.Recordset")
				Set objRs5n = objConn.Execute(n)
				
				if not objRs5n.eof then
					p = " delete kompaun.batal_catatan where no_akaun = '"&drujuk&"' "
					Set objRs5p = Server.CreateObject("ADODB.Recordset")
					Set objRs5p = objConn.Execute(p)
				end if	

			end if
			end if
	end if
	end if



  '**************************************		PROSES RESET	*******************************************
  
  
  	if reset = "RESET" then
  		response.redirect "ik14.asp"
  	end if	


  '**************************************		PROSES CARI	*******************************************
  
  
  Dim B
  
	
	if proses = "CARI" or rujuk <>"" then

		frujuk = mid(rujuk,1,5)

		if frujuk <> "76410" and frujuk <> "76420" and frujuk <> "76413" and frujuk <> "76101" and frujuk <> "76412" and frujuk <> "76415" and frujuk <> "76441" then
 		response.write "<script language=""javascript"">"
       	response.write "var timeID = setTimeout('invalid_rujuk(""  "");',1) "
       	response.write "</script>"
	'response.Write("salah")
		elseif  len(rujuk) < 11  then
 		response.write "<script language=""javascript"">"
       	response.write "var timeID = setTimeout('invalid_rujuk(""  "");',1) "
       	response.write "</script>"
	
		else
	'response.Write("masuk")
		a = " select amaun_bayar from hasil.bil where no_akaun = '"& rujuk &"' "
		a = a & " and amaun_bayar  > 0 and (perkara <> 'P01' or perkara is null) "
		Set objRs1 = Server.CreateObject ("ADODB.Recordset")
		Set objRs1 = objConn.Execute(a)
		
		
		if not objRs1.eof then
			response.write "<script language=""javascript"">"
       	response.write "var timeID = setTimeout('invalid_amaunbayar(""  "");',1) "
       	response.write "</script>"
       	
		else
	
		
		d = " select no_akaun, nama, perkara, no_rujukan2, to_char(tkh_masuk,'ddmmyyyy') as tkh_masuk, "
		d = d & " to_char(masa) masa, perkara1, perkara2, tred, post, "
		d = d & " to_char(tkh_bayar,'ddmmyyyy') as tkh_bayar, no_resit, siri "
		d = d & " from hasil.bil "
		d = d & " where no_akaun = '"& rujuk &"' "
		'd = d & " and (perkara <> 'P01' or perkara is null) "
		'd = d & " and (no_akaun like '76410'||'%' or no_akaun like '76420'||'%') "
		'19032014 : jun tambah bagi akaun 76413 boleh tengok jugak
		d = d & " and (no_akaun like '76410'||'%' or no_akaun like '76420'||'%' or no_akaun like '76413'||'%' "
		''kompaun perbandaran
		d = d & " or no_akaun like '76412'||'%' or no_akaun like '76415'||'%' "
		'kompaun bangunan & veterinar
		d = d & " or no_akaun like '76101'||'%'or no_akaun like '76441'||'%') "
		d = d & " and amaun_bayar is null "
		d = d & " and (no_resit = 'BATAL' or no_resit is null) "
		
		Set objRs2 = Server.CreateObject ("ADODB.Recordset")
		Set objRs2 = objConn.Execute(d)
		
		
	if objRs2.eof then		
		response.write "<script language=""javascript"">"
       response.write "var timeID = setTimeout('invalid_kompaun(""  "");',1) "
       response.write "</script>"
	else
	
	
	post = objRs2("post")
	
	if post = "M" then
		response.write "<script language=""javascript"">"
       response.write "var timeID = setTimeout('invalid_post(""  "");',1) "
       response.write "</script>"
	else
%><br>
 <table width="50%" cellpadding="1" cellspacing="5" class="hd">
        <tr> 
          <td class="hd">
Nama</td>
<td><%=objRs2("nama")%></td>
</tr>
  <%		kara = objRs2("perkara")
  			
  			p = " select initcap(keterangan) keterangan from kompaun.perkara where kod = '"& kara &"' "
			Set objRsp = objConn.Execute(p)
			
			if not objRsp.eof then
				terang_kara = objRsp("keterangan")
			else
				terang_kara = ""
  			end if
  %>
<tr> 
<td class="hd">Akta / UUK</td>
<td><%=objRs2("perkara")%>  --  <%=terang_kara%></td>
</tr>
   <%		rujuk2 = objRs2("no_rujukan2")
  			
  			q = " select initcap(keterangan) keterangan from kompaun.jenis_kesalahan "
  			q = q & " where kod = '"& rujuk2 &"' and perkara = '"& kara &"' "
			Set objRsq = objConn.Execute(q)
			
			if not objRsq.eof then
				terang_rujuk = objRsq("keterangan")
			else
				terang_rujuk = ""
  			end if
  %>

<tr> 
<td  class="hd">Butir Kesalahan</td>
<td><%=objRS2("no_rujukan2")%>  -- <%=terang_rujuk%></td>
</tr>
<tr> 
<td class="hd">Tarikh</td>
<td><%=objRs2("tkh_masuk")%></td>
</tr>
  <%	masa = objRS2("masa")
  	
  		if masa = 24 then
   			waktu = 12
   			ampm = "AM"
   		else
   			if masa >=  13 then
   				waktu = masa - 12
   				ampm = "PM"
   			
   			else
   				if masa < 13.00 or masa = 12 then
   				waktu = masa
   				ampm = "AM"	
   			end if
   			end if
   			end if
  
  %>
<tr> 
<td class="hd">Masa</td>
<td><%=FormatNumber(waktu,2)%>&nbsp; <%=ampm%></td>
</tr>
<tr> 
<td class="hd" rowspan="2">Tempat</td>
<td><%=objRs2("perkara1")%>&nbsp;</td>
</tr>
<tr> 
<td><%=objRs2("perkara2")%>&nbsp;</td>
</tr>
<%		tred = objRs2("tred")
  		t = " select initcap(keterangan) keterangan from lesen.tred where kod = '"& tred &"' "
  		Set objRst = Server.CreateObject ("ADODB.Recordset")
  		set objRst = objConn.Execute(t)
  		
  		if not objRst.eof then
  			terang = objRst("keterangan")
  		end if
%>
<tr> 
<td class="hd">Jenis Tred</td>
<td><%=objRs2("tred")%>&nbsp;--&nbsp;<%=terang%></td>
</tr>
<%	post = objRs2("post")  %>
<tr> 
<td  class="hd">Batal ( B / T )</td>
<td>&nbsp;Batal&nbsp; 
<input type="radio" name="fpost" value="B" <%if post="B" then%> checked <% end if %> 
onClick="B=1;document.myform.ftarikh_post.focus();"></font>
&nbsp; Tidak&nbsp;
<input type="radio" name="fpost" value="T" <%if post="T" or post ="" then%> checked <%end if%>
onClick="B=0;document.myform.ftarikh_post.value='';"></font>
</td>
</tr>
<tr> 
<td class="hd">Tarikh Batal</td>
<td> 
<input type="text" name="ftarikh_post" size="8" value="<%=objRs2("tkh_bayar")%>" maxlength="8"
onFocus="if(!B)this.blur();" onChange="if(!B)this.value='';">&nbsp;
<font face="Arial" size="1"><b> ( 'ddmmyyyy' )</b></font></td>
</tr>
<%		ac = objRs2("no_akaun")
		
		dd = " select siri, butir from kompaun.batal_catatan where no_akaun = '"&ac&"' "		
		Set objRs6 = objConn.Execute(dd)

		if objRs6.eof then
%>		
<tr> 
<td class="hd">Dibatal Oleh</font></b></td>
<td> 
  1. YDP <input type="radio" name="fbatal" value="1">&nbsp; 
  2. SU <input type="radio" name="fbatal" value="2">
  3. Pengarah <input type="radio" name="fbatal" value="3"></td>
</tr>
 <%   	elseif objRs6("siri") = "1" then			%>
		
<tr> 
<td class="hd">Dibatal Oleh</font></b></td>
<td> 
  1. YDP <input type="radio" checked name="fbatal" value="1">&nbsp; 
  2. SU <input type="radio" name="fbatal" value="2">
  3. Pengarah <input type="radio" name="fbatal" value="3">
</td>
</tr>
  <%		elseif objRs6("siri") = "2" then			%>
<tr> 
<td class="hd">Dibatal Oleh</font></b></td>
<td> 
  1. YDP <input type="radio" name="fbatal" value="1">&nbsp; 
  2. SU <input type="radio" checked name="fbatal" value="2">
  3. Pengarah <input type="radio" name="fbatal" value="3">
</td>
</tr>
  <%		elseif objRs6("siri") = "3" then			%>
<tr> 
<td class="hd">Dibatal Oleh</font></b></td>
<td> 
  1. YDP <input type="radio" name="fbatal" value="1">&nbsp; 
  2. SU <input type="radio" name="fbatal" value="2">
  3. Pengarah <input type="radio" checked name="fbatal" value="3"></td>
</tr>
	<%		end if			
			
			if not objRs6.eof then
				butir = objRs6("butir")
			else butir = ""
			end if
				
	%>		
<tr> 
<td class="hd">Catatan</td>
<td> 
<input type="text" name="fcatat" value="<%=butir%>" size="50" maxlength="50">
</td>
</tr>
<tr><td class="hd" colspan="2" align="center">
<input type="hidden" value="BATAL" name="fno_resit">
<input type="hidden" value="<%=objRs2("no_akaun")%>" name="frujuk">
<input type="submit" value="HANTAR" name="B2" class="button">&nbsp; <input type="submit" value="RESET" name="B3" class="button"></td>
</tr>
</table>

<%	end if
	end if
	end if
	end if
	end if
%>


</form>
</body>

</html>