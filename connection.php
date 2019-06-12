
<?php

	//$conn = "(DESCRIPTION =(ADDRESS_LIST =(ADDRESS = (PROTOCOL = TCP)(HOST = localhost)(PORT = 1521)))(CONNECT_DATA =(SERVICE_NAME = 12c)))";
	//$conn = oci_connect('majlis', 'majlis', '(DESCRIPTION =(ADDRESS = (PROTOCOL = TCP)(HOST = 0.0.0.0)(PORT = 1521))(CONNECT_DATA = (SID = MPSP)))');
	$conn = oci_connect('majlis', 'majlis', 'localhost/12c');
	//$conn = oci_connect('majlis', 'majlis', '10.10.1.90/12c');


  

?>

