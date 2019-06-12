<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
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


<form name=myForm method="POST" action="ik11a.asp" onSubmit="return check(this)">


<?php


		
setcookie($ikmenu, $ikmenu, time() + (86400 * 30), "/");
setcookie($gnop, $gnop, time() + (86400 * 30), "/");


$noakaun = $_REQUEST['fnoakaun'];
$proses = $_REQUEST['B1'];
$proses1 = $_REQUEST['B2'];
$proses2 = $_REQUEST['B3'];
$proses4 = $_REQUEST['B4'];

$noakaun = $_GET('noakaun1')	;
$dakaun = substr($noakaun,1,5);
$fakta1 = $_REQUEST['fakta1'];
$fsalah1 = $_REQUEST['fsalah1'];
 
$fdaerah1 = $_REQUEST['fdaerah1'];
$fparlimen1 = $_REQUEST['fparlimen1'];
$fdun1 = $_REQUEST['fdun1'];
$fternakan1 = $_REQUEST['fternakan1'];

$fperkara4 = strtoupper($_REQUEST['fperkara4']);
$fperkara5 = strtoupper($_REQUEST['fperkara5']);
$fnama = strtoupper($_REQUEST['fnama']);
$falamat1 = strtoupper($_REQUEST['falamat1']);
$falamat2 = strtoupper($_REQUEST['falamat2']);
$falamat3 = strtoupper($_REQUEST['falamat3']);
$fperkara1  = strtoupper($_REQUEST['fperkara1']);
$fperkara2 = strtoupper($_REQUEST['fperkara2']);
	

$fkp = $_REQUEST['fkp'];
$tkh_lahir = $_REQUEST['ftkh_lahir'];
$fakta = $_REQUEST['fakta'];
$fsalah = $_REQUEST['fsalah'];
$ftkh_masuk = $_REQUEST['ftkh_masuk'];
$fmasa = $_REQUEST['fmasa'];
$ftred = $_REQUEST['ftred'];

$fjenis = $_REQUEST['fjenis'];
$fno_pekerja = $_REQUEST['fno_pekerja'];
$famaun = $_REQUEST['famaun'];

$fdaerah = $_REQUEST['fdaerah'];
$fparlimen = $_REQUEST['fparlimen'];
$fdun = $_REQUEST['fdun'];
$fternakan = $_REQUEST['fternakan'];


$waktu = $_REQUEST['fmasa'];
$ampm = $_REQUEST['fampm'];
$famaun = $_REQUEST['famaun'];
$aa = $_REQUEST['rowid'];


setcookie($add, $fasp, time() + (86400 * 30), "/");
setcookie($add2, $fasp2, time() + (86400 * 30), "/");
 
 if ($add="akta.ap")
 {
setcookie($noakaun, $fac, time() + (86400 * 30), "/");
setcookie($akta, $fakta, time() + (86400 * 30), "/"); 
$proses = "Hantar";
 }
 
 elseif ($add2 ="salah.asp")
 {
setcookie($noakaun, $fac, time() + (86400 * 30), "/");
setcookie($akta, $fakta, time() + (86400 * 30), "/"); 
setcookie($salah, $fjenis, time() + (86400 * 30), "/");
$proses = "Hantar";
 }


if ($proses="Cetak Salinan")
{
header("Location: http://localhost/mpsp/i-Kompaun/ik11c.asp");	
}
	//response.cookies("dac") = Request.Form("rowid")
	
if ($proses1="List")
{
header("Location: http://localhost/mpsp/i-Kompaun/akta.asp");	
}	

if ($proses2="List")
{
header("Location: http://localhost/mpsp/i-Kompaun/salah.asp");	
}

