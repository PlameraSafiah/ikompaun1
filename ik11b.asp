<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 12.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>i-Kompaun : Maklumat Kesalahan</title>
<SCRIPT LANGUAGE="JavaScript">
<!-- Begin
function win() {
features = 
    "toolbar=no, location=no, directori=no, status=no, menubar=no," +
    "scrollbars=yes, resizable=no, width=500, height=200, left=80, top=80"
    msg=window.open("akta.asp","msg",features) 
}
// End -->
</script>
<SCRIPT LANGUAGE="JavaScript">
<!-- Begin
function win2() {
msg=window.close("ik11b.asp","msg","height=200,width=500,left=80,top=80")
}
// End -->
</script>
<SCRIPT LANGUAGE="JavaScript">
<!-- Begin
function win3() {
msg=window.open("salah.asp","msg","height=200,width=500,left=80,top=80")
}
// End -->
</script>

<SCRIPT LANGUAGE="JavaScript">
function check(z){

if (z.fno_akaun.value==""){
alert("Sila Masukkan No Akaun !!!");
z.fno_akaun.focus();
return false;}

if(z.fakt.value==""){
alert("Sila Masukkan Akta/UUK !!!");
z.fakt.focus();
return false}

}
</script>

<SCRIPT LANGUAGE="JavaScript">
<!-- Begin
nextfield = "fno_akaun";
netscape="";
ver=navigator.appVersion; len=ver.length;
for(iln=0;iln<len;iln++)if(ver.charAt(iln)=="(")break;
netscape=(ver.charAt(iln+1).toUpperCase()!="C");

function keyDown(DnEvents){
k=(netscape)?DnEvents.which:window.event.keyCode;
if(k==13){
if(nextfield=='done')return true;
else{
eval('document.myForm2.'+nextfield+'.focus()');
return false;
		}
	}
}
document.onkeydown=keyDown;
if(netscape)document.captureEvents(Event.KEYDOWN|Event.KEYUP);
//End -->
</script>

<script language="javascript">
function invalid_nkompaun(a)
    {  
       alert (a+" Kompaun Telah Dijelaskan !!! ");
		return(true);
    }
function invalid_tarikh(b)
	{
		alert (b+" Tarikh Salah !!! ");
		return(true);
	}
</script>
</head>

<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" bgcolor="#FFCCCC">

<form name="myForm2" method="POST" action="ik11b.asp">

<%	Set objConn = Server.CreateObject("ADODB.Connection")
	objConn.Open "dsn=12c;uid=majlis;pwd=majlis;"
	
	
	set objComm = Server.CreateObject("ADODB.Command")
	set objComm.ActiveConnection = objConn
	objComm.Parameters.Refresh

	
	nakaun = Request.cookies("fac")
	proses1 = Request.form("B2")
	proses2 = Request.form("B3")
	b1edit = Request.form("b1EDIT")
	b1delete = Request.form("b1DELETE")

	if b1edit = "EDIT" then
		b1 = "EDIT"
	end if
	
	
	
	if b1delete = "DELETE" then
		b1 = "DELETE"
	end if
	
	
	
'**************************************** LIST AKTA ****************************************************   
   
   
   if proses1 = "List" then
      	Response.cookies("fac") = Request.form("fno_akaun")
      	Response.cookies("kmenu") = "ik11b.asp"
      	Response.cookies("fakt") = ""
   		
   		response.write "<script language=""javascript"">"
   		response.write "var timeID = setTimeout('win("" "");',1)"
     	response.write "</script>"
     	response.end
   	end if
   		
   
'***************************************** LIST BUTIR KESALAHAN *****************************************
		
   		
   if proses2 = "List" then
      	Response.cookies("kmenu") = "ik11b.asp"
      	Response.cookies("fakt") = Request.form("fakt")    	
   		
   		response.write "<script language=""javascript"">"
   		response.write "var timeID = setTimeout('win3("" "");',1)"
     	response.write "</script>"
     	response.end
   	end if
   		
   

	
