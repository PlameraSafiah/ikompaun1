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
function submitForm1(x)
{
	document.getElementById("fakta1").value = x.value
	document.forms["myForm"].submit();
}
function submitForm2(x)
{
	document.getElementById("fsalah1").value = x.value
	document.forms["myForm"].submit();
}
function submitForm3(x)
{
	document.getElementById("fdaerah1").value = x.value
	document.forms["myForm"].submit();
}
function submitForm4(x)
{
	document.getElementById("fparlimen1").value = x.value
	document.forms["myForm"].submit();
}
function submitForm5(x)
{
	document.getElementById("fdun1").value = x.value
	document.forms["myForm"].submit();
}
function submitForm6(x)
{
	document.getElementById("fternakan1").value = x.value
	document.forms["myForm"].submit();
}
</script>

    
<script language="javascript">
function win() 
	{features = 
    "toolbar=no, location=no, directori=no, status=no, menubar=no," +
    "scrollbars=no, resizable=no, width=630, height=450, left=80, top=80"
    msg=window.open("ik11b.asp","msg",features) 
	}

function invalid_nkompaun(b)
    {  
       alert (b+" Kompaun Telah Dijelaskan !!! ");
		return(true);
    }
function invalid_masa(c)
    {  
       alert (c+" Sila Masukkan Masa !!! ");
		return(true);
    }
function invalid_tarikh(d)
	{
	   alert (d+" Sila Masukkan Tarikh !!! ");
		return(true);
	}
function invalid_akta(e)
	{
		alert (e+" Sila Masukkan Akta !!! ");
		return(true);
	}
function invalid_jenis(f)
	{
		alert (f+ " Sila Masukkan Butir Kesalahan !!! ")
		return(true);
	}
function invalid_nopek(g)
	{
		alert (g+ " Sila Masukkan No Pekerja !!! ")
		return(true);
	}
function invalid_akaun(h)
	{
		alert (h+ " No Kompaun Telah Wujud !!! ")
		return(true);
	}
function invalid_ac(j)
	{	alert(j+ "Sila Masukkan No Akaun !!!")
		return(true);
	}
function invalid_digit(j)
	{	alert(j+ "Sila Masukkan 11 Digit No Akaun !!!")
		return(true);
	}	
function invalid_nama(k)
	{	alert(k+ "Sila Masukkan Nama !!!")
		return(true);
	}	
function invalid_add(l)
	{	alert(l+ "Sila Masukkan Alamat !!!")
		return(true);
	}	
function invalid_tkhmasuk(q)
	{	alert(q+ "Sila Masukkan Tarikh !!!")
		return(true);
	}	
function invalid_time(u)
	{	alert(u+ "Sila Masukkan Masa !!!")
		return(true);
	}	
function invalid_komp(a)
	{	alert(a+ "Sila Masukkan Kod Akaun Kompaun Yg Betul !!!")
		return(true);
	}
</script>


<script language="javascript">

function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : evt.keyCode;
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;    
         return true;
      }


function DateFormat(vDateName, vDateValue, e, dateCheck, dateType) {
vDateType = dateType;

if (vDateValue == "~") {
alert("AppVersion = "+navigator.appVersion+" \nNav. 4 Version = "+isNav4+" \nNav. 5 Version = "+isNav5+" \nIE Version = "+isIE4+" \nYear Type = "+vYearType+" \nDate Type = "+vDateType+" \nSeparator = "+strSeperator);
vDateName.value = "";
vDateName.focus();
return true;
}
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
       alert (b+" Data Di Kemaskini !!! ");
	
		return true;
		
    }
function invalid_nsave(b)
    {  
       alert (b+" Data Di Simpan !!! ");
	
		return true;
		
    }

</script>
  

<BODY leftMargin=0 topMargin=0 bgcolor="<%=color4%>" onLoad="refresh">


