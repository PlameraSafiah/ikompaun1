<%response.cookies("ikmenu") = "ik11_edit.asp"%>
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



<%
    proses = Request.Form("B1")
	proses1 = Request.Form("B2")
	proses2 = Request.Form("B3")
	proses4 = request.form("B4")


	ikmenu = request.cookies("ikmenu")	
	
    gnop = 	request.cookies("gnop")

	h = " select lpad('"&gnop&"',5,0)gnop from dual "
    set sh = objconn.execute(h)
	gnop = sh("gnop")	

'response.Write("test ik_edit") 
noakaun = request.QueryString("noakaun")
'response.Write noakaun

s = " 	  select rowid, no_rujukan, upper(perkara4) perkara4, upper(perkara5) perkara5, upper(nama) nama, "
	s = s & " upper(alamat1) alamat1, upper(alamat2) alamat2, upper(alamat3) alamat3, kp, "
	s = s & " to_char(tkh_lahir,'ddmmyyyy') tkh_lahir,perkara, no_rujukan2, "
	s = s & " to_char(tkh_masuk,'ddmmyyyy') tkh_masuk,amaun,tkh_bayar,no_resit, "
	s = s & " to_char(masa) masa, upper(perkara1) perkara1, upper(perkara2) perkara2, tred, jenis, no_pekerja, parlimen,daerah,dun,kod_ternakan "
	s = s & " from hasil.bil "
	s = s & " where no_akaun = '"& noakaun &"' "
	s = s & " and (perkara <> 'P01' or perkara is null) "
	'response.write "Papar" & (s) & "<br>"
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
			
			ftkh_bayar = gq("tkh_bayar")
			fno_resit = gq("no_resit")
					
		end if  	


	if proses1 = "Kembali" then 
		response.Redirect"ik11.asp"
	end if 



	if proses = "Cetak Salinan" then
	response.cookies("dac") = Request.Form("rowid")
	
		If InStr(1, Request.ServerVariables("HTTP_USER_AGENT"), "MSIE") then
			response.redirect"ik11c.asp"
		else
			response.redirect"ik11_firefox.asp"
		end if
	end if
	
	
%>
<body>

<form name=myForm method="POST" action="ik11_edit.asp" onSubmit="return check(this)"  >

<% if ftkh_bayar <> "" then                         %>
<table width="60%" cellpadding="1" cellspacing="5" class="hd">
<tr><td align="center"><font size="2" color="red"> Kompaun telah dijelaskan pada <u><%=ftkh_bayar%></u>. No resit : <u><%=fno_resit%> </u></font> </td></tr></table>

<% end if %>


<table width="50%" cellpadding="1" cellspacing="5" class="hd">

        <tr> 
          <td class="hd">No.Kompaun</td>
          <td><input type="hidden" value="<%=noakaun%>" name="noakaun" readonly ><b><%=noakaun%></b>
          <input type="hidden" value="<%=rowid%>" name="rowid" >
          </td>
    <%
          zv1 = "select kod,UPPER(keterangan) as terang from kompaun.perkara where kod = '"& fakta &"' and kod <> 'P01' "
     Set rszv1 = objConn.Execute(zv1) 
	%>
    
        <tr> 
          <td class="hd">Akta / UUK</td>
          <td><%=fakta%> - <%=rszv1("terang")%>  </td>
        </tr>
        
      <%   '--------------new
     zv2 = "select kod,UPPER(keterangan) as terang from kompaun.jenis_kesalahan where perkara = '"&fakta&"' and kod = '"& fsalah &"' "
     Set rszv2 = objConn.Execute(zv2) 
	%>    
       <tr> 
          <td class="hd">Butir Kesalahan</td>
            <td><%=fsalah%> - <%=rszv2("terang")%> </td>
        </tr>
 
 			<%   '--------------new ternakan
			
			
			
     		 zv6 = "select kod,UPPER(keterangan) as terang from hasil.jenis_ternakan where kod = '"&fternakan&"' order by kod"
    		 Set rszv6 = objConn.Execute(zv6) 
				%>
         <tr> 
          <td class="hd">Jenis Ternakan</td>
            <td><% if fternakan <> "" then %> <%=fternakan%> - <%=rszv6("terang")%> <% else %> - <% end if %></td>
        </tr>
        
  
    <tr> 
          <td class="hd">Nama</td>
          <td> <%=fnama%></font>
         </td>
        </tr>
        
          
          
             