if ($proses1="Simpan")
{
$falamat4 = strtoupper($_REQUEST['falamat4']);
$fperkara5  = strtoupper($_REQUEST['fperkara5']);
$fnama = strtoupper($_REQUEST['fnama']); 
$falamat1 = strtoupper($_REQUEST['falamat1']);
$falamat2 = strtoupper($_REQUEST['falamat2']);
$falamat3 = strtoupper($_REQUEST['falamat3']);
$fperkara1  = strtoupper($_REQUEST['fperkara1']);
$fperkara2  = strtoupper($_REQUEST['fperkara2']);
$fkp  = $_REQUEST['fkp'];
$tkh_lahir  = $_REQUEST['ftkh_lahir'];
$fakta  = $_REQUEST['fakta'];
$fsalah  = $_REQUEST['fsalah'];
$ftkh_masuk  = $_REQUEST['ftkh_masuk'];
$fmasa   = $_REQUEST['fmasa'];
$ftred  = $_REQUEST['ftred'];
$fjenis  = $_REQUEST['fjenis'];
$fno_pekerja  = $_REQUEST['fno_pekerja'];
$famaun  = $_REQUEST['famaun'];

$fdaerah  = $_REQUEST['fdaerah'];
$fparlimen   = $_REQUEST['fparlimen'];
$fdun  = $_REQUEST['fdun'];
$fternakan  = $_REQUEST['fternakan'];
$waktu  = $_REQUEST['fmasa'];
$ampm  = $_REQUEST['fampm'];
$aa  = $_REQUEST['rowid'];

if ($noakaun = "") 
{
	echo "Sila Masukkan No Akaun !!!" ;
}
elseif ($fakta = "")
 {
	echo " Sila Masukkan Akta !!! ";
 }
elseif ($fsalah = "")
 {
	echo " Sila Masukkan Butir Kesalahan !!! ";
 }
elseif ($fnama = "")
 {
	echo " Sila Masukkan Nama !!!";
 }
 elseif ($falamat1 = "")
 {
	echo " Sila Masukkan Alamat !!!";
 }
elseif ($ftkh_masuk = "")
 {
	echo " Sila Masukkan Tarikh !!!";
 }
elseif ($fmasa = "")
 {
	echo " Sila Masukkan Masa !!!";
 }
else
{
//nothing
}

   $y = " select kategori, jabatan from hasil.akaun where kod ='$dakaun' ";
   $objRs1y = oci_parse($conn,$y);
//	echo $h;
   oci_define_by_name($y, 'kategori', $kat);
   oci_define_by_name($y, 'jabatan', $jab);
   oci_execute($objRs1y);

	$df = " select jabatan from majlis.pengguna where no_pekerja ='$gnop' ";
	$rdf = oci_parse($conn,$df);
		
   oci_define_by_name($df, 'jabatan', $jab);
   oci_execute($rdf);	
		
	if ($kjab = "103" or $kjab = "112") 
		{
		$jab = $kjab;
		}
	
	$df = " select jabatan from majlis.pengguna where no_pekerja ='$gnop' ";
	$rdf = oci_parse($conn,$df);
		
   oci_define_by_name($df, 'jabatan', $jab);
   oci_execute($rdf);	
   
  $rr = " select no_pekerja from payroll.paymas where no_pekerja = '$fno_pekerja' union select no_pekerja from payroll.paymas_sambilan where no_pekerja =$fno_pekerja";
	$objRsrr = oci_parse($conn,$rr);	 
	oci_execute($objRsrr);	
		
		
 while(! feof($objRsrr))
{
  echo "Sila Masukkan No Pekerja !!!";
  $line = fgets($file);
}

if ($waktu > 24);
{
echo " Sila Masukkan Masa  !!!";
}

if ($ampm = "PM") 
{
  if ($waktu <= 12) 
  {
  $masa1 = 12 + $waktu;
  }
  else
 {
  $masa1 = $waktu;
  }
}
else
  {
  if ($waktu >= 12.01)// and ($waktu <=12.59) 
  {
  $masa1 = $waktu - 12;	
  }
  elseif ($waktu < 12)
  {
   $masa1 = $waktu;
  }
  else
  {
  $masa1 = $waktu;
  $ampm = "PM";
  }
  }
}

$y = "select to_date(to_char(sysdate,'ddmmyyyy'),'ddmmyyyy') tkhs,to_date('$tkh_lahir','ddmmyyyy') tkh2s,to_date('$tkh_masuk','ddmmyyyy') tkh3s from dual ";
     
	$objRsy = oci_parse($conn,$y);	 
	oci_execute($objRsy);
	  
   oci_define_by_name($y, 'tkhs', $tkhs);
   oci_define_by_name($y, 'tkh2s', $tkh2s);
   oci_define_by_name($y, 'tkh3s', $tkh3s);
   
   
   if (feof ($objRsy) || ($tmyy > $tyy) || ($tmyy < "1990") )
   {
		echo " Sila Masukkan Tarikh !!! ";
   }

