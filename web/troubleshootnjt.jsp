<%@ page
import="blackboard.platform.*;
import blackboard.platform.session.*"


	errorPage="/error.jsp"%>
<%@ taglib uri="/bbUI" prefix="bbUI"%>
<%@ taglib uri="/bbData" prefix="bbData"%>



<bbData:context id="ctx">
<head>
<title>SHU:  Troubleshooting problems obtaining discount transit tickets</title>
<%
		//if there is no bbsession, do not allow anyone to view the page. They must
		//come through here from blackboard.
		//if they can't access the page, they will automatically get the bb login
		//page.

		BbSessionManagerService sessionService = BbServiceManager
				.getSessionManagerService();
		BbSession bbSession = sessionService.getSession(request);	
 
%>  
    
       <table border="0" width="100%" id="headerTable" cellpadding="0"
		style="border-collapse: collapse" height="72"
		background="images/table_bg.jpg">
		<tr>
			<td><img border="0" src="images/head_image.png" width="560" height="72"></tr>
	</table>
	
    
  </head>
  
  <body>
  <br>
  <div ALIGN=CENTER>
  <table width="75%">
  <tr>
  <td>
  </td>
  <td>
  <b>Important Note regarding Browser Settings:&nbsp;</b>
	 If you experience an error while signing up for
	your pass within the NJ TRANSIT website, this is due to the way NJ
	TRANSIT sets cookies and the Internet Explorer default security
	setting. You can get around this in one of two ways:<br>
	
	<OL>
		<li>In IE, Under Tools, Internet options, Security, Trusted Sites,
		Sites: Add https://www.njtransit.com</li>
		<li>In IE, Under Tools, Internet options, Privacy, Advanced, make sure
		the Overide Automatic Cookie handling is checked, and that either "Prompt"
		or "Accept" is chosen for Third Party Cookies. (Prompt is recommended).</li>
	</OL>
	
	
  </td>
  <td>
  </td>
  </tr>
  </table>
  </div>
  <a href="shunjtransit.jsp">Back to Student NJ TRANSIT Discounts</a>
  
  
  </body>
</bbData:context>
