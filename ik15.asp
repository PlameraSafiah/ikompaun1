<%response.cookies("ikmenu") = "ik15.asp"%>
<!-- '#INCLUDE FILE="ik.asp" -->
<%Response.Buffer = True%>
<html>
<head>
<title>i-Kompaun : Kemaskini Bayaran</title>
<META content="text/html; charset=iso-8859-1" http-equiv=Content-Type>
<link type="text/css" href="menu.css" REL="stylesheet">
<BODY leftMargin=0 onLoad="" topMargin=0 bgcolor="<%=color4%>">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<SCRIPT LANGUAGE="JavaScript">
<!-- Begin
nextfield = "no_rujukan";
netscape="";
ver=navigator.appVersion; len=ver.length;
for(iln=0;iln<len;iln++)if(ver.charAt(iln)=="(")break;
netscape=(ver.charAt(iln+1).toUpperCase()!="C");

function keyDown(DnEvents){
k=(netscape)?DnEvents.which:window.event.keyCode;
if(k==13){
if(nextfield=='done')return true;
else{
eval('document.myform.'+nextfield+'.focus()');
return false;
		}
	}
}
document.onkeydown=keyDown;
if(netscape)document.captureEvents(Event.KEYDOWN|Event.KEYUP);
//End -->
</script>
<script language="javascript">
function invalid_rujukan(a)
    {  
       alert (a+" No Kompaun Salah !!! ");
		return(true);
    }
function invalid_batal(b)
    {  
       alert (b+" Kompaun Telah Dibatalkan !!! ");
		return(true);
    }
function invalid_tarikh(c)
	{
		alert (c+" Tarikh Salah !!! ");
		return(true);
	}
function invalid_rujuk(d)
    {  
       alert (d+" Masukkan No Kompaun Semula!! ");
		return(true);
    }
function invalid_resit(e)
    {  
       alert (e+" Masukkan No Resit !!! ");
		return(true);
    }
function invalid_amaun(f)
    {  
       alert (f+" Masukkan Amaun Bayar !!! ");
		return(true);
    }
function invalid_tkh(g)
    {  
       alert (g+" Masukkan Tarikh Bayar !!! ");
		return(true);
    }
function invalid_kara1(h)
    {  
       alert (h+" Masukkan No Pendaftaran !!! ");
		return(true);
    }
</script>
</head>

<%response.cookies("amenu") = "ik15.asp"%>
<form name=myform method="POST" action="ik15.asp"> 
<%	
	'Set objConn = Server.CreateObject("ADODB.Connection")
'   objConn.Open "dsn=12c;uid=majlis;pwd=majlis;"
      
	b1 = Request.form("B1")
	b1save = Request.form("b1save")
	b1reset = Request.form("b1reset")
	kompaun = ucase(Request.form("kompaun"))
    kereta = ucase(Request.form("kereta"))
	
	if b1save = "Save" then b1 = "Save"
	if b1reset = "Reset" then b1 = "Reset"

  '************************************ PROSES RESET *****************************************************
  
	if b1 = "Reset" then
		response.redirect "ik15.asp"
	end if	
	
  '*********************************	PROSES SAVE **********************************************************
  if b1 = "Save" then
  
     resit = ucase(Request.form("resit"))
     amaun_bayar = Request.form("amaun_bayar")
     tbayar = Request.form("tbayar")
     rowid = Request.form("rowid")
     
     if resit = "" then
        mula
        papar
        response.write "<script language=""javascript"">"
        response.write "var timeID = setTimeout('invalid_resit(""  "");',1) "
        response.write "</script>"
        response.end
     end if
     
     if amaun_bayar = "" then
        mula
        papar
        response.write "<script language=""javascript"">"
        response.write "var timeID = setTimeout('invalid_amaun(""  "");',1) "
        response.write "</script>"      	
        response.end
     end if
     
     if tbayar = "" then
        mula
        papar
        response.write "<script language=""javascript"">"
        response.write "var timeID = setTimeout('invalid_tkh(""  "");',1) "
        response.write "</script>"      	
        response.end
     end if
     
     y =     "select to_date(to_char(sysdate,'ddmmyyyy'),'ddmmyyyy') tkhs, "
     y = y & "       to_date('"& tbayar &"','ddmmyyyy') tkh2s from dual "
     Set objRsy = objConn.Execute(y)
     
     if objRsy.eof then 
        mula
        papar
        response.write "<script language=""javascript"">"
        response.write "var timeID = setTimeout('invalid_tarikh(""  "");',1) "
        response.write "</script>"
        response.end
     else
        tkhs = objRsy("tkhs")
        tkh2s = objRsy("tkh2s")
        
        if tkh2s > tkhs then
           mula
           papar
           response.write "<script language=""javascript"">"
           response.write "var timeID = setTimeout('invalid_tarikh(""  "");',1) "
           response.write "</script>"
           response.end
        else
           h =     "update hasil.bil "	
           h = h & "   set no_resit = '"& resit &"', "
           h = h & "       amaun_bayar = '"& amaun_bayar &"',tkh_bayar = to_date('"& tbayar &"','ddmmyyyy') "
           h = h & " where rowid = '"& rowid &"' "
           Set Rsh = objConn.Execute(h)
           
           mula
           papar
        end if
     end if
  end if
	
	