'************************************************************************************************************



	if b1 = "EDIT" then
		dno_akaun = Request.form("fno_akaun")
		dperkara4 = ucase(Request.form("fperkara4"))
		dperkara5 = ucase(Request.form("fperkara5"))
		dnama = ucase(Request.form("fnama"))
		dname=Replace(dnama,"'","''")
		dalamat1 = ucase(Request.form("falamat1"))
		dadd1=Replace(dalamat1,"'","''")
		dalamat2 = ucase(Request.form("falamat2"))
		dadd2=Replace(dalamat2,"'","''")
		dalamat3 = ucase(Request.form("falamat3"))
		dadd3=Replace(dalamat3,"'","''")
		dkp = ucase(Request.form("fkp"))
		dtkh_lahir = Request.form("ftkh_lahir")
		dperkara = ucase(Request.form("fakt"))
		dno_rujukan2 = Request.form("frujukan2")
		dtkh_masuk = Request.form("ftkh_masuk")
		dmasa = Request.form("fmasa")
		dperkara1 = ucase(Request.form("fperkara1"))
		dpkara1=Replace(dperkara1,"'","''")
		dperkara2 = ucase(Request.form("fperkara2"))
		dpkara2=Replace(dperkara2,"'","''")
		dtred = Request.form("ftred")
		djenis = Request.form("fjenis")
		dno_pekerja = Request.form("fno_pekerja")
		ampm = Request.form("ampm")	
  		dakaun = mid(dno_rujuk,1,5)

		y = " select kategori, jabatan from hasil.akaun where kod = substr('"&dno_akaun&"','1','5') "
	  	Set objRs1y = Server.CreateObject("ADODB.Recordset")
	  	Set objRs1y = objConn.Execute(y)
  		
  		
  		if not objRs1y.eof then
  			kat = objRs1y("kategori")
  			jab = objRs1y("jabatan")
  		else
  			kat = ""
  			jab = ""
  		end if	



		if ampm = "PM" then
			if dmasa <= 12 then
				masa1 = 12 + dmasa	
			else
				masa1 = dmasa
			end if	
		else
			if dmasa >= 12.01 and dmasa <=12.59 then
				masa1 = dmasa - 12		
			elseif dmasa < 12 then
				masa1 = dmasa
			else
				masa1 = dmasa
				ampm = "PM"
			end if
		end if	



		y = " select to_date(to_char(sysdate,'ddmmyyyy'),'ddmmyyyy') tkhs, "
		y = y & " to_date('"&dtkh_lahir&"','ddmmyyyy') tkh2s, "
		y = y & " to_date('"&dtkh_masuk&"','ddmmyyyy') tkh3s from dual "
		Set objRsy = Server.CreateObject ("ADODB.Recordset")
    	Set objRsy = objConn.Execute(y)
		
		if objRsy.eof then
				response.write "<script language=""javascript"">"
       		response.write "var timeID = setTimeout('invalid_tarikh(""  "");',1) "
       		response.write "</script>"
		else	
		
		tkhs = objRsy("tkhs")
		tkh2s = objRsy("tkh2s")
		tkh3s = objRsy("tkh3s")

		
		if tkh2s > tkhs then
				response.write "<script language=""javascript"">"
       		response.write "var timeID = setTimeout('invalid_tarikh(""  "");',1) "
       		response.write "</script>"
		else	


		if tkh3s > tkhs then
				response.write "<script language=""javascript"">"
       		response.write "var timeID = setTimeout('invalid_tarikh(""  "");',1) "
       		response.write "</script>"
		else	


		r = " update hasil.bil set perkara4 = '"& dperkara4 &"', "
		r = r & " perkara5 = '"& dperkara5 &"', nama = '"& dname &"', alamat1 = '"& dadd1 &"',"
		r = r & " alamat2 = '"& dadd2 &"',  alamat3 = '"& dadd3 &"', "
		r = r & " kp = '"& dkp &"', tkh_lahir = to_date('"& dtkh_lahir &"','ddmmyyyy'), "
		r = r & " perkara = '"& dperkara &"', no_rujukan2 = '"& dno_rujukan2 &"', "
		r = r & " tkh_masuk = to_date('"& dtkh_masuk &"', 'ddmmyyyy'), "
		r = r & " masa = '"& masa1 &"', perkara1 = '"& dpkara1 &"', perkara2 = '"& dpkara2 &"', "
		r = r & " tred = '"& dtred &"', jenis = '"& djenis &"', no_pekerja = '"& dno_pekerja &"', "
		r = r & " jabatan = '"&jab&"', kategori = '"&kat&"', akaun = '"&dakaun&"' "
		r = r & " where no_akaun = '"& dno_akaun &"' "
		r = r & " and perkara <> 'P01' "
		
		Set objRs3 = Server.CreateObject ("ADODB.Recordset")
    	Set objRs3 = objConn.Execute(r)


	end if
	end if
	end if
	end if
	
	

  '*************************************	PROSES DELETE	  **************************************************
  
  
  
   	if b1 = "DELETE" then
 		
		dno_akaun = Request.form("fno_akaun")
 		
 		dd = " select amaun_bayar from hasil.bil where no_akaun = '"&dno_akaun&"' "
 		dd = dd & " and amaun_bayar > 0 "
 		Set objRs5 = Server.CreateObject ("ADODB.Recordset")
    	Set objRs5 = objConn.Execute(dd)

 		if not objRs5.eof then
 			response.write "<script language=""javascript"">"
       	response.write "var timeID = setTimeout('invalid_nkompaun(""  "");',1) "
       	response.write "</script>"
       	proses = "DELETE"   	
		else
 			m = " delete hasil.bil where no_akaun = '"&dno_akaun&"' "
 			Set objRs5m = Server.CreateObject ("ADODB.Recordset")
    		Set objRs5m = objConn.Execute(m)
		
			buang	
 		end if	
 			response.write "<script language=""javascript"">"
   			response.write "var timeID = setTimeout('win2("" "");',1)"
   			response.write "</script>"
   			response.end
	end if
 


