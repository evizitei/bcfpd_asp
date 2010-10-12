<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<TITLE>A Message From The Chief</TITLE>
<style type="text/css">
	a {color: white}
</style>
</HEAD>
<BODY bgColor=black text=white>

<center>
<%If Instr(1, Request("loc"), ".mpg") > 0 Or Instr(1, Request("loc"), ".mpeg") > 0 Or Instr(1, Request("loc"), ".mov") > 0 Then%>
<font face="Arial" size="2"><%=Request("cap")%></font><br>
<!--<EMBED bgcolor="#000000" width=320 
SRC="http://192.168.222.9/images/news/<%=Request("Loc")%>" AUTOPLAY=true CONTROLLER=True LOOP=false PLUGINSPAGE="http://quicktime.apple.com">-->

<embed bgcolor="#000000" src=http://192.168.222.9/images/news/shrek_hi.mov pluginspage="http://www.apple.com/quicktime/download/" autoplay=true controller=true cache=true width="320" height="220" >
    </embed>



<br>
<font face="Arial" size="2">Please wait while the movie loads.<br>
If you are experiencing difficulty playing this movie, please ensure that you have the latest version of <a href="http://www.apple.com/quicktime/">Quicktime</a> installed.</font>
</center>


<%Else%>
<img src="/images/news/<%=Request("loc")%>">
<br>
<font face="Arial" size="2"><%=Request("cap")%></font>
<%End If%>
</center>
</BODY>
</HTML>