<form name=myForm method="POST" action="ik11a.asp" onSubmit="return check(this)"  >


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
	
	
	fakta = request.form("fakta")
	fsalah = request.form("fsalah")
	fdaerah = request.Form("fdaerah")
	fparlimen = request.form("fparlimen")
	fdun = request.form("fdun")

	
	
 	fakta1 = request.Form("fakta1")
	fsalah1 = request.Form("fsalah1")
	fdaerah1 = request.Form("fdaerah1")
	fparlimen1 = request.Form("fparlimen1")
	fdun1 = request.Form("fdun1")
	fternakan1 = request.Form("fternakan1")
	
	fperkara4 = ucase(Request.Form("fperkara4"))
	fperkara5 = ucase(Request.Form("fperkara5"))
	fnama = ucase(Request.Form("fnama"))
	falamat1 = ucase(Request.Form("falamat1"))
	'response.write falamat1	
	falamat2 = ucase(Request.Form("falamat2"))
	falamat3 = ucase(Request.Form("falamat3"))
	fperkara1 = ucase(Request.Form("fperkara1"))
	fperkara2 = ucase(Request.Form("fperkara2"))
	fkp = Request.Form("fkp")
	tkh_lahir = Request.Form("ftkh_lahir")
	ftkh_masuk = Request.Form("ftkh_masuk")
	fmasa = Request.Form("fmasa")
	ftred = Request.Form("ftred")
	fjenis = Request.Form("fjenis")
	fno_pekerja = Request.Form("fno_pekerja")
	famaun = Request.Form("famaun")
	
	fternakan = request.form("fternakan")
	waktu = Request.Form("fmasa")
	ampm = Request.form("fampm")
	famaun = Request.Form("famaun")
	aa=	Request.Form("rowid")	

	
	
	
	
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
		'papar
		
		end if

	
	
	if proses = "Cetak Salinan" then
	response.cookies("dac") = Request.Form("rowid")
	
		If InStr(1, Request.ServerVariables("HTTP_USER_AGENT"), "MSIE") then
			response.redirect"ik11c.asp"
		else
			response.redirect"ik11_firefox.asp"
		end if
	end if
	
	
	if proses = "" then
     
		my = " select * from hasil.bil "
		my = my & "  where kategori = '45' " 'and PERKARA <> 'P01' and perkara is not null and tkh_bayar is not null  "
		my = my & " and (no_akaun like '76410'||'%' or no_akaun like '76420'||'%' or no_akaun like '76413'||'%' "
		my = my & " or no_akaun like '76412'||'%' or no_akaun like '76415'||'%' "
		my = my &  " or no_akaun like '76101'||'%'or no_akaun like '76441'||'%') "
		my = my & " and no_akaun = '"& noakaun &"' "
		Set Rsmy = objConn.Execute(my)
		
        
        if not Rsmy.eof then
		
		
		pkara = Rsmy("perkara")
		kate = Rsmy("kategori")
		no_akaun = Rsmy("no_akaun")
			
			papar
			
			else
			
			
			my1 = " select 'X' from hasil.bil where no_akaun = '"& noakaun &"' "
			set Rsmy1 = objconn.execute(my1)
			
			if not Rsmy1.eof then
					   response.write "<script language=""javascript"">"
					   response.write "var timeID = setTimeout('invalid_komp(""  "");',1) "
					   response.write "</script>"
					   'response.Redirect "ik11.asp"
					   response.end
					   
			else
			papar
			end if
				
		
		end if
	end if
	
	if proses = "Semula" then

        noakaun=""
        fnoakaun  =""
        response.cookies("dac").expires = date-100
		Response.cookies("fac").expires = date-100
		response.cookies("fasp").expires = date-100
		response.cookies("fasp2").expires = date-100
		response.Redirect"ik11.asp"
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
	
	if proses1 = "Simpan" then     
	
	aa=	Request.Form("rowid")	
 		
  		if noakaun = "" then
			response.write "<script language=""javascript"">"
   			response.write "var timeID = setTimeout('invalid_ac(""  "");',1) "
       		response.write "</script>"
			''papar

		elseif fakta = "" then
			response.write "<script language=""javascript"">"
   			response.write "var timeID = setTimeout('invalid_akta(""  "");',1) "
       		response.write "</script>"
			
		elseif fsalah = "" then
			response.write "<script language=""javascript"">"
   			response.write "var timeID = setTimeout('invalid_jenis(""  "");',1) "
       		response.write "</script>"
			
		elseif fnama = "" then
			response.write "<script language=""javascript"">"
   			response.write "var timeID = setTimeout('invalid_nama(""  "");',1) "
       		response.write "</script>"
			''papar
		elseif falamat1 = "" then
			response.write "<script language=""javascript"">"
   			response.write "var timeID = setTimeout('invalid_add(""  "");',1) "
       		response.write "</script>"
			''papar
		elseif ftkh_masuk = "" then
			response.write "<script language=""javascript"">"
   			response.write "var timeID = setTimeout('invalid_tkhmasuk(""  "");',1) "
       		response.write "</script>"
			''papar
		elseif fmasa = "" then
			response.write "<script language=""javascript"">"
   			response.write "var timeID = setTimeout('invalid_time(""  "");',1) "
       		response.write "</script>"
			''papar
		else
			response.write "nothing"
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

	
  		rr = " select no_pekerja from payroll.paymas where no_pekerja = '"&fno_pekerja&"' "
		rr = rr & " union "
		rr = rr & " select no_pekerja from payroll.paymas_sambilan where no_pekerja = '"&fno_pekerja&"' "
		Set objRsrr = objConn.Execute(rr)
		
		if objRsrr.eof then
				response.write "<script language=""javascript"">"
				response.write "var timeID = setTimeout('invalid_nopek(""  "");',1) "
				response.write "</script>"
		''else
		
		end if		

  		
  		
  		if waktu > 24 then
  				response.write "<script language=""javascript"">"
       		response.write "var timeID = setTimeout('invalid_masa(""  "");',1) "
       		response.write "</script>"
		''else
		''papar
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
		''papar
		end if	
		
		tkhs = objRsy("tkhs")
		tkh2s = objRsy("tkh2s")
		tkh3s = objRsy("tkh3s")

		
		if tkh2s > tkhs then
				response.write "<script language=""javascript"">"
       		response.write "var timeID = setTimeout('invalid_tarikh(""  "");',1) "
       		response.write "</script>"
		''else
		''papar
		end if	


		if tkh3s > tkhs then
				response.write "<script language=""javascript"">"
       		response.write "var timeID = setTimeout('invalid_tarikh(""  "");',1) "
       		response.write "</script>"'
			''papar
		''else
		end if	
		
		nn = " select no_akaun from hasil.bil where no_akaun = '"&noakaun&"' "
  		nn = nn & " and (perkara <> 'P01' or perkara is null) "
		Set objRsnn = objConn.Execute(nn)
		
		
		''--------------------untuk displaykan data even page load --------------------------
	if noakaun <> "" then noakaun = replace(noakaun,"'","") end if
	if fsalah1 <> "" then fsalah1 = replace(fsalah1,"'","") end if
	if fnama <> "" then fnama = replace(fnama,"'","`") end if	
	if falamat1 <> "" then falamat1=replace(falamat1,"'","")  end if
	if falamat2 <> "" then falamat2=replace(falamat2,"'","") end if	
	if falamat3 <> "" then falamat3=replace(falamat3,"'","") end if	
	if fperkara1 <> "" then fperkara1=replace(fperkara1,"'","") end if	
	if fperkara2 <> "" then fperkara2=replace(fperkara2,"'","") end if	
	if fkp <> "" then fkp=replace(fkp,"'","`") end if	
	if fmasa <> "" then fmasa=replace(fmasa,"'","") end if	
	if ftred <> "" then ftred=replace(ftred,"'","") end if	
	if fjenis <> "" then fjenis=replace(fjenis,"'","") end if	
	if famaun <> "" then famaun=replace(famaun,"'","") end if	
	if fjenis <> "" then fjenis=replace(fjenis,"'","") end if	
	if fno_pekerja <> "" then fno_pekerja=replace(fno_pekerja,"'","") end if	
	if fternakan <> "" then fternakan=replace(fternakan,"'","") end if	
	
	
	if not objRsnn.eof then
			d = "     update hasil.bil set perkara4 = '"& fperkara4 &"', "
			d = d & " perkara5 = '"& fperkara5 &"',nama = '"& fnama &"',alamat1 = '"& falamat1 &"', "
			d = d & " alamat2 = '"& falamat2 &"',alamat3 = '"& falamat3 &"',kp = '"& fkp &"', "
			d = d & " perkara = '"& fakta1 &"', "
			d = d & " no_rujukan2 = '"& fsalah1 &"', tkh_masuk = to_date('"& ftkh_masuk &"','ddmmyyyy'), "
			d = d & " masa = '"& masa1 &"',perkara1 = '"& fperkara1 &"',perkara2 = '"& fperkara2 &"', "
			d = d & " tred = '"& ftred &"',jenis = '"& fjenis &"',no_pekerja = '"& fno_pekerja &"', "
			d = d & " jabatan = '"& jab &"',kategori = '"& kat &"',akaun = '"& dakaun &"',amaun='"&famaun&"', parlimen='"&fparlimen&"', "
			d = d & " daerah = '"&fdaerah&"',dun = '"&fdun&"', kod_ternakan = '"&fternakan1&"' "
			d = d & " where no_akaun = '"& noakaun &"' "
			'response.write "Upd" & d & "<br>"
			Set objRs2 = objConn.Execute(d)

			session.Abandon   '---kill session	
		   
		   
		   response.write "<script language=""javascript"">"
           response.write "var timeID = setTimeout('invalid_nupdate(""  "");',1) "
           response.write "</script>"
		   response.redirect "ik11_edit.asp?noakaun="&noakaun&""
		   
		else
		
			d = " insert into hasil.bil (no_akaun, perkara4, perkara5, nama, alamat1, alamat2, alamat3, "
			d = d & " kp, tkh_lahir, perkara, no_rujukan2, tkh_masuk, masa, perkara1, perkara2, "
			d = d & " tred, jenis, no_pekerja, jabatan, kategori, akaun,amaun, parlimen, daerah, dun, kod_ternakan) "
			d = d & "  values "
			d = d & " ( '"& noakaun &"' , '"& fperkara4 &"' , '"& fperkara5 &"' , '"& fnama &"' , "
			d = d & " '"& falamat1 &"' , '"& falamat2 &"' , '"& falamat3 &"' , '"& fkp &"' , "
			d = d & " to_date('"& tkh_lahir &"','ddmmyyyy') , "
			d = d & " '"& fakta1 &"' , '"& fsalah1 &"', to_date('"& ftkh_masuk &"','ddmmyyyy') , "
			d = d & " '"& masa1 &"' , '"& fperkara1 &"', '"& fperkara2 &"' , '"& ftred &"' , '"& fjenis &"' , "
			d = d & " '"& fno_pekerja &"','"&jab&"', '"&kat&"', '"&dakaun&"','"&famaun&"','"&fparlimen&"','"&fdaerah&"','"&fdun&"','"&fternakan1&"')" 	
				
			Set objRs2 = objConn.Execute(d)
			session.Abandon '---kill session

			response.write "<script language=""javascript"">"
            response.write "var timeID = setTimeout('invalid_nsave(""  "");',1) "
            response.write "</script>"
			response.redirect "ik11_edit.asp?noakaun="&noakaun&""
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
	s = s & " to_char(tkh_masuk,'ddmmyyyy') tkh_masuk,amaun,tkh_bayar,no_resit,   "
	s = s & " to_char(masa) masa, upper(perkara1) perkara1, upper(perkara2) perkara2, tred, jenis, no_pekerja, parlimen,daerah,dun,kod_ternakan "
	s = s & " from hasil.bil "
	s = s & " where no_akaun = '"& noakaun &"' "
	's = s & " and (perkara <> 'P01' or perkara is null) "
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
			fperkara4 = gq("perkara4")
			fperkara5 = gq("perkara5")
			fnama = gq("nama")
			falamat1 = gq("alamat1")
			falamat2 = gq("alamat2")
			falamat3 = gq("alamat3")
			fkp = gq("kp")
			tkh_lahir = gq("tkh_lahir")			
			ftkh_masuk = gq("tkh_masuk")
			waktu1 = gq("masa")
			fperkara1 = gq("perkara1")
			fperkara2 = gq("perkara2")
			ftred = gq("tred")
			fjenis = gq("jenis")
			fno_pekerja = gq("no_pekerja")
			famaun=gq("amaun")
			'rowid=gq("rowid")
			fparlimen =gq("parlimen")
			fdaerah = gq("daerah")
			fdun = gq("dun")
			fakta = gq("perkara")
			fsalah = gq("no_rujukan2")
			fternakan = gq("kod_ternakan")
			
			tkh_bayar = gq("tkh_bayar")
			fno_resit = gq("no_resit")
					
		end if  	
		
	'------------akta
	if fakta1 <> "" then 
	ffakta = fakta1
	session("fakta2") = fakta1
	end if
	
	if fakta <> "" then
		ffakta1 = fakta
		session("fakta2") = fakta
	end if 
	
	if ffakta <> "" then
	
	ffakta1 = cstr(ffakta)
	session("fakta2") = ffakta
	end if
	
	
	'---------kesalahan
	if fsalah1 <> "" then 
	ffsalah = fsalah1
	session("fsalah2") = fsalah1
	end if
	
	if fsalah <> "" then
	
	ffsalah1 = fsalah
	session("fsalah2") = fsalah
	end if 
	
	if ffsalah <> "" then
	
	ffsalah1 = cstr(ffsalah)
	session("fsalah2") = ffsalah
	end if
	
	''---------------daerah
	
	if fdaerah1 <> "" then 
	ffdaerah = fdaerah1
	session("fdaerah2") = fdaerah1
	end if
	
	if fdaerah <> "" then
	
	ffdaerah1 = fdaerah
	session("fdaerah2") = fdaerah
	end if 
	
	if ffdaerah <> "" then
	
	ffdaerah1 = cstr(ffdaerah)
	session("fdaerah2") = ffdaerah
	end if
	
	
	''---------------parlimen
	
	if fparlimen1 <> "" then 
	ffparlimen = fparlimen1
	session("fparlimen2") = fparlimen1
	end if
	
	if fparlimen <> "" then
	
	ffparlimen1 = fparlimen
	session("fparlimen2") = fparlimen
	end if 
	
	if ffparlimen <> "" then
	
	ffparlimen1 = cstr(ffparlimen)
	session("fparlimen2") = ffparlimen
	end if
	
	''---------------dun
	
	if fdun1 <> "" then 
	ffdun = fdun1
	session("fdun2") = fdun1
	end if
	
	if fdun <> "" then
	
	ffdun1 = fdun
	session("fdun2") = fdun
	end if 
	
	if ffdun <> "" then
	
	ffdun1 = cstr(ffdun)
	session("fdun2") = ffdun
	end if
	
	''---------------ternakan
	
	if fternakan1 <> "" then 
	ffternakan= fternakan1
	session("fternakan2") = fternakan1
	end if
	
	if fternakan <> "" then
	
	ffternakan1 = fternakan
	session("fternakan2") = fternakan
	end if 
	
	if ffternakan <> "" then
	
	ffternakan1 = cstr(ffternakan)
	session("fternakan2") = ffternakan
	end if
	
	