'************************************************************************************************************



	
	s = " select rowid, no_rujukan, perkara4, perkara5, nama, alamat1, alamat2, alamat3, kp, "
	s = s & "  to_char(tkh_lahir,'ddmmyyyy') tkh_lahir,perkara, no_rujukan2, to_char(tkh_masuk,'ddmmyyyy') tkh_masuk,   "
	s = s & " to_char(masa) masa, perkara1, perkara2, tred, jenis, no_pekerja "
	s = s & " from hasil.bil "
	s = s & " where no_akaun = '"& nakaun &"' "
	s = s & " and (perkara <> 'P01' or perkara is null) "
		
	Set objRs4 = Server.CreateObject ("ADODB.Recordset")
   	Set objRs4 = objConn.Execute(s)

    if not objRs4.eof then   	
	    	rujuk = objRs4("no_rujukan")
	    	nopek = objRs4("no_pekerja")
	    	waktu = objRs4("masa")
	    	perk = objRs4("perkara")
	    	xtred = objRs4("tred")	
	    	vakt = Request.form("aktas")
	    	rowid = objRs4("rowid")
    	
	    	dperkara4 = objRs4("perkara4")
	    	dperkara5 = objRs4("perkara5")
	    	dnama = objRs4("nama")
	    	dalamat1 = objRs4("alamat1")
	    	dalamat2 = objRs4("alamat2")
	    	dalamat3 = objRs4("alamat3")
	    	dkp = objRs4("kp")
	    	dtkh_lahir = objRs4("tkh_lahir")
	    	dtkh_masuk = objRs4("tkh_masuk")
	    	dmasa = objRs4("masa")
	    	waktu = objRs4("masa")
	    	dperkara1 = objRs4("perkara1")
   		 	dperkara2 = objRs4("perkara2")
   	 		djenis = objRs4("jenis")
    		dno_pekerja = objRs4("no_pekerja")
   end if

			fakts = Request.cookies("fakt")
			fjeniss = Request.cookies("fjenis")
			pilihakta = Request.cookies("pilihakta")
			pilihsalah = Request.cookies("pilihsalah")

			
			if not objRs4.eof and pilihakta = "" then
				fakt = objRs4("perkara")
				fjenis = objRs4("no_rujukan2")
			elseif pilihakta = "akta" and pilihsalah= "" then
				Response.cookies("pilihakta") = ""		
				fakt = fakts
				fjenis = ""
			elseif pilihsalah = "salah" then
				Response.cookies("pilihakta") = ""					
				Response.cookies("pilihsalah") = ""
				fakt = fakts
				fjenis = fjeniss
			end if	 		
	form
	
	
