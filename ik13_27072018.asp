<%response.cookies("ikmenu") = "ik13.asp"%>
<!-- '#INCLUDE FILE="ik.asp" -->
<%Response.Buffer = True%>
<html>
<head>
<title>i-Kompaun : Senarai ke Jabatan Undang2</title>
<META content="text/html; charset=iso-8859-1" http-equiv=Content-Type>
<link type="text/css" href="menu.css" REL="stylesheet">
<BODY leftMargin=0 onLoad="" topMargin=0 bgcolor="<%=color4%>">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>i-Kompaun : Senarai ke Jabatan Undang2</title>
<script language="javascript">
function invalid_post(a)
    {  
       alert (a+" Tiada Rekod ");
		return(true);
    }
function invalid_tarikh(b)
    {  
       alert (b+" Tarikh Salah !!! ");
		return(true);
    }    
</script>
</head> 
<form method="POST" action="ik13.asp">

<%'	Set objConn = Server.CreateObject("ADODB.Connection")
'   objConn.Open "dsn=12c;uid=majlis;pwd=majlis;"
   
   proses = Request.form("B1")
   tkh = Request.form("ftkh")
   
   if proses = "" then
   		f = " select to_char(sysdate,'ddmmyyyy') as tkhs from dual "
		Set objRsf = Server.CreateObject ("ADODB.Recordset")
   		Set objRsf = objConn.Execute(f)	
   		tkh = objRsf("tkhs")
	end if

%> 
 <table width="50%" cellpadding="1" cellspacing="5" class="hd">
  <tr> 
<td class="hd">
Tarikh Notis </td><td>
<input type="text" name="ftkh" size="8" value="<%=tkh%>" maxlength="8">&nbsp;
<input type="submit" value="CARI" name="B1" class="button"></td> </tr></table><br>
<%
  '********************************	PROSES UPDATE		********************************************
  
	
		if proses = "HANTAR" then
	
		bilcount = Request.form("bilrec")
		vtkh = Request.form("tkhs")
	
		for i = 1 to bilcount
		
			fpost = "fpost"+ cstr(i)
			fid = "frowid" + cstr(i)
		
			vpost = Request.form(""&fpost&"")	
			vrowid = Request.form(""&fid&"")

		if vpost = "M" then 	
			r = " update hasil.bil set post = '"&vpost&"', tarikh_post = to_date('"&vtkh&"', 'ddmmyyyy') "
			r = r & " where rowid = '"& vrowid &"' "
			Set objRs3 = Server.CreateObject ("ADODB.Recordset")
			Set objRs3 = objConn.Execute(r)	
		end if
		next		
		
		ff = " select to_char(round(to_date('"& tkh &"','ddmmyyyy') - 14 ),'ddmmyyyy') tkhs from dual "
		Set objRsff = Server.CreateObject ("ADODB.Recordset")
		Set objRsff = objConn.Execute(ff)
		tkhs = objRsff("tkhs")
			
		cari
	end if	
    
   '************************************ PROSES CARI *****************************************************
	
	if proses = "CARI" then
	'response.Write(proses)
		f = " select to_char(round(to_date('"& tkh &"','ddmmyyyy') - 14 ),'ddmmyyyy') tkhs from dual "
		Set objRsf = Server.CreateObject ("ADODB.Recordset")
		Set objRsf = objConn.Execute(f)
		
		if objRsf.eof then
			response.write "<script language=""javascript"">"
       	response.write "var timeID = setTimeout('invalid_tarikh(""  "");',1) "
       	response.write "</script>"     
		else 		
			tkhs = objRsf("tkhs")
			cari
	 	end if
	 end if



 '*************************************** SUB CARI ******************************************************
	  
	  
	  sub cari
	  response.Write(tkh)
		d = " select rowid, perkara, no_rujukan2, no_akaun, initcap(nama) nama,"
		d = d & " to_char(tarikh_post,'ddmmyyyy') as tarikh_post, post "
		d = d & " from hasil.bil "
		d = d & " where tarikh_post = to_date('"& tkh &"','ddmmyyyy') "
		d = d & " and amaun_bayar is null "
		'd = d & " and (no_akaun like '76410'||'%' or no_akaun like '76420'||'%') "
		'19032014 : jun tambah bagi akaun 76413 boleh tengok jugak
		d = d & " and (no_akaun like '76410'||'%' or no_akaun like '76420'||'%' or no_akaun like '76413'||'%') "
		d = d & " and (perkara <> 'P01' or perkara is null) "
		d = d & " and post = 'N' " 
		d = d & " and tarikh_notis3 is not null "
		d = d & " order by no_akaun "
		response.Write(d)
		Set objRs2 = Server.CreateObject ("ADODB.Recordset")
		Set objRs2 = objConn.Execute(d)
			
		
		
	 if objRs2.eof then 
			response.write "<script language=""javascript"">"
       	response.write "var timeID = setTimeout('invalid_post(""  "");',1) "
       	response.write "</script>"
     
	 else 		
%>

 <table width="50%" cellpadding="1" cellspacing="5" class="hd1">
    <tr align="center"> 
<td width="5%" class="hd1">Bil</td>
<td width="13%" class="hd1">Akta / UUK</td>
<td width="10%" class="hd1">Kesalahan</td>
<td width="15%" class="hd1">No Kompaun</td>
<td width="30%" class="hd1">Nama</td>
<td width="10%" class="hd1">Tarikh</td>
<td width="12%" class="hd1">Ke Jabatan Undang²</td>
</tr>
<% 	bil = 0	
  	
 	Do while not objRs2.EOF
   	bil = bil + 1
%> 
<tr>
<td align="center"><%=bil%>
<input type="hidden" name="frowid<%=bil%>" value="<%=objRs2("rowid")%>" ></td> 
<td align="center"><%=objRs2("perkara")%></td>
<td align="center"><%=objRs2("no_rujukan2")%></td>
<td  align="center"><%=objRs2("no_akaun")%></td>
<td align="center"><%=objRs2("nama")%></td>
<td align="center"><%=objRs2("tarikh_post")%></td>
<td align="center">
<input type="checkbox" name="fpost<%=bil%>" value='M'>&nbsp;</td> 
</tr>
<%		objRs2.MoveNext			
  		Loop
%> 
<tr>
<td colspan="7" align="center">
<input type="hidden" name="bilrec" value="<%=bil%>" >
<input type="hidden" name="tkhs" value="<%=tkh%>" align="right">
<input type="submit" value="HANTAR" name="B1" class="button">
</form>
<form method="post" action="ik13r.asp">
<input type="submit" value="CETAK" name="B1" class="button">
<input type="hidden" name="ftkh" value="<%=tkh%>">
</form>
</td>
</tr></table>
<%		
		end if
	end sub
%>

</body>