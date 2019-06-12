<%response.cookies("ikmenu") = "ik11a.asp"%>
<!--'#INCLUDE FILE="ik.asp" -->
<!--#include file="adovbs.inc"-->
<%Response.Buffer = True%>
<html>
<head>
<title>i-Kompaun : Maklumat Kesalahan</title>
<META content="text/html; charset=iso-8859-1" http-equiv=Content-Type>
<meta http-equiv="Refresh" content="300" />
<link type="text/css" href="menu.css" REL="stylesheet">
</head>

<SCRIPT LANGUAGE="JavaScript">
<!-- Begin
nextfield = "fnoakaun";
netscape = "";
ver = navigator.appVersion; len = ver.length;
for(iln = 0; iln < len; iln++) if (ver.charAt(iln)=="(")break;
netscape = (ver.charAt(iln+1).toUpperCase()!="C");

function keyDown(DnEvents){
k = (netscape)?DnEvents.which : window.event.keyCode;
if(k==13){//enter key pressed
if (nextfield=='done') return true; //submit
else{//send focus to next box
eval('document.myForm.'+nextfield + '.focus()');

return false;
	}
  }
 }
document.onkeydown = keyDown;// work together to analyze keystrokes
if (netscape)document.captureEvents(Event.KEYDOWN|Event.KEYUP);

//End-->
</script>
<script language="javascript">
	function papar1(form)
		 {var item = form.drop1.selectedIndex; choice = form.drop1.options[item].value; if (choice!="x") 
		top.location.href=""+(choice); };

	function papar2(form)
		{var item = form.drop2.selectedIndex; choice = form.drop2.options[item].value; if (choice!="x")
		top.location.href=""+(choice); };

	function papar3(form)
		{var item = form.drop3.selectedIndex; choice = form.drop3.options[item].value; if (choice!="x")
		top.location.href=""+(choice); };

	function papar4(form)
		{var item = form.drop4.selectedIndex; choice = form.drop4.options[item].value; if (choice!="x")
		top.location.href=""+(choice); };

	function papar5(form)
		 {var item = form.famaun.selectedIndex; choice = form.famaun.options[item].value; if (choice!="x") 
		top.location.href=""+(choice); };

	function papar6(form)
		{var item = form.drop6.selectedIndex; choice = form.drop6.options[item].value; if (choice!="x")
		top.location.href=""+(choice); };
		
	function papar7(form)
		{var item = form.drop7.selectedIndex; choice = form.drop7.options[item].value; if (choice!="x")
		top.location.href=""+(choice); };
</script>


<script language="javascript">

function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : evt.keyCode;
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;    
         return true;
      }



</script>
<script language="javascript">
function win() 
	{features = 
    "toolbar=no, location=no, directori=no, status=no, menubar=no," +
    "scrollbars=no, resizable=no, width=630, height=450, left=80, top=80"
    msg=window.open("ik11b.asp","msg",features) 
	}
function invalid_rujuk(a)
    {  
       alert (a+" No Kompaun Salah!!! ");
		return(true);
    }
function invalid_nkompaun(b)
    {  
       alert (b+" Kompaun Telah Dijelaskan !!! ");
		//return(true);
		return true;
		
    }
function invalid_nupdate(b)
    {  
       alert (b+" Data Di Simpan !!! ");
	
		return true;
		
    }
function invalid_nsave(b)
    {  
       alert (b+" Data Di Kemaskini !!! ");
	
		return true;
		
    }

</script>
  

<BODY leftMargin=0 topMargin=0 bgcolor="<%=color4%>" onLoad="refresh">


<form name="ik11a" method="POST" action="ik11a.asp" onSubmit="return check(this)"  >