'************************************** SUB BUANG **********************************************************  
	
	
	sub buang
		Response.cookies("fac") = ""
		Response.cookies("fakt") = ""
		Response.cookies("fjenis") = ""
		Response.cookies("kmenu") = ""
	end sub


'**************************************** SUB FORM ******************************************************	
	
	sub form
			
%>

<table width="100%" height="8">
<tr><td width="100%" height="8"></td></tr>
</table>

<table border=1 borderColor=black cellPadding=1 cellSpacing=0 rules=all align="center"
style="border-collapse: collapse; border: 1px solid black" width="603">
<tr> 
<td width="137" bgcolor="#9D2024" ><b> <font face="Verdana" size="2" color="#FFFFFF">No Kompaun</font></b></td>
<td bgcolor="lightgrey" colspan="3" >
<input type="text" name="fno_akaun" size="12" value="<%=nakaun%>" maxlength="11" onFocus="nextfield='fakt';"></td>
</tr>

 <%	  			
  		kk = "select initcap(keterangan) keterangan from kompaun.perkara where kod = '"&fakt&"' "
  		Set objRskk = Server.CreateObject ("ADODB.Recordset")
  		Set objRskk = objConn.Execute(kk)
  		
  		if not objRskk.eof then
	  		fketer2 = objRskk("keterangan")
  		else fketer2 = ""
  		end if	
  %>