%>

<% if tkh_bayar <> "" then                         %>
<table width="60%" cellpadding="1" cellspacing="5" class="hd">
<tr><td align="center"><font size="2" color="red"> Kompaun telah dijelaskan pada <u><%=ftkh_bayar%></u>. No resit : <u><%=fno_resit%> </u></font> </td></tr></table>

<% end if %>

<table width="60%" cellpadding="1" cellspacing="5" class="hd">
<tr>
<td colspan="2" class="hd"> <font size="1" color="#FF00FF">Ruangan bertanda ' * ' ini wajib di isi</font>
</td>
</tr>
        <tr> 
          <td class="hd">No.Kompaun</td>
          <td><input type="hidden" value="<%=noakaun%>" name="noakaun" readonly ><%=noakaun%>
          <input type="hidden" value="<%=rowid%>" name="rowid" >
          </td>
          
        <tr> 
          <td class="hd">Akta / UUK <font size="1" color="#FF00FF">*</font></td>
          <td>
	
  
    <%   '--------------new


     zv1 = "select kod,UPPER(keterangan) as terang from kompaun.perkara where kod <> 'P01' order by kod"
     Set rszv1 = objConn.Execute(zv1) 
		%>
           
           <select name="fakta" id="fakta" onChange="submitForm1(this)" >
           <option value="" size="30">Pilih Akta -- </option>
           
           <%

	
	 do while not rszv1.eof 
		   
		   kodakta = rszv1("kod")
		   namaakta = rszv1("terang")
		   
		   sSel = ""
		   
		  if kodakta = ffakta1  then sSel = " selected=""selected"""
		   
		   %>
           
           <option value="<%=kodakta%>" <%=sSel%>> <%=kodakta%> - <%=namaakta%> </option>
           
           <% rszv1.movenext
		   loop
		   %>
           </select>
		   
		  <input type="hidden" name="fakta1" value="<%=session("fakta2")%>" id="fakta1"> 

    </td>
        </tr>
        
   
		<tr> 
          <td class="hd">Butir Kesalahan <font size="1" color="#FF00FF">*</font> </td>
            <td>
            