<%	
'	Set objConn = Server.CreateObject("ADODB.Connection")
'   objConn.Open "dsn=12c;uid=majlis;pwd=majlis;"   
   
	ikmenu = request.cookies("ikmenu")	
	'response.cookies("ikmenu") = "ik11.asp"
	
    gnop = 	request.cookies("gnop")
	''response.Write(gnop)

	h = " select lpad('"&gnop&"',5,0)gnop from dual "
    set sh = objconn.execute(h)
	gnop = sh("gnop")
	
	proses = Request.form("B1")
	''response.Write(proses)
	proses1 = Request.Form("B2")
	proses2 = Request.Form("B3")
	proses4 = request.form("B4")
	noakaun = session("noakaun1")	
    dakaun = mid(noakaun,1,5)

	perkara4 = ucase(Request.Form("fperkara4"))
	perkara5 = ucase(Request.Form("fperkara5"))
	nama = ucase(Request.Form("fnama"))
	alamat1 = ucase(Request.Form("falamat1"))
	alamat2 = ucase(Request.Form("falamat2"))
	alamat3 = ucase(Request.Form("falamat3"))
	kp = Request.Form("fkp")
	tkh_lahir = Request.Form("ftkh_lahir")
	akta = request.form("fakta")
	salah = request.form("fsalah")
	tkh_masuk = Request.Form("ftkh_masuk")
	masa = Request.Form("fmasa")
	perkara1 = ucase(Request.Form("fperkara1"))
	perkara2 = ucase(Request.Form("fperkara2"))
	tred = Request.Form("ftred")
	jenis = Request.Form("fjenis")
	no_pekerja = Request.Form("fno_pekerja")
	
	amaun = Request.Form("famaun")

	daerah = request.Form("fdaerah")
	parlimen = request.form("fparlimen")
	dun = request.form("fdun")
	ternakan1 = request.form("fternakan")
	
	waktu = Request.Form("fmasa")
	ampm = Request.form("fampm")
	amaun = Request.Form("famaun")
	aa=	Request.Form("rowid")
	
	
		
	if nama <> "" then nama=replace(nama,"'","''")
	if alamat1 <> "" then alamat1=replace(alamat1,"'","''")
	if alamat2 <> "" then alamat2=replace(alamat2,"'","''")
	if alamat3 <> "" then alamat3=replace(alamat3,"'","''")
	if perkara1 <> "" then perkara1=replace(perkara1,"'","''")
	if perkara2 <> "" then perkara2=replace(perkara2,"'","''")
	
	if proses = "" then
	'
	''if proses = "Hantar" then
     
		my = " select 'x' from hasil.bil "
		my = my & " where kategori = '45' and PERKARA <> 'P01' and tkh_bayar is not null "
		my = my & " and no_akaun = '"& noakaun &"' "
		Set Rsmy = objConn.Execute(my)
        
        if not Rsmy.eof then
           ''mula
           papar
           response.write "<script language=""javascript"">"
           response.write "var timeID = setTimeout('invalid_nkompaun(""  "");',1) "
           response.write "</script>"
           response.end
        else
           ''mula
          ' papar
        end if
	''end if
	
		add = request.cookies("fasp")
		add2 = request.cookies("fasp2")
		if add = "akta.asp" then
			noakaun = request.cookies("fac")
			akta = request.cookies("fakta")
			proses = "Hantar"
		elseif add2 = "salah.asp" then
			noakaun = request.cookies("fac")
			akta = request.cookies("fakta")
			salah = request.cookies("fjenis")
			proses = "Hantar"
		else
		papar
		
		end if
	end if
	
	
	
	
	
	if proses = "Cetak Salinan" then
	response.cookies("dac") = Request.Form("rowid")
	
		If InStr(1, Request.ServerVariables("HTTP_USER_AGENT"), "MSIE") then
			response.redirect"ik11c.asp"
		else
			response.redirect"ik11c_firefox.asp"
		end if
	end if
	
	
	if proses = "Hantar" then
     
		my = " select 'x' from hasil.bil "
		my = my & " where tkh_bayar is not null "
		my = my & " and no_akaun = '"& noakaun &"' "
		Set Rsmy = objConn.Execute(my)
        
        if not Rsmy.eof then
           papar
           response.write "<script language=""javascript"">"
           response.write "var timeID = setTimeout('invalid_ nkompaun(""  "");',1) "
           response.write "</script>"
           response.end
        else
           papar
        end if
	end if
	
	if proses = "Semula" then

                noakaun=""
                 fnoakaun  =""
                response.cookies("dac").expires = date-100
		Response.cookies("fac").expires = date-100
		response.cookies("fasp").expires = date-100
		response.cookies("fasp2").expires = date-100
	end if
   
'**************************************** LIST AKTA ****************************************************    
   
   if proses1 = "List" then
      	Response.cookies("fac") = noakaun
      	Response.cookies("kmenu") = "ik11.asp"
   		response.redirect "akta.asp"
   	end if   		
   
