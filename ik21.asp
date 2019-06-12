<%response.cookies("ikmenu") = "ik21.asp"%>
<!-- '#INCLUDE FILE="ik.asp" -->
<%Response.Buffer = True%>
<html>
<head>
<title>i-Kompaun : Jenis Kesalahan</title>
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
function invalid_tarikh(b)
    {  
       alert (b+" Tarikh Salah !!! ");
		return(true);
    }
</script>
</head>
<% Set objConn = Server.CreateObject("ADODB.Connection")
   objConn.Open "dsn=12c;uid=majlis;pwd=majlis;"  %>
<form method="POST" action="ik21.asp">
 <table width="50%" cellpadding="1" cellspacing="5" class="hd">
  <tr> 
    <td class="hd">Akta / UUK</td>
          <td> 
            <select size="1" name="perkara" onChange="showpage(this.form);">
              <option SELECTED value="x">Pilihan Akta / UUK </option>
<%  kod = request.querystring("rujuk")
				  
   	f = " select kod, initcap(keterangan) as terang "
	f = f & " from kompaun.perkara "
	f = f & " where kod <> 'P01' "
	f = f & " order by kod "
   	Set objRsf = objConn.Execute(f)
	
	 do while not objRsf.EOF 
	 if kod <> "" and kod = objrsf("kod") then	%>
              <option selected value="ik21.asp?rujuk=<%=objrsf("kod")%>"><%=objRsf("kod")%> 
              == <%=objRsf("terang")%></option>
	<%else%>
	 <option value="ik21.asp?rujuk=<%=objrsf("kod")%>"><%=objRsf("kod")%> 
              == <%=objRsf("terang")%></option>
	<%  end if
	    objRsf.MoveNext
   	    loop		%>
	   </form>
  <%	objRsf.close
    	kod1 = Request.QueryString("rujuk")

 		if kod1 <> "" then
 		
 		Set objRse = Server.CreateObject("ADODB.Recordset")
 		e = "	select kod from kompaun.perkara where kod = '"& kod1 &"' order by kod "
 		Set objRse = objConn.Execute(e)
 		teks = objRse("kod")
%>
            </select>
          </td>
        </tr>
        <form>
          <tr> 
            <td class="hd">Kesalahan</td>
            <td> 
              <select size="1" name="rujukan" onChange="page(this.form);">
                <option>Kesalahan Bagi Akta&nbsp;&nbsp;<%=teks%></option>
 <%		kodz = request.querystring("rujuk1")
		 		 			
  		g = " select kod as kodz, initcap(keterangan) as terangs "
		g = g & " from kompaun.jenis_kesalahan "
		g = g & " where perkara = '"& kod1 &"' "
		g = g & " and perkara <> 'P01' "
		g = g & " order by kod "
   		Set objRsg = objConn.Execute(g)

		do while not objRsg.EOF 	
		if kodz <> "" and kodz = objRsg("kodz") then
		kodz = objRsg("kodz")	 %>
		 <option selected value="ik21.asp?rujuk=<%=kod1%>&rujuk1=<%=objRsg("kodz")%>"><%=objRsg("kodz")%> 
                == <%=objRsg("terangs")%></option>
		<% else %>
         
		 <option value="ik21.asp?rujuk=<%=kod1%>&rujuk1=<%=objRsg("kodz")%>"><%=objRsg("kodz")%> 
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
	kod11 = Request.QueryString("rujuk")  
	kod22 = Request.QueryString("rujuk1")	
	proses = Request.form("B1")
	tkh1 = Request.form("tkhdari")
  	tkh2 = Request.form("tkhhingga")		
	dkod = Request.form("dkod")
		
		
	t = " select '01'||to_char(sysdate,'mm')||to_char(sysdate,'yyyy') tkh1, to_char(sysdate,'ddmmyyyy') tkh2 from dual "
	Set objRst = Server.CreateObject ("ADODB.Recordset")
   	Set objRst = objConn.Execute(t)
	
	if tkh1 = "" then
	 tkh1 = objRst("tkh1")
	 tkh2 = objRst("tkh2")
	end if
	
	r = " select kod||' - '||initcap(keterangan) as perk, kod "
	r = r & " from kompaun.jenis_kesalahan where kod = '"& kod22 &"' "
	r = r & " and perkara = '"& code &"' "
	Set objRsr = Server.CreateObject ("ADODB.Recordset")
   	Set objRsr = objConn.Execute(r)
   	
   	if not objRsr.eof then
   		perk1 = objRsr("perk")
		vkod = objRsr("kod")
	end if		
