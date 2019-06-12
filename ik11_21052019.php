<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>i-Kompaun : Maklumat Kesalahan</title>
</head>
<script language="javascript">
function check1(f){
	if(f.fnoakaun.value == ""){
	alert("Sila masukkan nombor kompaun");
	return false;
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
		return false;
		
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



</script>

<body>
<?php
 

//Set objConn = Server.CreateObject("ADODB.Connection")
  // objConn.Open "dsn=12c;uid=majlis;pwd=majlis;"   
   
	$ikmenu = request.cookies("ikmenu")	;
	//'response.cookies("ikmenu") = "ik11.asp"
	
    $gnop = 	request.cookies("gnop");

	$h = " select lpad('".$gnop."',5,2)gnop from dual ";
    $sh = oci_parse($conn,$h);
	oci_execute($sh);
   
   
	$gnop = sh("gnop");
	
	$proses = Request.form("B1");
	$proses1 = Request.Form("B2");
	$proses2 = Request.Form("B3");
	$proses4 = request.form("B4");	
	
	$noakaun = Request.Form("fnoakaun");
    $dakaun = mid(noakaun,1,5);
	session("noakaun1") = noakaun;


	if ($proses = "Hantar" )
     {

$pagecode=   "
		   response.redirect \"ik11a.asp?akaun=\"$noakaun.\"\"
		   response.cookies(\"noakaun\") = fnoakaun\n";

echo "$pagecode";
		  
	 }
	
	
	
?>	




<form name="myForm" method=POST action=ik11.asp onSubmit="return check1(this)" >

 <table width="50%" cellpadding="1" cellspacing="5" class="hd">
        <tr> 
          <td class="hd">No Kompaun</td>
          <td><input type="text" name="fnoakaun" size="13" value="<%=noakaun%>" onKeyPress="return isNumberKey(event)" maxlength="11"  onFocus="nextfield='B1';">  &nbsp;
            <input type="submit" value="Hantar" name="B1" class="button"> 
          </td>
        </tr>
<script>
	document.myForm.fnoakaun.focus()
</script>
                
      </table>

</form>



</html>