'***************************************** LIST BUTIR KESALAHAN *****************************************		
   		
   if proses2 = "List" then
       Response.cookies("fakta") = request.form("fakta")
       Response.cookies("kmenu") = "ik11.asp"
   	 response.redirect "salah.asp"
   	end if    
	
 '******************************************** PROSES SAVE	 *************************************************
	
	if proses = "Simpan" then      
 		
  		if noakaun = "" then
			response.write "<script language=""javascript"">"
   			response.write "var timeID = setTimeout('invalid_ac(""  "");',1) "
       		response.write "</script>"
			papar
       elseif len(noakaun) <> "11" then
			response.write "<script language=""javascript"">"
   			response.write "var timeID = setTimeout('invalid_digit(""  "");',1) "
       		response.write "</script>"
			papar
		elseif nama = "" then
			response.write "<script language=""javascript"">"
   			response.write "var timeID = setTimeout('invalid_nama(""  "");',1) "
       		response.write "</script>"
			papar
		elseif alamat1 = "" then
			response.write "<script language=""javascript"">"
   			response.write "var timeID = setTimeout('invalid_add(""  "");',1) "
       	response.write "</script>"
			papar
		elseif tkh_masuk = "" then
			response.write "<script language=""javascript"">"
   			response.write "var timeID = setTimeout('invalid_tkhmasuk(""  "");',1) "
       		response.write "</script>"
			papar
		elseif waktu = "" then
			response.write "<script language=""javascript"">"
   			response.write "var timeID = setTimeout('invalid_time(""  "");',1) "
       		response.write "</script>"
			papar
		'else
			''response.write "nothing"
		end if
 	   	
	  	y = " select kategori, jabatan from hasil.akaun where kod = '"& dakaun &"' "
	  	Set objRs1y = objConn.Execute(y) 		
  		
  		if not objRs1y.eof then
  			kat = objRs1y("kategori")
  			jab = objRs1y("jabatan")
  		else
  			kat = ""
  			jab = ""
  		end if	
		
		df = " select jabatan from majlis.pengguna where no_pekerja ='"&gnop&"' "
		set rdf = objconn.execute(df)
		
		if not rdf.eof then
				kjab = rdf("jabatan")
		end if
				
		if kjab = "103" or kjab = "112" then 	jab = kjab
 		
  		pp = " select kod from kompaun.perkara where kod = '"& akta &"' "
		Set objRspp = objConn.Execute(pp)
		
		''response.Write(jab)
  		pp = " select kod from kompaun.perkara where kod = '"& akta &"' "
		Set objRspp = objConn.Execute(pp)
		
		
		if objRspp.eof then
				response.write "<script language=""javascript"">"
				response.write "var timeID = setTimeout('invalid_akta(""  "");',1) "
				response.write "</script>"		
		''else
		papar
		end if
				
		qq = " select kod from kompaun.jenis_kesalahan where kod = '"&salah&"' and perkara = '"&akta&"' "
		Set objRsqq = objConn.Execute(qq)
		
		if objRsqq.eof then
				response.write "<script language=""javascript"">"
				response.write "var timeID = setTimeout('invalid_jenis(""  "");',1) "
				response.write "</script>"
		''else
		papar
		end if		
  		
  		
  		
  		rr = " select no_pekerja from payroll.paymas where no_pekerja = '"&no_pekerja&"' "
		rr = rr & " union "
		rr = rr & " select no_pekerja from payroll.paymas_sambilan where no_pekerja = '"&no_pekerja&"' "
		Set objRsrr = objConn.Execute(rr)
		
		if objRsrr.eof then
				response.write "<script language=""javascript"">"
				response.write "var timeID = setTimeout('invalid_nopek(""  "");',1) "
				response.write "</script>"
		''else
		papar
		end if		

  		
  		
  		if waktu > 24 then
  				response.write "<script language=""javascript"">"
       		response.write "var timeID = setTimeout('invalid_masa(""  "");',1) "
       		response.write "</script>"
		''else
		papar
		end if
	
		if ampm = "PM" then
			if waktu <= 12 then
				masa1 = 12 + waktu
			else
				masa1 = waktu
			end if	
		else
			if waktu >= 12.01 and waktu <=12.59 then
				masa1 = waktu - 12		
			elseif waktu < 12 then
				masa1 = waktu
			else
				masa1 = waktu
				ampm = "PM"
			end if
		end if
		
	
		y = " select to_date(to_char(sysdate,'ddmmyyyy'),'ddmmyyyy') tkhs, "
                y = y & " to_date('"&tkh_lahir&"','ddmmyyyy') tkh2s, "
		y = y & " to_date('"&tkh_masuk&"','ddmmyyyy') tkh3s from dual "
       	Set objRsy = objConn.Execute(y)

                y1 = " select to_char(sysdate,'yyyy') tyy,  "
                y1= y1 & "    to_char(to_date('"&tkh_masuk&"','ddmmyyyy'),'yyyy') tmyy from dual "
               	Set objRsy1 = objConn.Execute(y1)
                tyy = objRsy1("tyy")
                 tmyy = objRsy1("tmyy")
                 
		if objRsy.eof or tmyy > tyy or tmyy < "1990" then
				response.write "<script language=""javascript"">"
       		response.write "var timeID = setTimeout('invalid_tarikh(""  "");',1) "
       		response.write "</script>"
		''else
		papar
		end if	
		
		tkhs = objRsy("tkhs")
		tkh2s = objRsy("tkh2s")
		tkh3s = objRsy("tkh3s")

		
		if tkh2s > tkhs then
				response.write "<script language=""javascript"">"
       		response.write "var timeID = setTimeout('invalid_tarikh(""  "");',1) "
       		response.write "</script>"
		''else
		papar
		end if	


		if tkh3s > tkhs then
				response.write "<script language=""javascript"">"
       		response.write "var timeID = setTimeout('invalid_tarikh(""  "");',1) "
       		response.write "</script>"'
			papar
		''else
		end if	
		
		nn = " select no_akaun from hasil.bil where no_akaun = '"&noakaun&"' "
  		nn = nn & " and (perkara <> 'P01' or perkara is null) "
		Set objRsnn = objConn.Execute(nn)
		
	if not objRsnn.eof then
			d = "     update hasil.bil set perkara4 = '"& perkara4 &"', "
			d = d & " perkara5 = '"& perkara5 &"',nama = '"& nama &"',alamat1 = '"& alamat1 &"', "
			d = d & " alamat2 = '"& alamat2 &"',alamat3 = '"& alamat3 &"',kp = '"& kp &"', "
			d = d & " tkh_lahir = to_date('"& tkh_lahir &"','ddmmyyyy'),perkara = '"& akta &"', "
			d = d & " no_rujukan2 = '"& salah &"', tkh_masuk = to_date('"& tkh_masuk &"','ddmmyyyy'), "
			d = d & " masa = '"& masa1 &"',perkara1 = '"& perkara1 &"',perkara2 = '"& perkara2 &"', "
			d = d & " tred = '"& tred &"',jenis = '"& jenis &"',no_pekerja = '"& no_pekerja &"', "
			d = d & " jabatan = '"& jab &"',kategori = '"& kat &"',akaun = '"& dakaun &"',amaun='"&amaun&"', parlimen='"&parlimen&"', "
			d = d & " daerah = '"&daerah&"',dun = '"&dun&"', kod_ternakan = '"& ternakan1 &"'"
			d = d & " where no_akaun = '"& noakaun &"' "
			''response.write "Upd" & d & "<br>"
			Set objRs2 = objConn.Execute(d)
			
			
			response.redirect "ik11a.asp?noakaun='"&noakaun&"'"
	   		'noakaun = ""
			response.write "<script language=""javascript"">"
           response.write "var timeID = setTimeout('invalid_nupdate(""  "");',1) "
           response.write "</script>"
			'papar
		else
		
			d = " insert into hasil.bil (no_akaun, perkara4, perkara5, nama, alamat1, alamat2, alamat3, "
			d = d & " kp, tkh_lahir, perkara, no_rujukan2, tkh_masuk, masa, perkara1, perkara2, "
			d = d & " tred, jenis, no_pekerja, jabatan, kategori, akaun,amaun, parlimen, daerah, dun, kod_ternakan) "
			d = d & "  values "
			d = d & " ( '"& noakaun &"' , '"& perkara4 &"' , '"& perkara5 &"' , '"& nama &"' , "
			d = d & " '"& alamat1 &"' , '"& alamat2 &"' , '"& alamat3 &"' , '"& kp &"' , "
			d = d & " to_date('"& tkh_lahir &"','ddmmyyyy') , "
			d = d & " '"& akta &"' , '"& salah &"', to_date('"& tkh_masuk &"','ddmmyyyy') , "
			d = d & " '"& masa1 &"' , '"& perkara1 &"', '"& perkara2 &"' , '"& tred &"' , '"& jenis &"' , "
			d = d & " '"& no_pekerja &"','"&jab&"', '"&kat&"', '"&dakaun&"','"&amaun&"','"&parlimen&"','"&daerah&"','"&dun&"','"&ternakan1&"') " 	
				
			''response.Write(d)
			Set objRs2 = objConn.Execute(d)
				
	   		'noakaun = ""
	   		
	   		'noakaun = ""
			response.write "<script language=""javascript"">"
           response.write "var timeID = setTimeout('invalid_nsave(""  "");',1) "
           response.write "</script>"
		   response.redirect "ik11a.asp?noakaun='"&noakaun&"'"
			
		end if

	end if 
	
	'******************************************** PROSES HAPUS	 *************************************************
		if proses4 = "Hapus" then
			rowid = request.form("rowid")
			a = " delete hasil.bil where rowid = '"&rowid&"' and no_akaun = '"&noakaun&"' "
			set sa = objconn.execute(a)	
			noakaun = ""
		end if
	
	
    sub papar		
  	s = " 	  select rowid, no_rujukan, upper(perkara4) perkara4, upper(perkara5) perkara5, upper(nama) nama, "
	s = s & " upper(alamat1) alamat1, upper(alamat2) alamat2, upper(alamat3) alamat3, kp, "
	s = s & " to_char(tkh_lahir,'ddmmyyyy') tkh_lahir,perkara, no_rujukan2, "
	s = s & " to_char(tkh_masuk,'ddmmyyyy') tkh_masuk,amaun,   "
	s = s & " to_char(masa) masa, upper(perkara1) perkara1, upper(perkara2) perkara2, tred, jenis, no_pekerja, parlimen,daerah,dun,kod_ternakan "
	s = s & " from hasil.bil "
	s = s & " where no_akaun = '"& noakaun &"' "
	s = s & " and (perkara <> 'P01' or perkara is null) "
	''response.write "Papar" & (s) & "<br>"
	Set gq = objConn.Execute(s)
	
  		if not gq.eof then
  			if add = "akta.asp" then
  				akta = request.cookies("fakt")
  			else
  				akta = gq("perkara")
  			end if
  			if add2 = "salah.asp" then
  				salah = request.cookies("fjenis")
  			else
				salah = gq("no_rujukan2")
			end if
			
			rowid = gq("rowid")
			sperkara4 = gq("perkara4")
			sperkara5 = gq("perkara5")
			snama = gq("nama")
			salamat1 = gq("alamat1")
			salamat2 = gq("alamat2")
			salamat3 = gq("alamat3")
			skp = gq("kp")
			tkh_lahir = gq("tkh_lahir")			
			stkh_masuk = gq("tkh_masuk")
			swaktu = gq("masa")
			sperkara1 = gq("perkara1")
			sperkara2 = gq("perkara2")
			stred = gq("tred")
			sjenis = gq("jenis")
			no_pekerja = gq("no_pekerja")
			amaun=gq("amaun")
			'rowid=gq("rowid")
			parlimen =gq("parlimen")
			daerah = gq("daerah")
			dun = gq("dun")
			perkara = gq("perkara")
			no_rujukan2 = gq("no_rujukan2")
			ternakan = gq("kod_ternakan")
			
			''response.write "Selamatkah? " &stred& "<br>"
			
  		k1 = "		  select initcap(keterangan) aketer from kompaun.perkara where kod = '"&akta&"' "
  		Set objk1 = objConn.Execute(k1)
  				if not objk1.eof then
	  				aketer = objk1("aketer")
  		  		end if	  				
  		k2 = "		  select initcap(keterangan) sketer from kompaun.jenis_kesalahan "
  		k2 = k2 & " where perkara = '"&akta&"' and kod = '"&salah&"' "
  		Set objk2 = objConn.Execute(k2)
  				if not objk2.eof then
	  				sketer = objk2("sketer")
  		  		end if	  		
		k3 = "		  select initcap(keterangan) pketer from hasil.parlimen "
  		k3 = k3 & " where kod = '"&parlimen&"' "
  		Set objk3 = objConn.Execute(k3)
  				if not objk3.eof then
	  				pketer = objk3("pketer")
  		  		end if	 
		k4 = "		  select initcap(dun) dketer from hasil.kawasan "
  		k4 = k4 & " where kod = '"&dun&"' "
  		Set objk4 = objConn.Execute(k4)
  				if not objk4.eof then
	  				dketer = objk4("dketer")
  		  		end if
		k5 = "		  select initcap(keterangan) tketer from hasil.jenis_ternakan "
  		k5 = k5 & " where kod = '"&ternakan&"' "
  		Set objk5 = objConn.Execute(k5)
  				if not objk5.eof then
	  				tketer = objk5("tketer")
  		  		end if
					
		end if  	
		

	