$y1 = " select to_char(sysdate,'yyyy') tyy,to_char(to_date('"&tkh_masuk&"','ddmmyyyy'),'yyyy') tmyy from dual ";
 
	$objRsy1 = oci_parse($conn,$y1);	 
	oci_execute($objRsy1);
	
   oci_define_by_name($y, 'tyy', $tyy);
   oci_define_by_name($y, 'tmyy', $tmyy);
   
   	if ($tkh2s > $tkhs) 
	{  
		echo " Sila Masukkan Tarikh !!! ";
	}

	if ($tkh3s > $tkhs) 
	{  
		echo " Sila Masukkan Tarikh !!! ";
	}

 $nn = " select no_akaun from hasil.bil where no_akaun = '$noakaun' and (perkara <> 'P01' or perkara is null) ";
		
	$objRsnn = oci_parse($conn,$nn);	 
	oci_execute($objRsnn);
		
if ($noakaun <> "")
{
 $noakaun = str_replace($noakaun,"'","") ;
}
if ($fsalah1 <> "")
{
 $fsalah1 = str_replace($fsalah1,"'","") ;
}
if ($fnama <> "")
{
 $fnama = str_replace($fnama,"'","") ;
}
if ($falamat1 <> "")
{
 $falamat1 = str_replace($falamat1,"'","") ;
}
if ($falamat2 <> "")
{
 $falamat2 = str_replace($falamat2,"'","") ;
}
if ($falamat3 <> "")
{
 $falamat3 = str_replace($falamat3,"'","") ;
}
if ($fperkara1 <> "")
{
 $fperkara1 = str_replace($fperkara1,"'","") ;
}
if ($fperkara2 <> "")
{
 $fperkara2 = str_replace($fperkara2,"'","") ;
}
if ($fkp <> "")
{
 $fkp = str_replace($fkp,"'","") ;
}
if ($fmasa <> "")
{
 $fmasa = str_replace($fmasa,"'","") ;
}
if ($ftred <> "")
{
 $ftred = str_replace($ftred,"'","") ;
}
if ($fjenis <> "")
{
 $fjenis = str_replace($fjenis,"'","") ;
}

if ($famaun <> "")
{
 $famaun = str_replace($famaun,"'","") ;
}
if ($fjenis <> "")
{
 $fjenis = str_replace($fjenis,"'","") ;
}
if ($fno_pekerja <> "")
{
 $fno_pekerja = str_replace($fno_pekerja,"'","") ;
}
if ($fternakan <> "")
{
 $fternakan = str_replace($fternakan,"'","") ;
}