<%   '--------------new
     zv2 = "select kod,UPPER(keterangan) as terang from kompaun.jenis_kesalahan where perkara = '"&ffakta1&"' order by kod"
     Set rszv2 = objConn.Execute(zv2) 
	%>
		 <select name="fsalah" id="fsalah" onChange="submitForm2(this)" >
           <option value="">Pilih Kesalahan -- </option>
           
           <% do while not rszv2.eof 
		   
		   kodsalah = rszv2("kod")
		   namasalah = rszv2("terang")
		   
		   sSel = ""
		   
		  if kodsalah = ffsalah1  then sSel = " selected=""selected"""
		   
		   %>
           
           <option value="<%=kodsalah%>" <%=sSel%>> <%=kodsalah%> - <%=namasalah%> </option>
           
           <% rszv2.movenext
		   loop
		   %>
           </select>
		   
		  <input type="hidden" name="fsalah1" value="<%=session("fsalah2")%>" id="fsalah1"></td>
        </tr>
   
<%  
		
'	mimi="select perkara,no_rujukan2 from hasil.bil where no_akaun='"&noakaun&"'"
'	set rsm=ObjConn.Execute(mimi)
'	''response.write mimi
'	if not rsm.eof then
'	akta=rsm("perkara")
'	salah=rsm("no_rujukan2")
'	end if	
		
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
            <td>

			<%   '--------------new ternakan
			
     		 zv6 = "select kod,UPPER(keterangan) ket from hasil.jenis_ternakan order by kod"
    		 Set rszv6 = objConn.Execute(zv6) 
				%>
			 <select name="fternakan" id="fternakan" onChange="submitForm6(this)" >
           <option value="">Pilih Jenis Ternakan -- </option>
           
           <% do while not rszv6.eof 
		   
		   kodternakan = rszv6("kod")
		   namaternakan = rszv6("ket")
		   
		   sSel = ""
		   
		  if kodternakan = ffternakan1  then sSel = " selected=""selected"""
		   
		   %>
           
           <option value="<%=kodternakan%>" <%=sSel%>> <%=kodternakan%> - <%=namaternakan%> </option>
           
           <% rszv6.movenext
		   loop
		   %>
           </select>
		   
		  <input type="hidden" name="fternakan1" value="<%=session("fternakan2")%>" id="fternakan1"> 

          
   </td>
        </tr>
  <% 
  else
  
  end if %>
  
  
   <tr> 
          <td class="hd">Nama <font size="1" color="#FF00FF">*</font></td>
          <td> <input type="text" name="fnama" size="60" value="<%=fnama%>" maxlength="40" ></td>
        </tr>
        
          
             