%>

<table width="50%" cellpadding="1" cellspacing="5" class="hd">
        <tr> 
          <td class="hd">No.Kompaun</td>
          <td><input type="hidden" value="<%=noakaun%>" name="noakaun" onFocus="nextfield='noakaun';" readonly ><%=noakaun%>
          <input type="hidden" value="<%=rowid%>" name="rowid" >
          </td>
          
        <tr> 
          <td class="hd">Akta / UUK</td>
          <td> 

    <select size="1" name="drop1" onChange="papar1(this.form);" AutoPostBack="True">
<option selected value="<%=akta%>"><%=akta%>-<%=aketer%></option>
<%  


mtuju = request.querystring("tuju")
	'Set objRszz = Server.CreateObject("ADODB.Recordset")
	zz = "select kod,initcap(keterangan) as terang from kompaun.perkara where kod <> 'P01' order by kod"
	Set objRszz = objConn.Execute(zz)	
	do while not objRszz.EOF	
	if mtuju <> "" and mtuju = objRszz("kod") then%>
	<option selected value="ik11a.asp?tuju=<%=objRszz("kod")%>"><%=objRszz("kod")%>-<%=objRszz("terang")%></option>
	<%else%>
<option value="ik11a.asp?tuju=<%=objRszz("kod")%>"><%=objRszz("kod")%>-<%=objRszz("terang")%></option>
<%end if
  objRszz.Movenext
  loop
 objRszz.close 
 set objRszz = nothing 
 