if (!feof ($objRsnn))
{
$d = "     update hasil.bil set perkara4 = '$fperkara4',perkara5 = '"& fperkara5 &"',nama = '"& fnama &"',alamat1 = '"& falamat1 &"', 
			 alamat2 = '"& falamat2 &"',alamat3 = '"& falamat3 &"',kp = '"& fkp &"', 
			 perkara = '"& fakta1 &"', 
			 no_rujukan2 = '"& fsalah1 &"', tkh_masuk = to_date('"& ftkh_masuk &"','ddmmyyyy'), 
			 masa = '"& masa1 &"',perkara1 = '"& fperkara1 &"',perkara2 = '"& fperkara2 &"', 
			 tred = '"& ftred &"',jenis = '"& fjenis &"',no_pekerja = '"& fno_pekerja &"', 
			 jabatan = '"& jab &"',kategori = '"& kat &"',akaun = '"& dakaun &"',amaun='"&famaun&"', parlimen='"&fparlimen1&"', 
			 daerah = '"&fdaerah1&"',dun = '"&fdun1&"', kod_ternakan = '"&fternakan1&"' 
			 where no_akaun = '"& noakaun &"' ";
			
	$objRs2 = oci_parse($conn,$d);	 
	oci_execute($objRs2);
	
	echo " Data Di Kemaskini !!! ";
}
else
{
	$d = " insert into hasil.bil (no_akaun, perkara4, perkara5, nama, alamat1, alamat2, alamat3, 
	      kp, tkh_lahir, perkara, no_rujukan2, tkh_masuk, masa, perkara1, perkara2, 
		  tred, jenis, no_pekerja, jabatan, kategori, akaun,amaun, parlimen, daerah, dun, kod_ternakan) 
		  values 
		  ( '$noakaun' , '$fperkara4' , '$fperkara5' , '$fnama' , 
			'$falamat1' , '$falamat2' , '$falamat3' , '$fkp' , 
			to_date('$tkh_lahir','ddmmyyyy') , 
			'$fakta1' , '$fsalah1', to_date('$ftkh_masuk','ddmmyyyy') , 
			'$masa1' , '$fperkara1', '$fperkara2' , '$ftred' , '$fjenis' , 
			'$fno_pekerja','$jab', '$kat', '$dakaun','$famaun','$fparlimen1','$fdaerah1','$fdun1','$fternakan1')"; 	

    $objRs2 = oci_parse($conn,$d);	 
	oci_execute($objRs2);
	
	echo " Data Di Simpan !!! ";
}
	
	
	//'******************************************** PROSES HAPUS	 *************************************************
		if ($proses4 = "Hapus") 
		$rowid  = $_REQUEST['rowid'];
			$a = " delete hasil.bil where rowid = '$rowid' and no_akaun = '$noakaun' ";
			$sa = oci_parse($conn,$a);	 
	        oci_execute($sa);
			
			
			$noakaun = "";
			
	// sub papar		
  	$s = " 	  select rowid, no_rujukan, upper(perkara4) perkara4, upper(perkara5) perkara5, upper(nama) nama, 
			  upper(alamat1) alamat1, upper(alamat2) alamat2, upper(alamat3) alamat3, kp, 
			  to_char(tkh_lahir,'ddmmyyyy') tkh_lahir,perkara, no_rujukan2, 
			  to_char(tkh_masuk,'ddmmyyyy') tkh_masuk,amaun,tkh_bayar,no_resit,
			  to_char(masa) masa, upper(perkara1) perkara1, upper(perkara2) perkara2, tred, jenis, no_pekerja, parlimen,daerah,dun,kod_ternakan 
	          from hasil.bil 
	          where no_akaun = '$noakaun ' ";
	
	$gq = oci_parse($conn,$s);	 
	oci_execute($gq);

		if (!feof ($gq))
		
  			if ($add = "akta.asp") 
			{
  				setcookie($akta, $fakt, time() + (86400 * 30), "/");
				//akta = request.cookies("fakt")
			}
  			else
  			{
				 oci_define_by_name($gq, 'perkara', $akta);
				//akta = gq("perkara")
  			}
  			if ($add2 = "salah.asp") 
			{
				setcookie($salah, $fjenis, time() + (86400 * 30), "/");
  				//salah = request.cookies("fjenis")
			}
  			else
				{
				oci_define_by_name($gq, 'no_rujukan2', $salah);
				//salah = gq("no_rujukan2")
				}
		
		
		oci_define_by_name($gq, 'rowid', $rowid);
		oci_define_by_name($gq, 'perkara4', $perkara4);
		oci_define_by_name($gq, 'perkara5', $perkara5);
		oci_define_by_name($gq, 'nama', $nama);
		oci_define_by_name($gq, 'alamat1', $alamat1);
		oci_define_by_name($gq, 'alamat2', $alamat2);
		oci_define_by_name($gq, 'alamat3', $alamat3);
		oci_define_by_name($gq, 'kp', $kp);
		oci_define_by_name($gq, 'tkh_lahir', $tkh_lahir);
		oci_define_by_name($gq, 'tkh_masuk', $tkh_masuk);
		oci_define_by_name($gq, 'masa', $waktu1);
		oci_define_by_name($gq, 'perkara1', $perkara1);
		oci_define_by_name($gq, 'perkara2', $perkara2);
		oci_define_by_name($gq, 'tred', $ftred);
		oci_define_by_name($gq, 'jenis', $fjenis);
		oci_define_by_name($gq, 'no_pekerja', $no_pekerja);
		oci_define_by_name($gq, 'amaun', $amaun);
		oci_define_by_name($gq, 'parlimen', $fparlimen);
		oci_define_by_name($gq, 'daerah', $fdaerah);
		oci_define_by_name($gq, 'dun', $fdun);
		oci_define_by_name($gq, 'perkara', $fakta);
		oci_define_by_name($gq, 'no_rujukan2', $fsalah);
		oci_define_by_name($gq, 'kod_ternakan', $fternakan);
		oci_define_by_name($gq, 'tkh_bayar', $tkh_bayar);
		oci_define_by_name($gq, 'no_resit', $no_resit);
		
		
 if ($tkh_bayar <> "") 
 { 
    ?>                   
<table width="60%" cellpadding="1" cellspacing="5" class="hd">
<tr><td align="center"><font size="2" color="red"> Kompaun telah dijelaskan pada <u>$tkh_bayar</u>. No resit : <u>$no_resit </u></font> </td></tr></table>


<?php
 }
		