<tr>
<td rowspan="7" class="hd"> Alamat </td> 
    <tr> 
          <td><%=falamat1%></td>
    </tr>
        <tr> 
          <td><%=falamat2%> </td>
        </tr>
        <tr> 
          <td> <%=falamat3%></td>
        </tr>

    <td >DAERAH &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:

           <% 
		   
		  
		   if fdaerah = "SPU" then
		  		 namadaerah = "SEBERANG PERAI UTARA"
		   elseif fdaerah = "SPT" then
		  		 namadaerah = "SEBERANG PERAI TENGAH"
		   elseif fdaerah = "SPS" then
		  		 namadaerah = "SEBERANG PERAI SELATAN"
		   end if  
		   %>
          <% if fdaerah <> "" then %> <%=namadaerah%> &nbsp;&nbsp;( <%=fdaerah%> ) <% else %> - <% end if %>
           
      </td>
    </tr>  
    
	 <%   '--------------new parlimen
     zv = "select DISTINCT a.kod, a.keterangan,b.parlimen,b.daerah from hasil.parlimen a, hasil.kawasan b"
	 zv = zv & " where b.daerah = '"&fdaerah&"' and a.kod = b.parlimen order by kod  "
     Set rszv = objConn.Execute(zv) 
	 
	%>
    <tr>
      <td >PARLIMEN &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : <% if fparlimen <> "" then %> <%=fparlimen%> - <%=rszv("keterangan")%> <% else %> - <% end if %>
 </td>
    </tr>
    
    

       <% 
		''-----------------new dun
		 zv = " select kod,UPPER(dun) ket from hasil.kawasan "
         zv = zv & "where daerah = '"& fdaerah &"' and parlimen = '"& fparlimen &"' order by kod" 
         Set rszv = objConn.Execute(zv)
		 %>
      
    <tr>  
      <td >DUN &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:  <% if fdun <> "" then %> <%=fdun%> - <%=rszv("ket")%>  <% else %> - <% end if %>    </td>
    </tr>

 
<tr> 
          <td class="hd">No Fail</td>
          <td> <%=fperkara4%>
	</td>
        </tr>
        <tr>
          <td class="hd">No Sykt / Daftar</td>
          <td> <%=fperkara5%></td>
        </tr>

       
        
        <tr> 
          <td  class="hd">No K/P</td>
          <td> <%=fkp%></td>
        </tr>
       
  
  
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
          <td> <%=ftkh_masuk%></td>
            </tr>
            <tr>
          <td class="hd">Waktu</td>
          <td><%=waktu1%> &nbsp;
		     <%if waktu1 < 13 then%> AM <%end if%>
             <%if waktu1 > 12 then%> PM <%end if%>
             </td>
        </tr>
        <tr> 
          <td class="hd">Tempat</td>
          <td> <%=fperkara1%></td>
        </tr>
        <tr> 
          <td  class="hd">&nbsp;</td>
          <td><%=fperkara2%></td>
        </tr>
        
        <%
		
		gg = " select kod, UPPER(keterangan) as terang from lesen.tred where kod = '"& ftred &"' order by kod "
    	Set objRsgg = objConn.Execute(gg) 
		
		%>
        <tr> 
          <td  class="hd">Jenis Tred</td>
          <td> <% if ftred <> "" then %> <%=objRsgg("terang")%> <% else %> - <% end if %> </td>
        </tr>
        
        <%
		
		if fjenis = "1" then
		namajenis = "INDIVIDU"
		elseif fjenis = "2" then
		namajenis = "PERNIAGAAN" 
		elseif fjenis = "3" then
		namajenis = "INDUSTRI"
		end if 
		
		%>
        <tr> 
          <td  class="hd">Jenis 
            Kompaun</td>
          <td> <% if fjenis <> "" then %> <%=namajenis%> <% else %> - <% end if %></td>
        </tr>
        
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
  
        <tr> 
          <td class="hd">Pengeluar Kompaun</td>
          
          <td> <%=fno_pekerja%> - <%=napek%></td>
        </tr>
        <tr>
          <td  class="hd">Amaun</font></b></td>
          
        <td>RM <%=famaun%></td>
        </tr>
        
        <tr> 
          <td  class="hd" colspan="2" align="center"> 
          <input type="submit" name="B2" value="Kembali"  class="button" > &nbsp;&nbsp;&nbsp;
          <input type="submit" value="Cetak Salinan" name="B1" class="button2">
        </td>
        </tr>
      </table>



</form>
</body>
</html>