%>
 
</select>

<%    	akta = Request.QueryString("tuju")
''response.Write(akta)

 %><input type="hidden" value="<%=akta%>" name="fakta"></td>
        </tr>
        <tr> 
          <td class="hd">Butir Kesalahan</td>
            <td><select size="1" name="drop2" onChange="papar2(this.form);">
  <option selected value=""><%=salah%>-<%=sketer%></option>
<%
	salahv = request.querystring("tuju1")
	b = " select kod,keterangan from kompaun.jenis_kesalahan "
	b = b & " where perkara = '"&akta&"' order by kod "
	Set objRs1 = Server.CreateObject("ADODB.Recordset")
	Set objRs1 = objConn.Execute(b)
'response.write b
	 do while not objRs1.eof 
	 if salahv <> "" and salahv = objRs1("kod") then %>
<option selected value="ik11a.asp?tuju=<%=akta%>&tuju1=<%=objRs1("kod")%>&dae=<%=daerah%>&par=<%=parlimen%>&dun11=<%=dun%>"><%=objRs1("kod")%>
- <%=objRs1("keterangan")%></option>
<%   else %>
<option value="ik11a.asp?tuju=<%=akta%>&tuju1=<%=objRs1("kod")%>&dae=<%=daerah%>&par=<%=parlimen%>&dun11=<%=dun%>"><%=objRs1("kod")%>
- <%=objRs1("keterangan")%></option>
<% end if 
   objRs1.Movenext
   loop
   objRs1.close 
   
 %>
 
</select>

<%    salah = request.QueryString("tuju1")
   
   %><input type="hidden" value="<%=salah%>" name="fsalah" >
   </td>
        </tr>
        
        <%  
		
	mimi="select perkara,no_rujukan2 from hasil.bil where no_akaun='"&noakaun&"'"
	set rsm=ObjConn.Execute(mimi)
	''response.write mimi
	if not rsm.eof then
	akta=rsm("perkara")
	salah=rsm("no_rujukan2")
	end if	
		
	'	------------------------ dropdown jnis ternakan if jabatan 109 dan 113 sahaja--refer pn.raja --------------------------
		tr= " select jabatan from majlis.pengguna where no_pekerja ='"&gnop&"' "
		set objtr = objconn.execute(tr)
		
		
		if not objtr.eof then
			dept = objtr("jabatan") 
			
		end if
		deptok=""
			'******************************************************************
		'ika tambah user view jabatan masing2.admin view semua (23/09/2016)
		admin2 = "select id from hasil.superadmin where id='"&gnop&"' "
		Set objRAdmin2 = objConn.Execute(admin2)
		
		if not objRAdmin2.eof then
		
			dept = "ada"		
		end if
		'end view ikut jabatan
		'******************************************************************


		if dept = "109" or dept = "113" or dept="ada" then
		%>
         <tr> 
          <td class="hd">Jenis Ternakan</td>
            <td><select size="1" name="drop7" onChange="papar7(this.form);">
  <option selected value=""><%=ternakan%>-<%=tketer%></option>
