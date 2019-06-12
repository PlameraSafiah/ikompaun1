<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>i-Kompaun : Maklumat Kesalahan</title>
</head>
<script language="javascript">
function invalid_amn(d)
    {  
       alert (d+" Sila Masukkan Amaun Bayar !!!");
    history.back(-1);
		return(true);
      
    }
</script>
<?php

//Set objConn = Server.CreateObject ("ADODB.Connection")
  //	ObjConn.Open "dsn=12c;uid=majlis;pwd=majlis;"
  	 
 	//bil = Request.QueryString("bil")
	setcookie($nop, $gnop, time() + (86400 * 30), "/");
	setcookie($akaune, $dac, time() + (86400 * 30), "/");
	//nop = Request.Cookies("gnop")
	//akaune=request.Cookies("dac")
	//'response.Write(akaune)
  if ($akaune="")
  { 
  $akaune  = $_REQUEST['akaunz'];
  }
	        		
   			 $d = " select initcap(nama) nama,lpad(no_pekerja,5,0)nop from payroll.paymas where no_pekerja = '$nop' ";
        	  
			$objRs2 = oci_parse($conn,$d);	 
	        oci_execute($objRs2);
			 //  Set objRs2 = objConn.Execute(d)        		 		
        		
        		if (!feof ($objRs2))
				{
				oci_define_by_name($objRs2, 'nama', $nama);
		        oci_define_by_name($objRs2, 'nop', $nop);
				}
        		else
				{
					setcookie($nama, $gnop, time() + (86400 * 30), "/");
				}
				

		
		$b3 = "select a.no_akaun,a.nama,a.alamat1,a.alamat2,a.alamat3,a.kategori,to_char(a.tkh_masuk,'dd/mm/yyyy') as tkh1,a.no_rujukan2,a.perkara, 
		 initcap(a.perkara1)||lower(a.perkara2) perkara1,initcap(a.perkara3) perkara3,to_char(sysdate,'dd/mm/yyyy') tkh , 
		 initcap(a.perkara4) perkara4,initcap(a.perkara5) perkara5,a.jabatan,a.no_rujukan,nvl(a.amaun,0) amaun,a.akaun,a.siri,initcap(b.keterangan) as jab 
		 from hasil.bil a,iabs.jabatan b where a.jabatan = b.kod and a.rowid = '$akaune' ";
		
		 $rb = oci_parse($conn,$b3);	 
	     oci_execute($rb);
		 
		 if (!feof ($rb))
		        oci_define_by_name($rb, 'amaun', $amn);
				oci_define_by_name($rb, 'nama', $nama);
				oci_define_by_name($rb, 'alamat1', $alamat1);
				oci_define_by_name($rb, 'alamat2', $alamat2);
				oci_define_by_name($rb, 'alamat3', $alamat3);
				oci_define_by_name($rb, 'tkh1', $tkh1);
		       
                 if ($amn="0") 
				 {
 						echo "<script language=""javascript"">" ;
        				echo "var timeID = setTimeout('invalid_amn("" "");',1) ";
       					echo "</script>"  ;
				 }
                  else

                oci_define_by_name($rb, 'no_rujukan2', $salah);
                oci_define_by_name($rb, 'perkara', $akta);
				
		$k2 = "		  select initcap(keterangan) sketer from kompaun.jenis_kesalahan 
  		 where perkara = '$akta' and kod = '$salah' " ;
		
		 $objk2 = oci_parse($conn,$k2);	 
	     oci_execute($objk2);
		
  		 if (!feof ($objk2))
		 {
			 oci_define_by_name($objk2, 'sketer', $sketer);
 			
	    echo"<p>&nbsp;</p>";
		echo"<p>&nbsp;</p>";
		echo"<p>&nbsp;</p>";
		echo"<p>&nbsp;</p><br><br>";
		echo"<p>&nbsp;&nbsp;&nbsp;".$nama."<br>";
		echo"&nbsp;&nbsp;&nbsp;".$alamat1."<br>";
		echo"&nbsp;&nbsp;&nbsp;".$alamat2."<br>";
		echo"&nbsp;&nbsp;&nbsp;".$alamat3."</p></br>";
		echo"<p>&nbsp;</p>";
		echo"<p><b>Tarikh Kompaun:</b>".$tkh1."</p>";
		echo"<p></p>";
		echo"<p><b>No.Akaun :</b>".$no_akaun."</p>";
		echo"<p></p>";
		echo"<p><b>No.Rujukan :</b>".$perkara4."</p>";
		echo"<p></p>";
		echo"<p><b>Jabatan :</b>".$jab."</p>";
		echo"<p></p>";
		echo"<p><b>Perihal :</b>".$perkara1."</p>";
		echo"<p></p>";
		echo"<p><b>Perkara :</b>".$perkara."&nbsp;".$sketer."</p>";
		echo"<p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>".$no_rujukan."</p>";
		echo"<p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>".$perkara5."</p>";
		echo"<p><b>Jumlah Perlu Dibayar :&nbsp;RM&nbsp;</b>"&FormatNumber(rb("amaun"),2)&"</p>";
		echo"<p>Tarikh:".$tkh." SALINAN KOMPAUN</p>";
		echo"<p></p>";
		echo"<p><b>Disediakan :&nbsp;".$nop."&nbsp;&nbsp;-&nbsp;&nbsp;".$nama."</b></p>";
		

?>
<body>
</body>
</html>