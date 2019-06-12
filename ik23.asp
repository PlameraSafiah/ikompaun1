<%response.cookies("ikmenu") = "ik23.asp"%>
<!-- '#INCLUDE FILE="ik.asp" -->
<%Response.Buffer = True%>
<html>
<head>
<title>i-Kompaun : Jenis Kesalahan & Tahun</title>
<META content="text/html; charset=iso-8859-1" http-equiv=Content-Type>
<link type="text/css" href="menu.css" REL="stylesheet">
<BODY leftMargin=0 onLoad="" topMargin=0 bgcolor="<%=color4%>">

<script language="JavaScript">
	function showpage(form)
	{ var item = form.perkara.selectedIndex; choice = form.perkara.options[item].value; if (choice!="x") top.location.href=""+(choice); };
</script>

<script language="JavaScript">
	function page(form)
	{ var item = form.rujukan.selectedIndex; choice = form.rujukan.options[item].value; if (choice!="x") top.location.href=""+(choice); };
</script>

<script language="javascript">
function invalid_data(a)
    {  
       alert (a+" Tiada Maklumat ");
		return(true);
    }
function invalid_tahun(b)
    {  
       alert (b+" Masukkan Tahun !!! ");
		return(true);
    }
</script>
</head>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top"> 
<td width="100%">

<form method="POST" action="ik23.asp">

<%	Set objConn = Server.CreateObject("ADODB.Connection")
   objConn.Open "dsn=12c;uid=majlis;pwd=majlis;"
   	
   	proses = Request.form("B1")
	kod2 = Request.form("kode")
	dkod = Request.form("dkod")
      	
%>

<form method="POST" action="ik23.asp">
 
 <table width="50%" cellpadding="1" cellspacing="5" class="hd">
  <tr> 
    <td class="hd">Akta / UUK</td>
<td>
            <select size="1" name="perkara" onChange="showpage(this.form);">
              <option SELECTED value="">Pilihan Akta / UUK </option>
<%  kod = request.querystring("rujuk")
				  
   	f = " select kod, initcap(keterangan) as terang "
	f = f & " from kompaun.perkara "
	f = f & " where kod <> 'P01' "
	f = f & " order by kod "
   	Set objRsf = objConn.Execute(f)
	
	 do while not objRsf.EOF 
	 if kod <> "" and kod = objrsf("kod") then	%>
              <option selected value="ik23.asp?rujuk=<%=objrsf("kod")%>"><%=objRsf("kod")%> 
              == <%=objRsf("terang")%></option>
	<%else%>
	 <option value="ik23.asp?rujuk=<%=objrsf("kod")%>"><%=objRsf("kod")%> 
              == <%=objRsf("terang")%></option>
	<%  end if
	    objRsf.MoveNext
   	   loop								%>
	   </form>
<%		objRsf.close	%> 	

<%		kod1 = Request.QueryString("rujuk")
 		code = kod1

 		if kod1 <> "" then
 		
 		Set objRse = Server.CreateObject("ADODB.Recordset")
 		e = "	select kod from kompaun.perkara where kod = '"& code &"' order by kod "
 		Set objRse = objConn.Execute(e)
 		teks = objRse("kod")
%>	    
</select></td> 
</tr>
<form>
          <tr> 
            <td class="hd">Kesalahan</td>
            <td> 
              <select size="1" name="rujukan" onChange="page(this.form);">
                <option>Kesalahan Bagi Akta&nbsp;&nbsp;<%=teks%></option>
     <%	 kodz = request.querystring("rujuk1")
		 		 			
  		g = " select kod as kodz, initcap(keterangan) as terangs "
		g = g & " from kompaun.jenis_kesalahan "
		g = g & " where perkara = '"& kod1 &"' "
		g = g & " and perkara <> 'P01' "
		g = g & " order by kod "
   		Set objRsg = objConn.Execute(g)

		do while not objRsg.EOF 				
		if kodz <> "" and kodz = objRsg("kodz") then
		kodz = objRsg("kodz")	 %>
		 <option selected value="ik23.asp?rujuk=<%=kod1%>&rujuk1=<%=objRsg("kodz")%>"><%=objRsg("kodz")%> 
                == <%=objRsg("terangs")%></option>
		<% else %>
         
		 <option value="ik23.asp?rujuk=<%=kod1%>&rujuk1=<%=objRsg("kodz")%>"><%=objRsg("kodz")%> 
                == <%=objRsg("terangs")%></option>
        <%	end if
		objRsg.MoveNext
	    loop					
	    objRsg.close
	kodz = Request.QueryString("rujuk1")			%>
              </select>
            </td>
          </tr>
        </form>
<%	
	t = " select to_char(sysdate,'yyyy') tahun from dual "
	Set objRst = Server.CreateObject ("ADODB.Recordset")
   	Set objRst = objConn.Execute(t)
	tahun = objRst("tahun")
	

	if proses = "Cari" then
		tahun = Request.form("tahun")
	else
		kod2 = Request.QueryString("rujuk1")	
		rujuk2 = kod2
	end if
	
	
	r = " select kod||' - '||initcap(keterangan) as perk, kod "
	r = r & " from kompaun.jenis_kesalahan where kod = '"& rujuk2 &"' "
	r = r & " and perkara = '"& code &"' "
	Set objRsr = Server.CreateObject ("ADODB.Recordset")
   	Set objRsr = objConn.Execute(r)
   	
   	if not objRsr.eof then
   		perk1 = objRsr("perk")
		vkod = objRsr("kod")
	end if	
	
	%>