<%
	ternak = request.querystring("ternak1")
	b = " select kod,keterangan from hasil.jenis_ternakan "
	Set objRs1 = Server.CreateObject("ADODB.Recordset")
	Set objRs1 = objConn.Execute(b)

	 do while not objRs1.eof 
	 if ternak <> "" and ternak = objRs1("kod") then %>
<option selected value="ik11a.asp?tuju=<%=akta%>&tuju1=<%=salah%>&ternak1=<%=objRs1("kod")%>&dae=<%=daerah%>&par=<%=parlimen%>&dun11=<%=dun%>"><%=objRs1("kod")%>
- <%=objRs1("keterangan")%></option>
<%   else %>
<option value="ik11a.asp?tuju=<%=akta%>&tuju1=<%=salah%>&ternak1=<%=objRs1("kod")%>&dae=<%=daerah%>&par=<%=parlimen%>&dun11=<%=dun%>"><%=objRs1("kod")%>
- <%=objRs1("keterangan")%></option>
<% end if 
   objRs1.Movenext
   loop
   objRs1.close 
   
 %>
 
</select>

<%    ternakan = request.QueryString("ternak1")
''response.Write(ternakan)
   
   %><input type="hidden" value="<%=ternakan%>" name="fternakan" >
   </td>
        </tr>
  <% 
  else
  
  end if %>
        
        <tr>
        <td class="hd" rowspan="6">Alamat</td>
          <td >Daerah : 
		<select size="1" name="drop3" onChange="papar3(this.form);" AutoPostBack="True">
<option selected value="<%=daerah%> "><%=daerah%> </option>
<%  mdae = request.querystring("dae")
	'Set objRszz = Server.CreateObject("ADODB.Recordset")
	zz = "select distinct(daerah) as daerah from hasil.kawasan"
	Set objRszz = objConn.Execute(zz)	
	do while not objRszz.EOF
	
	

		
	if mdae<> "" and mdae = objRszz("daerah") then%>
	<option selected value="ik11a.asp?tuju=<%=akta%>&tuju1=<%=salah%>&ternak1=<%=ternakan%>&dae=<%=objRszz("daerah")%>"><%=objRszz("daerah")%></option>
	<%else%>
<option value="ik11a.asp?tuju=<%=akta%>&tuju1=<%=salah%>&ternak1=<%=ternakan%>&dae=<%=objRszz("daerah")%>"><%=objRszz("daerah")%></option>
<%end if
  objRszz.Movenext
  loop
 objRszz.close 
 set objRszz = nothing 
 

 %>
</select>
<%  daerah = Request.QueryString("dae")
 ''response.Write(daerah)
 
 %>
 <input type="hidden" value="<%=daerah%>" name="fdaerah" >
       
	</td>
		</tr>
	
    <tr> 
          <td> Parlimen : 
         
<select size="1" name="drop4" onChange="papar4(this.form);">
<option value=""><%=parlimen%>-<%=pketer%> </option>
<%
	parlimen = request.querystring("par")
	b = "select DISTINCT a.kod, a.keterangan,b.parlimen,b.daerah from hasil.parlimen a, hasil.kawasan b "
	b = b & " where b.daerah = '"&daerah&"' and a.kod = b.parlimen order by kod "
	Set objRs1 = Server.CreateObject("ADODB.Recordset")
	Set objRs1 = objConn.Execute(b)
	'response.Write(b)

	 do while not objRs1.eof 
	 if parlimen <> "" and parlimen = objRs1("parlimen") then %>
<option selected value="ik11a.asp?tuju=<%=akta%>&tuju1=<%=salah%>&ternak1=<%=ternakan%>&dae=<%=daerah%>&par=<%=objRs1("parlimen")%>"><%=objRs1("kod")%>
- <%=objRs1("keterangan")%></option>
<%   else %>
<option value="ik11a.asp?tuju=<%=akta%>&tuju1=<%=salah%>&ternak1=<%=ternakan%>&dae=<%=daerah%>&par=<%=objRs1("parlimen")%>"><%=objRs1("kod")%>
- <%=objRs1("keterangan")%></option>
<% end if 
   objRs1.Movenext
   loop
   objRs1.close 
	 %>
</select>
<% parlimen = request.QueryString("par") 
'responsalahse.Write(par11)
 %><input type="hidden" value="<%=parlimen%>" name="fparlimen" >
</td>     
        </tr>
        
        <tr> 
        <td>Dun : 

       	<select size="1" name="drop6" onChange="papar6(this.form);">