<tr>
<td rowspan="7" class="hd"> Alamat <font size="1" color="#FF00FF">*</font></td> 
    <tr> 
          <td> <input type="text" name="falamat1" size="60" value="<%=falamat1%>" maxlength="40" ></td>
    </tr>
        <tr> 
          <td> <input type="text" name="falamat2" size="60" value="<%=falamat2%>" maxlength="40" > 
            </td>
        </tr>
        <tr> 
          <td> <input type="text" name="falamat3" size="60" value="<%=falamat3%>" maxlength="40" > 
            </td>
        </tr>

    <td >DAERAH : 

     <%   '--------------new daerah
     
	%>

        <select name="fdaerah" size="1" onChange="submitForm3(this)">
        <option value="">Pilih Daerah</option>
        <%if fdaerah <> "" then%>
        <option value="<%=fdaerah%>" selected><%=fdaerah%></option>
        <%end if%>
          <option value="SPU">SEBERANG PERAI UTARA</option>
          <option value="SPT">SEBERANG PERAI TENGAH</option>
          <option value="SPS">SEBERANG PERAI SELATAN</option>
        </select>
           
       <input type="hidden" name="fdaerah1" value="<%=session("fdaerah2")%>" id="fdaerah1">
      </td>
    </tr>  
    
 
    <tr>
      <td >PARLIMEN : 