'*******************************	PROSES CARI	*****************************************************
  if b1 = "Cari" then
   kmp=mid(kompaun,1,5)
   'if kompaun <> "" and (kmp = "76420" or kmp = "76410" or kmp = "76413") then
     if kompaun = ""   then
        mula
        response.write "<script language=""javascript"">"
        response.write "var timeID = setTimeout('invalid_rujuk(""  "");',1) "
        response.write "</script>"
        response.end
     else
		'w = "select substr('"& kereta &"',1,instr('"& kereta &"',' ',1,1)-1)|| "
       ' w = w & " substr('"& kereta &"',instr('"& kereta &"',' ',-1,1)+1,10) kereta from dual "
        'Set Rsw = objConn.Execute(w)     
       ' kereta = rsw("kereta")
		
       ' sk = "select 'x' from hasil.bil where no_rujukan = '"& kompaun &"' "
		'sk = sk & " and perkara1 = '"&kereta&"' and perkara = 'P01' "
       ' Set rssk = objConn.Execute(sk)

       ' if rssk.eof then
          ' mula
          ' response.write "<script language=""javascript"">"
          ' response.write "var timeID = setTimeout('invalid_rujukan(""  "");',1) "
          ' response.write "<//script>"
          ' response.end
        'end if
        	
        n = "select no_resit from hasil.bil where no_rujukan = '"& kompaun &"' and no_resit = 'BATAL' "
        Set Rsn = objConn.Execute(n)
        
        if not Rsn.eof then
           mula
           response.write "<script language=""javascript"">"
           response.write "var timeID = setTimeout('invalid_batal(""  "");',1) "
           response.write "</script>"
           response.end
        else 	
           mula
		   if kmp = "76420" then
           papar
		   elseif kmp = "76410" then
		   papar
		   else
		   response.write "<script language=""javascript"">"
           response.write "var timeID = setTimeout('invalid_rujuk(""  "");',1) "
           response.write "</script>"
           response.end
		   end if
        end if
     end if
  end if
 
			
'==================================================================================================			
  if b1 = "" then
     mula
  end if

'==================================================================================================			
sub mula %>
 <table width="50%" cellpadding="1" cellspacing="5" class="hd">
  <tr> 
    <td class="hd">No 
        Kompaun</td><td> &nbsp;
        <input type="text" name="kompaun" value="<%=kompaun%>" size="13" maxlength="12"  onFocus="nextfield='B1';">&nbsp;
        <input type="submit" value="Cari" name="B1" onFocus="nextfield='done';" class="button">
    </td>
  </tr>
  <script>
	document.myform.kompaun.focus();
  </script>
</table>
<!--<p align="center"><font size="2" face="Verdana"><b>No Kompaun</b> </font> 
<input type="text" name="kompaun" value="<%=kompaun%>" size="11" maxlength="11"  onFocus="nextfield='B1';">
<input type="submit" value="Cari" name="B1" onFocus="nextfield='done';" style="font-family: Verdana"></p>-->

<%end sub			

'==================================================================================================			
sub papar

  d =     "select rowid,perkara1, no_rujukan2, no_resit,to_char(tkh_masuk,'dd/mm/yyyy') tmasuk,"
  d = d & "       nvl(amaun_bayar,0) amaun_bayar, to_char(tkh_bayar,'ddmmyyyy') tbayar "
  d = d & "  from hasil.bil "
  d = d & " where no_akaun = '"& kompaun &"' and nvl(perkara,'0') <> 'P01'  "
  Set Rsd = objConn.Execute(d)
  
  if not Rsd.eof then
     kereta = Rsd("perkara1")
     resit = Rsd("no_resit")
     tmasuk = rsd("tmasuk")
     amaun_bayar = Rsd("amaun_bayar")
     tbayar = Rsd("tbayar")	
     jsalah = rsd("no_rujukan2")
     rowid = rsd("rowid")
     
     njsalah = ""
     if jsalah <> "" then
     
        j =     "select initcap(keterangan) terang from kompaun.jenis_kesalahan "
        j = j & " where kod = '"& jsalah &"'  "
        Set Rsj = objConn.Execute(j)
        
        if not rsj.eof then
           njsalah = Rsj("terang")
        end if
     end if

  end if	
%>   
<br>
 <table width="50%" cellpadding="1" cellspacing="5" class="hd">
        <tr> 
          <td class="hd">Tarikh Kompaun</td>
  <td><%=tmasuk%></td>
</tr>

<!--<tr> 
  <td bgcolor="#9D2024" height=24><b><font size="2" face="Verdana" color="#FFFFFF">No Pendaftaran</font></b></td>
  <td bgcolor="#CCCCCC"><b><font size="2" face="Verdana"><%=kereta%></font></b></td>
</tr>-->

<tr> 
  <td class="hd">Jenis Kesalahan</td>
  <td><%=jsalah%> - <%=njsalah%></td>
</tr>

<tr> 
  <td class="hd">No Resit</font></b></td>
  <td> 
      <input type="text" name="resit" value="<%=resit%>" size="15" maxlength="15" onFocus="nextfield='amaun_bayar';"></td>
</tr>

<tr> 
  <td class="hd">Amaun</td>
  <td> 
      <input type="text" name="amaun_bayar" value="<%=FormatNumber(amaun_bayar,2)%>" size="10"  maxlength="14" onFocus="nextfield='tbayar';"></td>
</tr>

<tr> 
  <td class="hd">Tarikh Bayaran</td>
  <td> 
      <input type="text" name="tbayar" value="<%=tbayar%>" size="10" maxlength="8" onFocus="nextfield='b1SAVE';">
      ( 'ddmmyyyy' )
      <input type="hidden" name="rowid" value="<%=rowid%>"></td>
</tr>
<tr>
<td class="hd" colspan="2" align="center">

<input type="submit" name=b1SAVE value="Save" onFocus="nextfield='done';" class="button">&nbsp;<input type="submit" value="Reset" name="b1RESET" class="button">
</td></tr></table>

<%end sub%>

</body>
</html>