<option value=""><%=dun%>-<%=dketer%></option>
<%
	dun = request.querystring("dun11")
	b = "select kod,dun,daerah,parlimen from hasil.kawasan "
	b = b & " where daerah = '"&daerah&"' and parlimen = '"&parlimen&"' order by kod "
	Set objRs2 = Server.CreateObject("ADODB.Recordset")
	Set objRs2 = objConn.Execute(b)
	'response.Write(b)

	 do while not objRs2.eof 
	 if dun <> "" and dun = objRs2("kod") then %>
<option selected value="ik11a.asp?tuju=<%=akta%>&tuju1=<%=salah%>&ternak1=<%=ternakan%>&dae=<%=daerah%>&par=<%=parlimen%>&dun11=<%=objRs2("kod")%>"><%=objRs2("kod")%>
- <%=objRs2("dun")%></option>
<%   else %>
<option value="ik11a.asp?tuju=<%=akta%>&tuju1=<%=salah%>&ternak1=<%=ternakan%>&dae=<%=daerah%>&par=<%=parlimen%>&dun11=<%=objRs2("kod")%>"><%=objRs2("kod")%>
- <%=objRs2("dun")%></option>
<% end if 
   objRs2.Movenext
   loop
   objRs2.close 
	 %>
</select>
<% parlimen = request.QueryString("par") 
'response.Write(par11)
 %><input type="hidden" value="<%=dun%>" name="fdun" >
</td>    

</tr>
        <%
		
	mimi1="select daerah,parlimen,dun from hasil.bil where no_akaun='"&noakaun&"'"
	set rsm1=ObjConn.Execute(mimi1)
	''response.write mimi1
	if not rsm1.eof then
	daerah = rsm1("daerah")
	parlimen = rsm1("parlimen")
	dun = rsm1("dun")
	end if	
	
	%>
         <tr> 
          
          <td> <input type="text" name="falamat1" size="60" value="<%=salamat1%>" maxlength="40" onFocus="nextfield='falamat2';"><font size="1" color="#FF00FF">*</font></td>
        </tr>
        <tr> 
          <td> <input type="text" name="falamat2" size="60" value="<%=salamat2%>" maxlength="40" onFocus="nextfield='falamat3';"> 
            <font size="1" color="#FF00FF">*</font></td>
        </tr>
        <tr> 
          <td> <input type="text" name="falamat3" size="60" value="<%=salamat3%>" maxlength="40" onFocus="nextfield='fkp';"> 
            <font size="1" color="#FF00FF">*</font></td>
        </tr>
		
        

        <tr> 
          <td class="hd">Nama</td>
          <td> <input type="text" name="fnama" size="60" value="<%=snama%>" maxlength="40" onFocus="nextfield='falamat1';"><font size="1" color="#FF00FF">*</font>
         </td>
        </tr>
		
        
        <tr> 
          <td class="hd">No Fail</td>
          <td> <input type="text" name="fperkara4" size="13" value="<%=sperkara4%>" maxlength="40" onFocus="nextfield='fperkara5';" >
		  <% 	perkara44 = ucase(Request.QueryString("fperkara4"))
		  response.Write(fperkara4)
 %></td>
        </tr>
        <tr>
          <td class="hd">No Sykt / Daftar</td>
          <td> <input type="text" name="fperkara5" size="13" value="<%=sperkara5%>" maxlength="40" onFocus="nextfield='fnama';"></td>
        </tr>

       
        
        <tr> 
          <td  class="hd">No 
            K/P</td>
          <td> <input type="text" name="fkp" size="20" value="<%=skp%>" maxlength="14" onFocus="nextfield='ftkh_lahir';" onKeyPress="return isNumberKey(event)" ></td>
        </tr>
        <%	if tkh_lahir = "" then
   			if Len(kp) >= 12 then
  				t = " select to_char(to_date('19'||substr('"&dkp&"', 0, 5),'yyyymmdd'),'ddmmyyyy') as dtkh_lahir "
  				t = t & " from dual "	
  				Set objRst = Server.CreateObject ("ADODB.Recordset")
    			Set objRst = objConn.Execute(t)
    			tkh_lahir = objRst("dtkh_lahir")
    		end if
		end if	
  %>
        <%		if swaktu <> "" then
   				if swaktu = 24 then
   					waktu1 = 12
   					ampm = "AM"
   				elseif waktu >=  13 then
   					waktu1 = swaktu - 12
   					ampm = "PM"
   			
   				elseif swaktu < 13.00 or swaktu = 12 then
   					waktu1 = swaktu
   					ampm = "AM"	
   				end if
   			end if	