<tr> 
<td width="137" align="left" bgcolor="#9D2024" ><b><font face="Verdana" size="2" color="#FFFFFF">Akta / UUK</font> </b></td>
<td align="left" bgcolor="lightgrey" colspan="3" > 
<input type="text" name="fakt" size="7" value="<%=fakt%>" maxlength="3" onFocus="nextfield='frujukan2';">&nbsp;
<input type="submit" value="List" name="B2">&nbsp;
<font color="#000000" size="1" face="Arial"><b><%=fketer2%></b></font>
<input type="hidden" name="aktz" size="5" value="<%=fakt%>" ></td>
</tr>
  
   <%	kkk = " select initcap(keterangan) keterangan from kompaun.jenis_kesalahan where kod = '"&fjenis&"' "
   		kkk = kkk & " and perkara = '"&fakt&"' "
  		Set objRskkk = Server.CreateObject ("ADODB.Recordset")
  		Set objRskkk = objConn.Execute(kkk)
  		
  		if not objRskkk.eof then
  			fterang2 = objRskkk("keterangan")
  		else fterang2 = ""
  		end if	
  %>
  <tr> 
  <td width="137" align="left" bgcolor="#9D2024"><b><font face="Verdana" size="2" color="#FFFFFF">Butir Kesalahan</font></b></td>
  <td align="left" bgcolor="lightgrey" colspan="3" >
  <input type="text" name="frujukan2" size="7" value="<%=fjenis%>" maxlength="10" onFocus="nextfield='fperkara4';">&nbsp;
  <input type="submit" value="List" name="B3">&nbsp;
  <font color="#000000" size="1" face="Arial"><b><%=fterang2%></b></font>
  <input type="hidden" name="rujukz" size="5" value="<%=fjenis%>" ></td>
  </tr>
 <tr> 
  <td width="137" align="left" bgcolor="#9D2024"><b><font face="Verdana" size="2" color="#FFFFFF">No Fail</font></b></td>
  <td width="129" align="left" bgcolor="lightgrey">
  <input type="text" name="fperkara4" size="13" value="<%=dperkara4%>" maxlength="40" onFocus="nextfield='fperkara5';"></td>
  <td width="121" align="left" bgcolor="#9D2024" ><b><font size="2" face="Verdana" color="#FFFFFF">No Sykt / Daftar</font></b></td>
  <td align="left" bgcolor="#D3D3D3" style="width: 236px" >
  <input type="text" name="fperkara5" size="13" value="<%=dperkara5%>" maxlength="40" onFocus="nextfield='fnama';"></td>
  </tr>
  <tr> 
  <td width="137" align="left" bgcolor="#9D2024" ><b><font face="Verdana" size="2" color="#FFFFFF">Nama</font></b></td>
  <td align="left" bgcolor="lightgrey" colspan="3" >
  <input type="text" name="fnama" size="50" value="<%=dnama%>" maxlength="40" onFocus="nextfield='falamat1';"></td>
  </tr>
  <tr> 
  <td width="137" align="left" bgcolor="#9D2024" ><b><font face="Verdana" size="2" color="#FFFFFF">Alamat</font></b></td>
  <td align="left" bgcolor="lightgrey" colspan="3" >
  <input type="text" name="falamat1" size="40" value="<%=dalamat1%>" maxlength="40" onFocus="nextfield='falamat2';"></td>
  </tr>
  <tr> 
  <td width="137" align="left" bgcolor="#9D2024">&nbsp;</td>
  <td align="left" bgcolor="lightgrey" colspan="3"> 
  <input type="text" name="falamat2" size="40" value="<%=dalamat2%>" maxlength="40" onFocus="nextfield='falamat3';">
  <font size="1" color="#FF00FF">*</font></td>
  </tr> 
  <tr> 
  <td width="137" align="left" bgcolor="#9D2024">&nbsp;</td>
  <td align="left" bgcolor="lightgrey" colspan="3">
  <input type="text" name="falamat3" size="40" value="<%=dalamat3%>" maxlength="40" onFocus="nextfield='fkp';">
  <font size="1" color="#FF00FF">*</font></td>
  </tr>
   <%	'dkp = Request.form("fkp")	
  		 	
		'if Len(dkp) = 12 then
			'dkp1 = mid (dkp,1,6)
			'dkp2 = mid (dkp,7,2)
			'dkp3 = mid (dkp,9,4)
			'dkp = dkp1 + "-" + dkp2 + "-" + dkp3	
		'end if  
  %> 
  <tr> 
  <td width="137" align="left" bgcolor="#9D2024"><b><font face="Verdana" size="2" color="#FFFFFF">No K/P</font></b></td>
  <td align="left" bgcolor="lightgrey" colspan="3">
  <input type="text" name="fkp" size="14" value="<%=dkp%>" maxlength="14" onFocus="nextfield='ftkh_lahir';" ></td>
  </tr> 
   <%	'dkp = Request.form("fkp")
  	  			
  		'if Len(dkp) >= 12 then
  				't = " select to_char(to_date('19'||substr('"&dkp&"', 1, 6),'yyyymmdd'),'ddmmyyyy') as dtkh_lahir "
  				't = t & " from dual "	
  				'Set objRst = Server.CreateObject ("ADODB.Recordset")
    			'Set objRst = objConn.Execute(t)
    			'dtkh_lahir = objRst("dtkh_lahir")
		'end if	
  %>
  <tr> 
  <td width="137" align="left" bgcolor="#9D2024"><b><font face="Verdana" size="2" color="#FFFFFF">Tarikh Lahir</font></b></td>
  <td align="left" bgcolor="lightgrey" colspan="3">
  <input type="text" name="ftkh_lahir" size="10" value="<%=dtkh_lahir%>" maxlength="8" onFocus="nextfield='ftkh_masuk';">
  <b><font face="Arial" size="1" color="#FF00FF">*</font></b></td>
  </tr> 
  <%		
  			if waktu <> "" then
   				if waktu = 24 then
   					waktu1 = 12
   					ampm = "AM"
   				elseif waktu >=  13 then
   					waktu1 = waktu - 12
   					ampm = "PM"
   			
   				elseif waktu < 13.00 or waktu = 12 then
   					waktu1 = waktu
   					ampm = "AM"	
   				end if
   			end if	
   			
  		if waktu = "" then