%><form method="post" action="ik21.asp?rujuk=<%=kod1%>&rujuk1=<%=kodz%>">
        <tr> 
          <td class="hd">Tarikh Dari</td>
          <td> 
            <input type="text" name="tkhdari" value="<%=tkh1%>" size="8" maxlength="8">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hingga 
            <input type="text" name="tkhhingga" value="<%=tkh2%>" size="8" maxlength="8">
            <input type="submit" value="Cari" name="B1" class="button">
            <input type="hidden" name="kode" value="<%=vkod%>" >
            <input type="hidden" name="dkod" value="<%=perk1%>" >
            <%		end if		%>
          </td>
        </tr>
        <%	

			
	 if proses = "Cetak" then
		 response.redirect "ik21r.asp?tkh1="&tkh1&"&tkh2="&tkh2&"&kod11="&kod11&"&kod22="&kod22&""
    end if
	
	if proses = "Cari" then   		
%>
        <tr> 
          <td class="hd">Akta 
            / UUK</td>
          <td>: 
            <%=kod11%>&nbsp;&nbsp;<%=dkod%> &nbsp;&nbsp;&nbsp;&nbsp; 
            <input type="submit" value="Cetak" name="B1" class="button">
            </td>
        </tr>
      </table>
      <%		b = " select to_date('"&tkh1&"','ddmmyyyy') as tkha,"
		b = b & " to_date('"&tkh2&"','ddmmyyyy') as tkhb from dual "
		Set objRsb = Server.CreateObject ("ADODB.Recordset")
		Set objRsb = objConn.Execute(b)
		
		If objRsb.eof then
        	
      		response.write "<script language=""javascript"">"
       	response.write "var timeID = setTimeout('invalid_tarikh(""  "");',1) "
       	response.write "</script>"
       
       else
       	tkha = objRsb("tkha")
			tkhb = objRsb("tkhb") 
			
       	if tkhb < tkha then
       	response.write "<script language=""javascript"">"
       	response.write "var timeID = setTimeout('invalid_tarikh(""  "");',1) "
       	response.write "</script>"
       	
       	else
      						
		d = " select no_akaun, nama, perkara1,perkara2,alamat1,alamat2,alamat3,alamat4,to_char(tkh_masuk,'ddmmyyyy') as tkh_masuk, nvl(amaun,0) as amaun, "
		d = d & " to_char(tkh_bayar,'ddmmyyyy') as tkh_bayar, no_resit,jabatan "
		d = d & " from hasil.bil "
		d = d & " where perkara = '"&kod11&"' "
		d = d & " and no_rujukan2 like '%'||'"& kod22 &"'||'%' "
		d = d & " and (no_akaun like '76410'||'%' or no_akaun like '76420'||'%' or no_akaun like '76413'||'%' "
		''kompaun perbandaran-mimi-pn.raja
		d = d & " or no_akaun like '76412'||'%' or no_akaun like '76415'||'%' "
		'kompaun bangunan & veterinar
		d = d & " or no_akaun like '76101'||'%'or no_akaun like '76441'||'%') "
		'18042014 : jun tambah boleh papar kod 76413 jugak, sebelum ni 76410 & 76420 saja
		d = d & " and tkh_masuk between to_date('"& tkh1 &"','ddmmyyyy') "
		d = d & "	and to_date('"& tkh2 &"','ddmmyyyy')  " 
		'******************************************************************
		'ika tambah user view jabatan masing2.admin view semua (23/09/2016)
		admin = "select id from hasil.superadmin where id='"&pekz&"' "
		Set objRAdmin = objConn.Execute(admin)
		''response.Write(d)
		if objRAdmin.eof then
		
		lokasi = "select lokasi from payroll.paymas where no_pekerja='"&pekz&"' "
		Set objRLokasi = objConn.Execute(lokasi)
		
		lok = objRLokasi("lokasi")
		
		d = d & " and jabatan = '"& lok &"' "
		
		end if
		'end view ikut jabatan
		'******************************************************************
		''response.Write(d)
		Set objRs2 = objConn.Execute(d)
	
		if not objRs2.eof then
