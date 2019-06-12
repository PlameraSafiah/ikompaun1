<html>
<head>
<title></title>
</head>
<script language="javascript">
function invalid_amn(d)
    {  
       alert (d+" Sila Masukkan Amaun Bayar !!!");
    history.back(-1);
		return(true);
      
    }
</script>
<body topmargin="0" leftmargin="0" >
<%	
	Set objConn = Server.CreateObject ("ADODB.Connection")
  	ObjConn.Open "dsn=12c;uid=majlis;pwd=majlis;"
  	 
 	bil = Request.QueryString("bil")
	nop = Request.Cookies("gnop")
	akaune=request.Cookies("dac")
	response.Write"akaune" &akaune
  if akaune="" then	akaune = Request.form("akaunz")
	        		
   			   d = " select initcap(nama) nama,lpad(no_pekerja,5,0)nop from payroll.paymas where no_pekerja = '"&nop&"' "
        	   Set objRs2 = objConn.Execute(d)        		 		
        		
        		if not objRs2.eof then
        			nama = objRs2("nama")
				nop = objRs2("nop")
        		else
        			nama = Request.Cookies("gnop")
				end if

		
		b3 = "select a.rowid,a.no_akaun,a.nama,a.alamat1,a.alamat2,a.alamat3,a.kategori,to_char(a.tkh_masuk,'dd/mm/yyyy') as tkh1,a.no_rujukan2,a.perkara, "
		b3 = b3 & " initcap(a.perkara1)||lower(a.perkara2) perkara1,initcap(a.perkara3) perkara3,to_char(sysdate,'dd/mm/yyyy') tkh , "
		b3 = b3 & " initcap(a.perkara4) perkara4,initcap(a.perkara5) perkara5,a.jabatan,a.no_rujukan,nvl(a.amaun,0) amaun,a.akaun,a.siri,initcap(b.keterangan) as jab "
		b3 = b3 & " from hasil.bil a,iabs.jabatan b where a.jabatan = b.kod and a.no_akaun = '"& akaune &"' "
		'response.Write("<br>")
		'response.Write(b3)
		Set rb = objConn.Execute(b3)
		if not rb.eof then
                 amn=rb("amaun")
                 if amn="0" then
 						response.write "<script language=""javascript"">"
        				response.write "var timeID = setTimeout('invalid_amn("" "");',1) "
       					response.write "</script>"  

                  else

		salah=rb("no_rujukan2")
		akta=rb("perkara")
		k2 = "		  select initcap(keterangan) sketer from kompaun.jenis_kesalahan "
  		k2 = k2 & " where perkara = '"&akta&"' and kod = '"&salah&"' "
		'response.Write(k2)
  		Set objk2 = objConn.Execute(k2)
 				if not objk2.eof then	  				sketer = objk2("sketer")
		response.write"<p>&nbsp;</p>"
		response.write"<p>&nbsp;</p>"
		response.write"<p>&nbsp;</p>"
		response.write"<p>&nbsp;</p><br><br>"
		response.write"<p>&nbsp;&nbsp;&nbsp;"&rb("nama")&"<br>"
		response.write"&nbsp;&nbsp;&nbsp;"&rb("alamat1")&"<br>"
		response.write"&nbsp;&nbsp;&nbsp;"&rb("alamat2")&"<br>"
		response.write"&nbsp;&nbsp;&nbsp;"&rb("alamat3")&"</p></br>"
		response.write"<p>&nbsp;</p>"
		response.write"<p><b>Tarikh Kompaun:</b>"&rb("tkh1")&"</p>"
		response.write"<p></p>"
		response.write"<p><b>No.Akaun :</b>"&rb("no_akaun")&"</p>"
		response.write"<p></p>"
		response.write"<p><b>No.Rujukan :</b>"&rb("perkara4")&"</p>"
		response.write"<p></p>"
		response.write"<p><b>Jabatan :</b>"&rb("jab")&"</p>"
		response.write"<p></p>"
		response.write"<p><b>Perihal :</b>"&rb("perkara1")&"</p>"
		response.write"<p></p>"
		response.write"<p><b>Perkara :</b>"&rb("perkara")&"&nbsp;"&sketer&"</p>"
		response.write"<p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>"&rb("no_rujukan")&"</p>"
		response.write"<p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>"&rb("perkara5")&"</p>"
		response.write"<p><b>Jumlah Perlu Dibayar :&nbsp;RM&nbsp;</b>"&FormatNumber(rb("amaun"),2)&"</p>"
		response.write"<p>Tarikh:"&rb("tkh")&" SALINAN KOMPAUN</p>"
		response.write"<p></p>"
		response.write"<p><b>Disediakan :&nbsp;"&nop&"&nbsp;&nbsp;-&nbsp;&nbsp;"&nama&"</b></p>"
	%>
<table width="90%">
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td width="14%"><%=rb("kategori")%>&nbsp;</td>
    <td width="75%"><%=rb("nama")%></td>
    <td width="11%">&nbsp;</td>
  </tr>
  <tr> 
    <td width="14%">&nbsp;</td>
    <td width="75%"><%=rb("alamat1")%></td>
    <td width="11%">&nbsp;</td>
  </tr>
  <tr> 
    <td width="14%">&nbsp;</td>
    <td width="75%"><%=rb("alamat2")%>&nbsp;</td>
    <td width="11%"></td>
  </tr>
  <tr> 
    <td width="14%">&nbsp;</td>
    <td width="75%"><%=rb("alamat3")%>&nbsp;</td>
    <td width="11%"></td>
  </tr>
  <tr> 
    <td width="14%">&nbsp;</td>
    <td width="75%">No.Rujukan : <%=rb("perkara4")%></td>
    <td width="11%">&nbsp;</td>
  </tr>
  <tr> 
    <td width="14%"></td>
    <td width="75%">Jumlah Perlu Dibayar : <%=FormatNumber(rb("amaun"),2)%></td>
    <td width="11%"></td>
  </tr>
  <tr> 
    <td width="14%" height="22">&nbsp;</td>
    <td width="75%" height="22"><%=rb("no_akaun")%>&nbsp;&nbsp; <%=rb("tkh1")%> 
      &nbsp;&nbsp;<%=rb("jabatan")%>- <%=rb("kategori")%></td>
    <td width="11%" height="22">&nbsp;</td>
  </tr>
  <tr> 
    <td width="14%">&nbsp;Disediakan :</td>
    <td width="75%"><%=nop%>-<%=nama%></td>
    <td width="11%">&nbsp;</td>
  </tr>
</table>	
<%	end if
	end if		%>
</body>
</html>