%> 
  <tr> 
  <td width="137" align="left" bgcolor="#9D2024" ><b><font face="Verdana" size="2" color="#FFFFFF">Tarikh</font></b></td>
  <td width="129" align="left" bgcolor="lightgrey">
  <input type="text" name="ftkh_masuk" size="10" value="<%=dtkh_masuk%>" maxlength="8" onFocus="nextfield='fmasa';"></td>
  <td width="121" align="left" bgcolor="#9D2024" ><b><font size="2" face="Verdana" color="#FFFFFF">Waktu</font></b></td>
  <td align="left" bgcolor="#D3D3D3" style="width: 236px" >
  <input type="text" name="fmasa" size="5" maxlength="5" onFocus="nextfield='fperkara1';">&nbsp; 
  <font size="1" face="Arial"><b>AM</b></font><input type="radio" value="AM" name="ampm">&nbsp;
  <font face="Arial" size="1"><b>PM</b></font><input type="radio" value="PM" name="ampm"></td>
  </tr> 
   <%		else 
   			if waktu >= 12 and waktu <> 24 then	  			
   	%>
    <tr> 
  <td width="137" align="left" bgcolor="#9D2024" ><b><font face="Verdana" size="2" color="#FFFFFF">Tarikh</font></b></td>
  <td width="129" align="left" bgcolor="lightgrey" >
  <input type="text" name="ftkh_masuk" size="10" value="<%=dtkh_masuk%>" maxlength="8" onFocus="nextfield='fmasa';"></td>
  <td width="121" align="left" bgcolor="#9D2024">
  <b><font size="2" face="Verdana" color="#FFFFFF">Waktu</font></b></td>
  <td align="left" bgcolor="#D3D3D3" style="width: 236px">
  <b><font face="Arial" size="1"> 
   <input type="text" name="fmasa" value="<%=FormatNumber(waktu1,2)%>" size="5" maxlength="5" onFocus="nextfield='fperkara1';">&nbsp;
   AM<input type="radio" value="AM" name="ampm">&nbsp; 
	PM <input type="radio" checked value="PM" name="ampm"></font></b></td>
  </tr> 
	<%		else 
			if waktu < 12 or waktu = 24 then	%>
  <tr> 
  <td width="137" align="left" bgcolor="#9D2024"><b><font face="Verdana" size="2" color="#FFFFFF">Tarikh</font></b></td>
  <td width="129" align="left" bgcolor="lightgrey" >
  <input type="text" name="ftkh_masuk" size="10" value="<%=dtkh_masuk%>" maxlength="8" onFocus="nextfield='fmasa';"></td>
  <td width="121" align="left" bgcolor="#9D2024"><b><font size="2" face="Verdana" color="#FFFFFF">Waktu</font></b></td>
  <td align="left" bgcolor="#D3D3D3" style="width: 236px">
  <b><font face="Arial" size="1"> 
   <input type="text" name="fmasa" value="<%=FormatNumber(waktu1,2)%>" size="5" maxlength="5" onFocus="nextfield='fperkara1';">&nbsp;
    AM <input type="radio" checked value="AM" name="ampm">&nbsp; 
	PM <input type="radio" value="PM" name="ampm"></font></b></td>
  </tr> 
   <%		end if
   			end if
   			end if
   	%>
  <tr> 
  <td width="137" align="left" bgcolor="#9D2024"><b><font face="Verdana" size="2" color="#FFFFFF">Tempat</font></b></td>
  <td align="left" bgcolor="lightgrey" colspan="3" >
 
  <textarea rows="4" cols="50"  name="fperkara1" onFocus="nextfield='fperkara2';">
	<%=dperkara1%>
	</textarea>
  <font size="1" color="#FF00FF">*</font></td>
  </tr>
  <tr> 
  <td width="137" align="left" bgcolor="#9D2024" >&nbsp;</td>
  <td align="left" bgcolor="lightgrey" colspan="3" >
   <input type="text" name="fperkara2" size="66" value="<%=dperkara2%>" maxlength="66" onFocus="nextfield='ftred';">
  <font size="1" color="#FF00FF">*</font></td>
  </tr> 
  <tr> 
  <td width="137" align="left" bgcolor="#9D2024" ><b><font face="Verdana" size="2" color="#FFFFFF">Jenis Tred</font></b></td>
  <td align="left" bgcolor="lightgrey" colspan="3" >
  <%	g = " select kod, initcap(keterangan) as terang "
	 	g = g & " from lesen.tred "
	 	g = g & " order by kod "
	 	
	 	Set objRsg = Server.CreateObject ("ADODB.Recordset")
    	Set objRsg = objConn.Execute(g)
    	
  %> 
  <select size="1" name="ftred" onFocus="nextfield='fno_pekerja';">
  <%	if xtred <>"" then
  		
  		gg = " select kod, initcap(keterangan) as terang from lesen.tred where kod = '"& xtred &"' order by kod "
    	Set objRsgg = objConn.Execute(gg)
    	
    	Do while not objRsgg.eof 

  %>
  <option value="<%=objRsgg("kod")%>" selected><%=objRsgg("kod")%> - <%=objRsgg("terang")%></option>
  <%	objRsgg.MoveNext
     	loop
		else    			%>
 <option value=""> Sila Pilih Jenis Tred </option>
 	
  <%	end if			%>

  <%	do while not objRsg.EOF 		%> 
  
  <option value="<%=objRsg("kod")%>"><%=objRsg("kod")%> - <%=objRsg("terang")%></option>
  <%
     	objRsg.MoveNext
     	loop
  %>  
  </select></td>
  </tr> 
  <tr> 
  <td width="137" align="left" bgcolor="#9D2024" ><b><font face="Verdana" size="2" color="#FFFFFF">Jenis Kompaun</font></b></td>
  <td align="left" bgcolor="lightgrey" colspan="3" >
  <select name="fjenis" onFocus="nextfield='fno_pekerja';">
  <%	
  		if 	djenis <> "" then
  			ss = " select decode('"&djenis&"','1','Individu','2','Perniagaan','3','Industri',null) jtrg from dual " 
  			Set objRsqs = objConn.Execute(ss)			
  %>
  <option value="<%=djenis%>" selected><%=djenis%> - <%=objRsqs("jtrg")%></option>
  <%	else	%>
   <option value=""> Sila Pilih Jenis Kompaun </option>
  <%	end if		%>
  <option value="1">1 - Individu</option>
  <option value="2">2 - Perniagaan</option>
  <option value="3">3 - Industri</option>
  </select></td>
  </tr> 

  <tr> 
  <td width="137" align="left" bgcolor="#9D2024" ><b><font face="Verdana" size="2" color="#FFFFFF">Pengeluar Notis</font></b></td>
   <%	n = " select nama from payroll.paymas where no_pekerja = '"& nopek &"' and lokasi = 101 "
  		n = n & " union "
  		n = n & " select nama from payroll.paymas_sambilan where no_pekerja = '"& nopek &"' and lokasi = 101 "
   		Set objRsn = Server.CreateObject ("ADODB.Recordset")
   		Set objRsn = objConn.Execute(n)
    		
   		if not objRsn.eof then
    			napek = objRsn("nama")
   		else
    			napek = ""
   		end if		
  %>
  <td width="254" align="left" bgcolor="lightgrey" colspan="2" >
  <input type="text" name="fno_pekerja" size="7" value="<%=dno_pekerja%>" maxlength="5" onFocus="nextfield='b1edit';">
  -&nbsp; <font color="#000000" size="1" face="Arial"><%=napek%></font></td>
  <td align="left" bgcolor="lightgrey" style="width: 236px" >
  <input type="submit" value="EDIT" name=b1edit onFocus="nextfield='done';"><input type="submit" onClick="return confirm('Hapus Data ?')" value="DELETE" name=b1delete></td>
  </tr> 
 </table>
 
<%	end sub		%>

</form>
</body>

</html>