<%   '--------------new parlimen
     zv = "select DISTINCT a.kod, a.keterangan,b.parlimen,b.daerah from hasil.parlimen a, hasil.kawasan b"
	 zv = zv & " where b.daerah = '"&ffdaerah1&"' and a.kod = b.parlimen order by kod  "
     Set rszv = objConn.Execute(zv) 
	 
	%>
		<select name="fparlimen" id="fparlimen" onChange="submitForm4(this)">
           <option value="">Pilih Parlimen -- </option>
           
           <% do while not rszv.eof 
		   
		   kodparlimen= rszv("kod")
		   namaparlimen = rszv("keterangan")
		   
		   sSel = ""
		   
		  if kodparlimen = ffparlimen1  then sSel = " selected=""selected"""
		   
		   %>
           
           <option value="<%=kodparlimen%>" <%=sSel%>> <%=kodparlimen%> - <%=namaparlimen%> </option>
           
           <% rszv.movenext
		   loop
		   %>
           </select>  <input type="hidden" name="fparlimen1" value="<%=session("fparlimen2")%>" id="fparlimen1" >
 </td>
    </tr>
    
    

      
      
    <tr>  
      <td >DUN : 
        <% 
		''-----------------new dun
		 zv = " select kod,UPPER(dun) ket from hasil.kawasan "
         zv = zv & "where daerah = '"& ffdaerah1 &"' and parlimen = '"& ffparlimen1 &"' order by kod" 
         Set rszv = objConn.Execute(zv)
		 %>
        
        <select name="fdun" id="fdun" onChange="submitForm5(this)">
           <option value="">Pilih Dun -- </option>
           
           <% do while not rszv.eof 
		   
		   koddun= rszv("kod")
		   namadun = rszv("ket")
		   
		   sSel = ""
		   
		  if koddun = ffdun1  then sSel = " selected=""selected"""
		   
		   %>
           
           <option value="<%=koddun%>" <%=sSel%>> <%=koddun%> - <%=namadun%> </option>
           
           <% rszv.movenext
		   loop
		   %>
           </select>   <input type="hidden" name="fdun1" value="<%=session("fdun2")%>" id="fdun1" >
           </td>
    </tr>

 
