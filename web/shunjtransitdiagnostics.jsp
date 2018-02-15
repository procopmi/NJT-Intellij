<%@ page
import="java.io.File;
import blackboard.data.*;
import blackboard.data.user.*;
import blackboard.persist.*;
import blackboard.persist.user.*;
import blackboard.base.*;
import blackboard.platform.persistence.*;
import blackboard.platform.session.*;
import blackboard.platform.security.*;
import blackboard.platform.db.*;
import blackboard.portal.data.*;
import blackboard.portal.servlet.*;
import blackboard.xml.*;
import blackboard.portal.external.*;
import blackboard.platform.*;
import blackboard.platform.log.*;
import blackboard.platform.plugin.PlugInUtil;
import blackboard.util.TextFormat;
import edu.shu.StudentStatus"
	errorPage="/error.jsp"%>

<%@ taglib uri="/bbUI" prefix="bbUI"%>
<%@ taglib uri="/bbData" prefix="bbData"%>

<bbData:context id="ctx">
<head>
<title></title>


<%	
	
		//if there is no bbsession, do not allow anyone to view the page. They must
		//come through here from Blackboard after logging in.
		//LogService ls = BbServiceManager.getLogService();        
        //ls.defineNewFileLog("NJTransitError.log", "logs/NJTransitError.log", LogService.Verbosity.ERROR, true);
        //Log logDirLog = ls.getConfiguredLog("NJTransitError.log");
		BbSessionManagerService sessionService = BbServiceManager.getSessionManagerService();
		BbSession bbSession = sessionService.getSession(request);		
		//UserContext userCtx = bbSession.lookupUserContext(request);
	    //User u = userCtx.getUser(); 
        boolean hasValidStreet1Data = false;      
		String uniqueNJTransitId = "";
		String universityCode = "";       
		User user = ctx.getUser(); 
        try
        {
			StudentStatus stuStat = new StudentStatus(user);			
	    	uniqueNJTransitId = stuStat.getUniqueId(); 
	    	universityCode = StudentStatus.universityCode;	    	
	    	hasValidStreet1Data = true;
    	}
    	catch (Exception e)
    	{    		
    		System.out.println("NJTransit exception occurred in shunjtransitdiagnostics.jsp for user: " + user.getUserName());
    		e.printStackTrace();	   
		}			
		
%>
<%
		if (hasValidStreet1Data)
		{
			String backg = PlugInUtil.getUri("shu", "shunjtransit",
					"images/table_bg.jpg");
			String headImage = PlugInUtil.getUri("shu", "shunjtransit",
					"images/head_image.png");
			String trainStation = PlugInUtil.getUri("shu", "shunjtransit",
					"images/train_station.png");
%>
			

			<table border="0" width="100%" id="headerTable" cellpadding="0"
				style="border-collapse: collapse" height="72"
				background="<%= backg %>">
			<tr>
				<td><img border="0" src="<%= headImage %>" width="560" height="72"></td>
			</tr>
			</table>


			<p>&nbsp;</p>
			<img border="0" src="<%= trainStation %>" width="300" height="203"
				align="right" hspace="15" >	
			<center>	
			<b><font size=+2><i>DIAGNOSTICS PAGE</i></font></b>
			</center>
			<hr>
			<br><br>
			
	</head>
	<body>
	<blockquote>
	<hr>
	
	
	<p>
	<b><font size=+1><a name="new">DIAGNOSTICS</a> </font></b>
	<br>
	
	<br>
	<br>
	<p align="center">
	
	<div id="enrollnow" align="left">
	<form name="Register" action="https://ww2.njtransit.com/ti_qt_tc_diag.jsp" method="post"/>
		<input type="hidden" name="university_code" value="<%= universityCode %>" /> 
		<input type="hidden" name="student_id" value="<%= uniqueNJTransitId %>" /> 
		<input type="submit" name="submit" value="CLICK HERE FOR DIAGNOSTICS"/>
	</form>
	</div>
	</blockquote>
	

	<br>
	<br>
	<%
		}
		else
		{
		System.out.println("WARNING! A user is attempting to go straight to shunjtransit.jsp.  User = " + user.getUserName());
	%>
		
		<bbUI:receipt type="FAIL" title="Error">
		</bbUI:receipt>
		<%
		}
		%>
	</body>
</bbData:context>