%>
        <tr> 
          <td class="hd">Tarikh 
            Kompaun </td>
          <td> <input type="text" name="ftkh_masuk" size="10" value="<%=stkh_masuk%>" maxlength="8" onFocus="nextfield='fmasa';" onKeyPress="return isNumberKey(event)">
            &nbsp; <font face="Arial" size="1" color="#244980"><b>(ddmmyyyy)</b></font></td>
            </tr>
            <tr>
          <td class="hd">Waktu</td>
          <td> <input type="text" name="fmasa" value="<%=waktu1%>" size="5" maxlength="5" onFocus="nextfield='fperkara1';" onKeyPress="return isNumberKey(event)">
           
            &nbsp; <font size="1" face="Arial"><b> AM
            <input type="radio" value="AM" name="fampm" <%if ampm="" then%>checked<%end if%>>
            &nbsp; PM
            <input type="radio" value="PM" name="fampm" <%if ampm="PM" then%>checked<%end if%>>
            </b></font></td>
        </tr>
        <tr> 
          <td class="hd">Tempat</td>
          <td> <input type="text" name="fperkara1" size="100" value="<%=sperkara1%>" maxlength="100" onFocus="nextfield='fperkara2';">
            <font size="1" color="#FF00FF">*</font></td>
        </tr>
        <tr> 
          <td  class="hd">&nbsp;</td>
          <td> <input type="text" name="fperkara2" size="100" value="<%=sperkara2%>" maxlength="100" onFocus="nextfield='ftred';"> 
            <font size="1" color="#FF00FF">*</font></td>
        </tr>
        <tr> 
          <td  class="hd">Jenis 
            Tred</td>
          <td> 
            <%	g = " select kod, initcap(keterangan) as terang from lesen.tred order by kod "
    	Set objRsg = objConn.Execute(g) %>
            <select size="1" name="ftred" onFocus="nextfield='fjenis';">
              <%	if stred <> "" then  		
  		gg = " select kod, initcap(keterangan) as terang from lesen.tred where kod = '"& stred &"' order by kod "
    	Set objRsgg = objConn.Execute(gg)    
			
    	Do while not objRsgg.eof   %>
              <option value="<%=objRsgg("kod")%>" ><%=objRsgg("kod")%> 
              - <%=objRsgg("terang")%></option>
              <%	objRsgg.MoveNext
     	loop
		else    			%>
              <option value=""> Sila Pilih Jenis Tred </option>
              <%	end if
    	do while not objRsg.EOF 		%>
              <option value="<%=objRsg("kod")%>"><%=objRsg("kod")%> - <%=objRsg("terang")%></option>
              <%  	objRsg.MoveNext
     	loop  %>
            </select></td>
        </tr>
        <tr> 
          <td  class="hd">Jenis 
            Kompaun</td>
          <td> <select name="fjenis" onFocus="nextfield='fno_pekerja';">
              <%	if sjenis <> "" then
  			ss = " select decode('"&sjenis&"','1','Individu','2','Perniagaan','3','Industri',null) jtrg from dual " 
  			Set objRsqs = objConn.Execute(ss)			
  %>
              <option value="<%=sjenis%>" selected><%=sjenis%> - <%=objRsqs("jtrg")%></option>
              <%	else	%>
              <option value=""> Sila Pilih Jenis Kompaun </option>
              <%	end if		%>
              <option value="1">1 - Individu</option>
              <option value="2">2 - Perniagaan</option>
              <option value="3">3 - Industri</option>
            </select></td>
        </tr>
        <tr> 
          <td class="hd">Pengeluar 
            Kompaun</td>
          <%	
   		n = " select nama from payroll.paymas where no_pekerja = '"& no_pekerja &"' "
  		n = n & " union "
  		n = n & " select nama from payroll.tetap_sambilan where no_pekerja = '"& no_pekerja &"' "
   		Set objRsn = Server.CreateObject ("ADODB.Recordset")
   		Set objRsn = objConn.Execute(n)
    		
   		if not objRsn.eof then
    			napek = objRsn("nama")
   		end if		
  %>
          <td> <input type="text" name="fno_pekerja" size="7" value="<%=no_pekerja%>" maxlength="5" onFocus="nextfield='B1';">
            -&nbsp; <font color="#000000" size="1" face="Arial"><%=napek%></font></td>
        </tr>
        <tr>
          <td  class="hd">Amaun</font></b></td>
          
        <td> <font size="1" face="Arial"><b> 
          RM</b></font> 
          
          <% 
		  
		  kk = " select kod,maksima from kompaun.jenis_kesalahan where perkara = '"&kod11&"' "
		  Set objRskk = Server.CreateObject ("ADODB.Recordset")
		  Set objRskk = objConn.Execute(kk)
		  
		  if not objRskk.eof then
		  amount = objRskk("maksima")
		  
		  end if 
		  
		  %>
          
          <%

			
			kk = "select substr(kod,0,1) kod from kompaun.perkara "
			kk = kk & " where kod = '"&akta&"' "
			Set objRskk = objConn.Execute(kk)
			'response.Write(kk)

	 		if not objRskk.eof then
			kk2 = objRskk("kod")
			end if
			
			if kk2 = "U" then
			amaun = 250
			end if
			
			if kk2 = "A" then
			amaun = 500
			end if 
		
	 		%>
            
			 <input name="famaun" type="text" id="famaun" onChange="papar5(this.form);" size="14" maxlength="10"  value="<%=amaun%>">
		
             
          
          </td>
        </tr>
        <tr> 
          <td  class="hd" colspan="2" align="center"> 
          <input type="submit" name="B1" value="Simpan"  class="button" > 
            <input type="submit" value="Semula" name="B1" class="button">
          <input type="submit" value="Cetak Salinan" name="B1" class="button2">
         <% if gnop = "08806" or gnop = "00151" then %> <input type="submit" name="B4" value="Hapus" onFocus="nextfield='done';" class="button" onClick="return confirm(' Hapus Rekod Ini?')">
         <%  end if %></td>
        </tr>
      </table>


<% end sub 


	%>


</form>
</body>




</html>