?>

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
<?php
  $zv1 = "select kod,UPPER(keterangan) as terang from kompaun.perkara where kod <> 'P01' order by kod";
     
	 $rszv1 = oci_parse($conn,$zv1);	 
	 oci_execute($rszv1);
?>

           <select name="fakta" id="fakta" onChange="submitForm1(this)" >
           <option value="" size="30">Pilih Akta -- </option>
<?php
  do{
	  oci_define_by_name($rszv1, 'kod',$kodakta);
	  oci_define_by_name($rszv1, 'terang', $namaakta);
	
  }while  (!feof ($rszv1));
  
?>    
<option value="<%=kodsalah%>" <%=sSel%>> <%=kodsalah%> - <%=namasalah%> </option>
           
         
           </select>
		   
		  <input type="hidden" name="fsalah1" value="<%=session("fsalah2")%>" id="fsalah1"></td>
        </tr>
 <?php
// ------------------------ dropdown jnis ternakan if jabatan 109 dan 113 sahaja--refer pn.raja --------------------------
		$tr= " select jabatan from majlis.pengguna where no_pekerja ='$gnop&' ";
		 
		 $objtr = oci_parse($conn,$tr);	 
	     oci_execute($objtr);
		
		if (!feof ($objtr))
		 {
		   oci_define_by_name($objtr, 'jabatan',$dept);
		 }
		
		$deptok="";
//			'******************************************************************
	//	'ika tambah user view jabatan masing2.admin view semua (23/09/2016)
		$admin2 = "select id from hasil.superadmin where id='$gnop' ";
		
		$objRAdmin2 = oci_parse($conn,$admin2);	 
	    oci_execute($objRAdmin2);
		
		if (!feof ($objRAdmin2))
		{
			$dept = "ada"	;	
		}
//		'end view ikut jabatan
//		'******************************************************************