<tr> 
          <td class="hd">No Fail</td>
          <td> <input type="text" name="fperkara4" size="13" value="<%=fperkara4%>" maxlength="40" >
	</td>
        </tr>
        <tr>
          <td class="hd">No Sykt / Daftar</td>
          <td> <input type="text" name="fperkara5" size="13" value="<%=fperkara5%>" maxlength="40" ></td>
        </tr>

       
        
        <tr> 
          <td  class="hd">No 
            K/P</td>
          <td> <input type="text" name="fkp" size="20" value="<%=fkp%>" maxlength="14" onKeyPress="return isNumberKey(event)" ></td>
        </tr>
        <%	if tkh_lahir = "" then
   			if Len(kp) >= 12 then
  				t = " select to_char(to_date('19'||substr('"&fkp&"', 0, 5),'yyyymmdd'),'ddmmyyyy') as dtkh_lahir "
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
            Kompaun <font size="1" color="#FF00FF">*</font> </td>
          <td> <input type="text" name="ftkh_masuk" size="10" value="<%=ftkh_masuk%>" maxlength="8" onKeyUp="DateFormat(this)">
            &nbsp;<font face="Arial" size="1" color="#244980"><b>(ddmmyyyy)</b></font></td>
            </tr>
            <tr>
          <td class="hd">Waktu <font size="1" color="#FF00FF">*</font></td>
          <td> <input type="text" name="fmasa" value="<%=waktu1%>" size="5" maxlength="5" >
           
            &nbsp; <font size="1" face="Arial"><b> AM
            <input type="radio" value="AM" name="fampm" <%if waktu1 < 13 then%>checked<%end if%>>
            &nbsp; PM
            <input type="radio" value="PM" name="fampm" <%if waktu1 > 12 then%>checked<%end if%>>
            </b></font></td>
        </tr>
        <tr> 
          <td class="hd">Tempat <font size="1" color="#FF00FF">*</font></td>
          <td> <input type="text" name="fperkara1" size="80" value="<%=fperkara1%>" maxlength="100" ></td>
        </tr>
        <tr> 
          <td  class="hd">&nbsp;</td>
          <td> <input type="text" name="fperkara2" size="80" value="<%=fperkara2%>" maxlength="100" > 
            <font size="1" color="#FF00FF">*</font></td>
        </tr>
        <tr> 
          <td  class="hd">Jenis 
            Tred</td>
          <td> 
            <%	g = " select kod, UPPER(keterangan) as terang from lesen.tred order by kod "
    	Set objRsg = objConn.Execute(g) %>
            <select size="1" name="ftred" >
              <%	if ftred <> "" then  		
  		gg = " select kod, UPPER(keterangan) as terang from lesen.tred where kod = '"& ftred &"' order by kod "
    	Set objRsgg = objConn.Execute(gg)    
			
    	Do while not objRsgg.eof   %>
              <option value="<%=objRsgg("kod")%>" ><%=objRsgg("kod")%> 
              - <%=objRsgg("terang")%></option>
              <%	objRsgg.MoveNext
     	loop
		else    			%>
              <option value=""> Pilih Jenis Tred </option>
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
          <td> <select name="fjenis" >
          <%	if fjenis <> "" then
  			ss = " select decode('"&fjenis&"','1','INDIVIDU','2','PERNIAGAAN','3','INDUSTRI',null) jtrg from dual " 
  			Set objRsqs = objConn.Execute(ss)			
  			%>
              <option value="<%=fjenis%>" selected><%=fjenis%> - <%=objRsqs("jtrg")%></option>
              <%	else	%>
              <option value=""> Pilih Jenis Kompaun </option>
              <%	end if		%>
              <option value="1">1 - INDIVIDU</option>
              <option value="2">2 - PERNIAGAAN</option>
              <option value="3">3 - INDUSTRI</option>
            </select></td>
        </tr>
        <tr> 
          <td class="hd">Pengeluar Kompaun <font size="1" color="#FF00FF">*</font></td>
          <%	
   		n = " select nama from payroll.paymas where no_pekerja = '"& fno_pekerja &"' "
  		n = n & " union "
  		n = n & " select nama from payroll.tetap_sambilan where no_pekerja = '"& fno_pekerja &"' "
   		Set objRsn = Server.CreateObject ("ADODB.Recordset")
   		Set objRsn = objConn.Execute(n)
    		
   		if not objRsn.eof then
    			napek = objRsn("nama")
   		end if		
  %>
          <td> <input type="text" name="fno_pekerja" size="7" value="<%=fno_pekerja%>" maxlength="5" onFocus="nextfield='B1';">
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
			kk = kk & " where kod = '"&fakta&"' "
			Set objRskk = objConn.Execute(kk)
			'response.Write(kk)

	 		if not objRskk.eof then
			kk2 = objRskk("kod")
			end if
			
			if kk2 = "U" then
			famaun = 250
			end if
			
			if kk2 = "A" then
			famaun = 500
			end if 
		
	 		%>
            
			 <input name="famaun" type="text" id="famaun" onChange="papar5(this.form);" size="14" maxlength="10"  value="<%=famaun%>">
		
             
          
          </td>
        </tr>
        <tr> 
          <td  class="hd" colspan="2" align="center"> 
          <input type="submit" name="B2" value="Simpan"  class="button" > 
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