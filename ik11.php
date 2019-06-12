<!--#include file="connection.php" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>
<body>

<?php

    //****************************************************CODE PREPARE BY NADIA (25072017)******************************************************************//
	
	//error_reporting(E_ALL);
	//ini_set('display_errors','On');


    //*************SET CONNECTION TO DB*************//
	//$conn = "(DESCRIPTION =(ADDRESS_LIST =(ADDRESS = (PROTOCOL = TCP)(HOST = localhost)(PORT = 1521)))(CONNECT_DATA =(SERVICE_NAME = 12c)))";
	//$conn = oci_connect('majlis', 'majlis', '(DESCRIPTION =(ADDRESS = (PROTOCOL = TCP)(HOST = 0.0.0.0)(PORT = 1521))(CONNECT_DATA = (SID = MPSP)))');
	//$conn = oci_connect('majlis', 'majlis', 'localhost/12c');
	//$conn = oci_connect('majlis', 'majlis', '10.10.1.90/12c');

//$servername = "localhost";
//$username = "majlis";
//$password = "majlis";
//$conn = oci_connect($username, $password,$servername);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
echo "Connected successfully";

	 //*************CALL BLN/THN IKUT USER KEYIN*************//
$proses = $_REQUEST['B1'];

	
	$noakaun = $_REQUEST['fnoakaun'];
	//$noakaun = substr($noakaun,2,5);
	echo $noakaun;
//	session("noakaun1") = $noakaun;
	echo "Ba";
	
    //$spc = " ";

//   $h = " select lpad('".$gnop."',5,2)gnop from dual ";
//    $sh = oci_parse($conn,$h);
//	echo $h;
//oci_define_by_name($h, 'BIL', $gnop);
//oci_execute($sh);
//  	 
	if ($proses = "Hantar" )
    {
		//$_SESSION("noakaun1") = $noakaun;
header("Location: http://localhost/mpsp/i-Kompaun/ik11a.asp?noakaun1=$noakaun");

//$pagecode=   "
//		   response.redirect \"ik11a.asp?akaun=\"$noakaun.\"\"
//		   response.cookies(\"noakaun\") = fnoakaun\n";

//echo "$pagecode";
		  
	}	 

?>

<form name="myForm" method=POST action=ik11.php onSubmit="return check1(this)" >

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

</body>
</html>