if ($dept = "109" or $dept = "113" or $dept="ada")
 {
	 ?> 
      <tr> 
          <td class="hd">Jenis Ternakan</td>
            <td>
	<?php 
 
  $zv6 = "select kod,UPPER(keterangan) ket from hasil.jenis_ternakan order by kod";
        $rszv6 = oci_parse($conn,$zv6);	 
	    oci_execute($rszv6);
		?> 	
	<select name="fternakan" id="fternakan" onChange="submitForm6(this)" >
           <option value="">Pilih Jenis Ternakan -- </option>
		<?php	 

  do{
	  oci_define_by_name($rszv6, 'kod',$kodternakan);
	  oci_define_by_name($rszv6, 'ket', $namaternakan);
	
  }while (!feof ($rszv6));
?> <option value="<%=kodternakan%>" <%=sSel%>> <%=kodternakan%> - <%=namaternakan%> </option> 
 </td>
 </tr>
  <tr> 
   <td class="hd">Nama <font size="1" color="#FF00FF">*</font></td>
          <td> <input type="text" name="fnama" size="60" value="
         <?php 
			 if ($fnama = "" )
			 { 
			 $nama;
			 }
			 else
			 {
			 $fnama;
			 }
			 ?>"
          maxlength="40" ></td>
        </tr>

<tr>
<td rowspan="7" class="hd"> Alamat <font size="1" color="#FF00FF">*</font></td> 
    <tr> 
          <td> 
		  <input type="text" name="falamat1" size="60" value="
            <?php 
			 if ($falamat1 = "" )
			 { 
			 $alamat1;
			 }
			 else
			 {
			 $falamat1;
			 }
			 ?>"
          maxlength="40" > 
		 	  </td>
    </tr>
        <tr> 
          <td> <input type="text" name="falamat2" size="60" value="
              <?php 
			 if ($falamat2 = "" )
			 { 
			 $alamat2;
			 }
			 else
			 {
			 $falamat2;
			 }
			 ?>"
           maxlength="40" > 
            </td>
        </tr>
        <tr> 
          <td> <input type="text" name="falamat3" size="60" value="
               <?php 
			 if ($falamat3 = "" )
			 { 
			 $alamat3;
			 }
			 else
			 {
			 $falamat3;
			 }
			 ?>" maxlength="40" > 
            </td>
        </tr>


    <td >DAERAH : 

 <?php
 //   '--------------new


     $zz1 = "select distinct(substr(daerah,1,3))daerah from hasil.kawasan order by daerah";
    
	 $rszz1 = oci_parse($conn,$zz1);	 
	 oci_execute($rszz1);
	 
	?> <select name="fdaerah" id="fdaerah" onChange="submitForm3(this)">
           <option value="" size="30">Pilih Daerah -- </option>
           
     <?php
	
	do{
	  oci_define_by_name($rszz1, 'daerah',$koddaerah);
	  
     }while  (!feof ($rszz1));

		  ?> 
           
           <option value="<%=koddaerah%>" <%=sSel%>> <%=koddaerah%> </option>
           </select>
		  <input type="hidden" name="fdaerah1" value="<%=session("fdaerah2")%>" id="fdaerah1"> 
          </td>
          </tr>  
    
 
    <tr>
      <td >PARLIMEN : 
 <?php
//   '--------------new parlimen
     $zv = "select DISTINCT a.kod, a.keterangan,b.parlimen,b.daerah from hasil.parlimen a, hasil.kawasan b
	  where b.daerah = '$ffdaerah1' and a.kod = b.parlimen order by kod  ";
    
	$rszv = oci_parse($conn,$zv);	 
	 oci_execute($rszv);
	
	?> 

		<select name="fparlimen" id="fparlimen" onChange="submitForm4(this)">
           <option value="">Pilih Parlimen -- </option>
           
            <?php
           do{
	  oci_define_by_name($rszv, 'kod',$kodparlimen);
	  oci_define_by_name($rszv, 'keterangan',$namaparlimen);
     }while  (!feof ($rszv));
		   
		
		  ?> 
           
           <option value="<%=kodparlimen%>" <%=sSel%>> <%=kodparlimen%> - <%=namaparlimen%> </option>
           
           </select>  <input type="hidden" name="fparlimen1" value="<%=session("fparlimen2")%>" id="fparlimen1" >
 </td>
    </tr>
      
    <tr>  
      <td >DUN : 
      <?php
       
		//''-----------------new dun
		 $zv = " select kod,UPPER(dun) ket from hasil.kawasan 
         where daerah = '$ffdaerah1' and parlimen = '$ffparlimen1' order by kod" ;
        $rszv = oci_parse($conn,$zv);	 
	    oci_execute($rszv);
	
		  ?> 
        
        <select name="fdun" id="fdun" onChange="submitForm5(this)">
        <option value="">Pilih Dun -- </option>
         <?php  
             do{
	  oci_define_by_name($rszv, 'kod',$koddun);
	  oci_define_by_name($rszv, 'ket',$namadun);
     }while  (!feof ($rszv));
			
		
		 ?> 
           
           <option value="<%=koddun%>" <%=sSel%>> <%=koddun%> - <%=namadun%> </option>
          
         
           </select>   <input type="hidden" name="fdun1" value="<%=session("fdun2")%>" id="fdun1" >
           </td>
    </tr>

 
<tr> 
          <td class="hd">No Fail</td>
          <td> <input type="text" name="fperkara4" size="13" value="
           <?php 
			 if ($fperkara4 = "" )
			 { 
			 $perkara4;
			 }
			 else
			 {
			 $fperkara4;
			 }
			 ?>"
           maxlength="40" >
	</td>
        </tr>
        <tr>
          <td class="hd">No Sykt / Daftar</td>
          <td> <input type="text" name="fperkara5" size="13" value="
          <?php 
			 if ($fperkara5 = "" )
			 { 
			 $perkara5;
			 }
			 else
			 {
			 $fperkara5;
			 }
			 ?>"
          maxlength="40" ></td>
        </tr>

       
        
        <tr> 
          <td  class="hd">No 
            K/P</td>
          <td> <input type="text" name="fkp" size="20" value="
           <?php 
			 if ($fkp = "" )
			 { 
			 $kp;
			 }
			 else
			 {
			 $fkp;
			 }
			 ?>"
           maxlength="14" onKeyPress="return isNumberKey(event)" ></td>
        </tr>
          <?php 
       	if ($tkh_lahir = "")
		{ 
   			if (strlen($kp) >= 12) 
			{
  				$t = " select to_char(to_date('19'||substr('"&fkp&"', 0, 5),'yyyymmdd'),'ddmmyyyy') as dtkh_lahir  from dual "	;
  				
				$objRst = oci_parse($conn,$t);	 
	            oci_execute($objRst);
				 oci_define_by_name($objRst, 'dtkh_lahir',$tkh_lahir);
    			
			}
		}

		if ($swaktu <> "")
		{ 
   			if ($swaktu = 24)
   				{
					$waktu1 = 12;
   					$ampm = "AM";
				}
   				elseif ($waktu >=  13) 
				{
   					$waktu1 = $swaktu - 12;
   					$ampm = "PM";
				}
   			
   				elseif ($swaktu < 13.00 or $swaktu = 12) 
				{
   					$waktu1 = $swaktu;
   					$ampm = "AM";	
				}
		}
 ?>
        <tr> 
          <td class="hd">Tarikh 
            Kompaun <font size="1" color="#FF00FF">*</font> </td>
          <td> <input type="text" name="ftkh_masuk" size="10" value="
          <?php
          if ($ftkh_masuk ="") 
		  {
          $tkh_masuk; 
		  }
		  else 
		  {
		  $ftkh_masuk;
		  }
		  ?>" 
		  
          maxlength="8" onKeyUp="DateFormat(this)">
            &nbsp;<font face="Arial" size="1" color="#244980"><b>(ddmmyyyy)</b></font></td>
            </tr>
            <tr>
          <td class="hd">Waktu <font size="1" color="#FF00FF">*</font></td>
          <td> <input type="text" name="fmasa" value="
          <?php
          if ($fwaktu1 ="") 
		  {
          $waktu1; 
		  }
		  else 
		  {
		  $fwaktu1;
		  }
		  ?>"
           size="5" maxlength="5" >
            &nbsp; <font size="1" face="Arial"><b> AM
            <input type="radio" value="AM" name="fampm" >
             <?php 
			 if ($fwaktu1 < 13)
			 { 
			 checked;
			 }
			 ?>
            &nbsp; PM
            <input type="radio" value="PM" name="fampm"  />
            <?php 
			 if ($fwaktu1 > 12 )
			 { 
			 checked;
			 }
			 ?>
            </b></font></td>
        </tr>
        <tr> 
          <td class="hd">Tempat <font size="1" color="#FF00FF">*</font></td>
          <td> <input type="text" name="fperkara1" size="80" value="
           <?php 
			 if ($fperkara1 = "" )
			 { 
			 $perkara1;
			 }
			 else
			 {
			 $fperkara1;
			 }
			 ?>" 
             maxlength="100" ></td>
        </tr>
        <tr> 
          <td  class="hd">&nbsp;</td>
          <td> <input type="text" name="fperkara2" size="80" value="
           <?php 
			 if ($fperkara2 = "" )
			 { 
			 $perkara2;
			 }
			 else
			 {
			 $fperkara2;
			 }
			 ?>"
           maxlength="100" > 
            <font size="1" color="#FF00FF">*</font></td>
        </tr>
        <tr> 
          <td  class="hd">Jenis 
            Tred</td>
          <td> 
            <?php
            	$g = " select kod, UPPER(keterangan) as terang from lesen.tred order by kod ";
    	        $objRsg = oci_parse($conn,$g);	 
	            oci_execute($objRsg);
		?>
            <select size="1" name="ftred" >
          <?php  
             	if ($ftred <> "" )  		
  		$gg = " select kod, UPPER(keterangan) as terang from lesen.tred where kod = '$ftred' order by kod ";
    	 
		$objRsgg = oci_parse($conn,$gg);	 
	    oci_execute($objRsgg);	
		
		  do{
	  oci_define_by_name($rszv, 'kod',$koddun);
	  oci_define_by_name($rszv, 'ket',$namadun);
     }while  (!feof ($objRsgg));
		
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
     	loop  ?>
            </select></td>
        </tr>
        <tr> 
          <td  class="hd">Jenis 
            Kompaun</td>
          <td> <select name="fjenis" >
          <?php 
		  	if ($fjenis <> "" )
  			{
			$ss = " select decode('"&fjenis&"','1','INDIVIDU','2','PERNIAGAAN','3','INDUSTRI',null) jtrg from dual " ;
  			
			$objRsqs= oci_parse($conn,$ss);	 
	        oci_execute($objRsqs);
			
			?>	
  			
              <option value="<%=fjenis%>" selected><%=fjenis%> - <%=objRsqs("jtrg")%></option>
              <?php 
			  }
			  else
			  {	
			  ?>	
              <option value=""> Pilih Jenis Kompaun </option>
              <?php 	
			  }	
			  ?>	
              <option value="1">1 - INDIVIDU</option>
              <option value="2">2 - PERNIAGAAN</option>
              <option value="3">3 - INDUSTRI</option>
            </select></td>
        </tr>
       <tr> 
          <td class="hd">Pengeluar Kompaun <font size="1" color="#FF00FF">*</font></td>
          <?php	
   		$n = " select nama from payroll.paymas where no_pekerja = '$no_pekerja' 
  		       union 
  		       select nama from payroll.tetap_sambilan where no_pekerja = '$no_pekerja' ";
   		
		$objRsn = oci_parse($conn,$n);	 
	    oci_execute($objRsn);
		
    		if (!feof ($objRsn))
		{
			  oci_define_by_name($objRsn, 'nama',$napek)	;	
		}
   				
  ?>
          <td> <input type="text" name="fno_pekerja" size="7" value="
          <?php	
		  if ($fno_pekerja = "" )
		 {
		  ?>
		  <%=no_pekerja%>
		 <?php
		 }
		 else 
		 {
		  ?>
         <%=fno_pekerja%>
         <?php
         }
		 ?>" 
          maxlength="5" onFocus="nextfield='B1';">
            -&nbsp; <font color="#000000" size="1" face="Arial"><%=napek%></font></td>
        </tr>
        <tr>
          <td  class="hd">Amaun</font></b></td>
          
        <td> <font size="1" face="Arial"><b> 
          RM</b></font> 
          
          <?php	
		  
		  $kk = " select kod,maksima from kompaun.jenis_kesalahan where perkara = '$kod11' ";
		 
		  $objRskk = oci_parse($conn,$kk);	 
	      oci_execute($objRskk);
		  
		  	if (!feof ($objRskk))
		{
			  oci_define_by_name($objRskk, 'maksima',$amount)	;	
		}
		  
		
			$kk = "select substr(kod,0,1) kod from kompaun.perkara  where kod = '$fakta' ";
			 
			$objRskk = oci_parse($conn,$kk);	 
	        oci_execute($objRskk);

	 		if (!feof ($objRskk))
		{
			  oci_define_by_name($objRskk, 'kod',$kk2)	;	
		}
			
			if ($kk2="U")
			{
			$famaun = 250;
			}
			
			if ($kk2="A")
			{
			$famaun = 500;
			}
		
		
	 		?>
            
			 <input name="famaun" type="text" id="famaun" onChange="papar5(this.form);" size="14" maxlength="10"  value="<%=famaun%>">
		
             
          
          </td>
        </tr>
        <tr> 
          <td  class="hd" colspan="2" align="center"> 
          <input type="submit" name="B2" value="Simpan"  class="button" > 
            <input type="submit" value="Semula" name="B1" class="button">
          <input type="submit" value="Cetak Salinan" name="B1" class="button2">
         <?php	
        if ($gnop = "08806" or $gnop = "00151")
		{
		?>
         <input type="submit" name="B4" value="Hapus" onFocus="nextfield='done';" class="button" onClick="return confirm(' Hapus Rekod Ini?')">
         <?php
		}
		?>
         </td>
        </tr>
      </table>


<% end sub 
 
}
 
  ?>     
</body>
</html>