<form method="post" action="ik23.asp?rujuk=<%=kod1%>&rujuk1=<%=kodz%>">
<tr >
<td class="hd">Tahun</td>
<td>
<input type="text" name="tahun" value="<%=tahun%>" size="10" maxlength="4">
<input type="submit" value="Cari" name="B1" class="button">
<input type="submit" value="Cetak" name="B1" class="button">
<input type="hidden" name="kode" value="<%=vkod%>" >
<input type="hidden" name="dkod" value="<%=perk1%>" >
<%		end if		%>
</td>
</form>

<form >


<%
	
       dkod = Request.form("dkod")
	   ko21 = Request.form("kod1")
		kod1 = Request.QueryString("rujuk")
		kod11 = kod1
		kod2 = Request.form("kode")
		rujuk2 = kod2
		tahun = Request.form("tahun")
		
'response.write tahun
'response.write kod11
'response.write "<p>koda"&kodz&"</p>"

	 if proses = "Cetak" then
		 response.redirect "ik23r.asp?tahun="&tahun&"&kod11="&kod11&"&kod2="&kodz&""
    end if

	if proses = "Cari" then
		
		
		if tahun = "" then
			response.write "<script language=""javascript"">"
       	response.write "var timeID = setTimeout('invalid_tahun(""  "");',1) "
       	response.write "</script>"
      		proses = "Cari"
      		
		else
		
%>  
<tr>
<td class="hd">Akta / UUK:</td>
<td><%=kod11%>&nbsp;&nbsp;<%=dkod%></td>
</tr></table>
<%	
		d = " select perkara, no_rujukan2, nvl(sum(amaun_bayar),0) as amaunb, "
		d = d & " count(rowid) as rekod, count(amaun_bayar) as sudah "
		d = d & " from hasil.bil "
		d = d & " where perkara = '"&kod11&"' "
		d = d & " and no_rujukan2 like '%'||'"& rujuk2 &"' "
		d = d & " and to_char(tkh_masuk,'yyyy') = '"& tahun &"' "
		d = d & " and (no_akaun like '76410'||'%' or no_akaun like '76420'||'%' or no_akaun like '76413'||'%' "
		''kompaun perbandaran
		d = d & " or no_akaun like '76412'||'%' or no_akaun like '76415'||'%' "
		'kompaun bangunan & veterinar
		d = d & " or no_akaun like '76101'||'%') "
		'18042014 : jun tambah boleh papar kod 76413 jugak, sebelum ni 76410 & 76420 saja
		'******************************************************************
		'ika tambah user view jabatan masing2.admin view semua (23/09/2016)
		admin = "select id from hasil.superadmin where id='"&pekz&"' "
		Set objRAdmin = objConn.Execute(admin)
		
		if objRAdmin.eof then
		
		lokasi = "select lokasi from payroll.paymas where no_pekerja='"&pekz&"' "
		Set objRLokasi = objConn.Execute(lokasi)
		
		lok = objRLokasi("lokasi")
		
		d = d & " and jabatan = '"& lok &"' "
		
		end if
		'end view ikut jabatan
		'******************************************************************

		d = d & " group by perkara, no_rujukan2 "
		d = d & " order by perkara, no_rujukan2 "
		Set objRs2 = Server.CreateObject ("ADODB.Recordset")
		Set objRs2 = objConn.Execute(d)
	
		if not objRs2.eof then 
%>
 <table width="50%" cellpadding="1" cellspacing="5" class="hd1">
    <tr align="center"> 
<td width="5%"  class="hd1">Bil</td>
<td width="11%" class="hd1">Akta / UUK</td>
<td width="16%" class="hd1">Jenis Kesalahan</td>
<td width="14%" class="hd1">Amaun Bayar</td>
<td width="10%" class="hd1">Rekod</td>
<td width="14%" class="hd1">Sudah Bayar</td>
<td width="15%" class="hd1">Belum Bayar</td>
</tr>
<% 
   		bil = 0
   		belum = 0
   			
    	Do while not objRs2.EOF
    	
    	rekod = objRs2("rekod")
    	sudah = objRs2("sudah")
    	
    	belum = cdbl(rekod) - cdbl(sudah)
    	bil = bil + 1
%> 

 <tr align="center">
<td><%=bil%></td>
<td><%=objRs2("perkara")%></td>
<td><%=objRs2("no_rujukan2")%></td>
<td><%=FormatNumber(objRs2("amaunb"),2)%>&nbsp;&nbsp;</td>
<td><%=objRs2("rekod")%></td>
<td><%=objRs2("sudah")%></td>
<td><%=belum%></td>
</tr>
<% 	objRs2.MoveNext			
  	Loop					%> 

</table>

<%	else  	
		response.write "<script language=""javascript"">"
       response.write "var timeID = setTimeout('invalid_data(""  "");',1) "
       response.write "</script>"
       proses = "Cari"

		end if
 		end if	
 		end if		 %> 

</form>

</td>
</tr>
</table>

</body>
</html>