%><br>
 <table width="50%" cellpadding="1" cellspacing="5" class="hd1">
    <tr align="center"> 
          <td width="5%" class="hd1">Bil</td>
          <td width="15%" class="hd1">No 
            Kompaun</td>
          <td class="hd1" style="width: 22%">Nama</td>
          <td class="hd1" style="width: 22%">Alamat</td>
          <td width="35%" class="hd1">Tempat Kesalahan</td>
          <td width="10%" align="center"  class="hd1">Tarikh</td>
          <td width="10%" align="center"  class="hd1">Amaun</td>
          <td width="10%" align="center" class="hd1">Tkh 
            Bayar</td>
          <td width="10%" align="center" class="hd1">Resit</td>
          <td width="10%" align="center" class="hd1">Jabatan</td>
        </tr>
        <% 
   		bil = 0	
    	Do while not objRs2.EOF
    	bil = bil + 1
		ab = objRs2("amaun")
		total_ab = cdbl(total_ab) + cdbl(ab)
		kodJbtn = objRs2("jabatan")
		
		q1="select keterangan from payroll.ptj where kod='"&kodJbtn&"'"
		set rq1 = objConn.execute(q1)
		
		if not rq1.eof then namaJabatan = rq1("keterangan")
		
		alamat1=objRs2("alamat1")
		if alamat1 <> "" then
		lenAlamat1 = len(alamat1)
		al1 = mid(alamat1,lenAlamat1,1)
		
		
			if al1 <> "," then 
				alamat1 = alamat1 & "," 
			end if
		end if
		
		alamat2=objRs2("alamat2")
		if alamat2 <> "" then
		lenAlamat2 = len(alamat2)
		al2 = mid(alamat2,lenAlamat2,1)
		
			if al2 <> "," then 
				alamat2 = alamat2 & "," 
			end if
		end if	
		
		alamat3=objRs2("alamat3")
		if alamat3 <> "" then
		lenAlamat3 = len(alamat3)
		al3 = mid(alamat3,lenAlamat3,3)
		
		
			if al3 <> "," then 
				alamat3 = alamat3 & "," 
			end if
		end if
		
		alamat4=objRs2("alamat4")
		if alamat4 <> "" then
		lenAlamat4 = len(alamat4)
		al4 = mid(alamat4,lenAlamat4,1)
		
			if al4 <> "," then 
				alamat4 = alamat4 & "," 
			end if
		end if	

		
  %>
        <tr> 
          <td><%=bil%></td>
          <td><%=objRs2("no_akaun")%></td>
          <td style="width: 22%"><%=objRs2("nama")%></td>
           <td style="width: 22%"><%=alamat1%> &nbsp;<%=alamat2%>&nbsp; <%=alamat3%>&nbsp; <%=alamat4%></td>
          <td><%=objRs2("perkara1")%>&nbsp; <%=objRs2("perkara2")%></td>
          <td><%=objRs2("tkh_masuk")%></td>
          <td align="right"><%=FormatNumber(objRs2("amaun"),2)%></td>
          <td align="center"><%=objRs2("tkh_bayar")%></td>
          <td><%=objRs2("no_resit")%></td>
          <td><%=namaJabatan%></td>
        </tr>
        <%
  	objRs2.MoveNext			
  	Loop
 %>
  <tr>
 <td colspan="4" align="right"><b>Jumlah</b></td>
 <td align="right"><b>RM <%=FormatNumber(total_ab,2)%></b></td></tr>
  
      </table>
      <%		else	
 			response.write "<script language=""javascript"">"
       	response.write "var timeID = setTimeout('invalid_data(""  "");',1) "
       	response.write "</script>"
       	proses="Cari"
 %>
      <!--<form method="post" action="ik21r.asp"> 
<p align="center"><input type="submit" value="Cetak" name="B2" style="font-family: Verdana"></p>
 <input type="hidden" name="kode" value="<%'=kod11%>" >
 <input type="hidden" name="dkod" value="<%'=kod22%>" >
 <input type="hidden" name="tkhdari" value="<%'=tkh1%>">
 <input type="hidden" name="tkhhingga" value="<%'=tkh2%>">
</form> -->
      <%		
 		end if
		end if
 		end if
 		end if
%>
  </tr></form>
</table>
</body>
