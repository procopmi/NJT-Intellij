<%@ page
import="java.io.File,
 blackboard.data.*,
 blackboard.data.user.*,
 blackboard.persist.*,
 blackboard.persist.user.*,
 blackboard.base.*,
 blackboard.platform.persistence.*,
 blackboard.platform.session.*,
 blackboard.platform.security.*,
 blackboard.platform.db.*,
 blackboard.portal.data.*,
 blackboard.portal.servlet.*,
 blackboard.xml.*,
 blackboard.portal.external.*,
 blackboard.platform.*,
 blackboard.platform.log.*,
 blackboard.platform.plugin.PlugInUtil,
 blackboard.util.TextFormat,
 edu.shu.StudentStatus"
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
		BbSession bbSession = null;
		try
		{
			bbSession = sessionService.getSession(request);		
		}
		catch(Exception e)
		{
			//e.printStackTrace();
			throw new Exception("You must log into myWeb.shu.edu first");
		}
		
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
			String backg = PlugInUtil.getUri("shu", "shunjtransit",
					"images/table_bg.jpg");
			String headImage = PlugInUtil.getUri("shu", "shunjtransit",
					"images/head_image.png");
			String trainStation = PlugInUtil.getUri("shu", "shunjtransit",
					"images/train_station.png");
%>

</head>
<body>
			<a name="top">&nbsp;</a>
			


			<!-- following 3 images and code from Mike Hyland -->

			<table border="0" width="100%" id="headerTable" cellpadding="0"
				style="border-collapse: collapse" height="72"
				background="<%= backg %>" >
			<tr>
				<td><img border="0" src="<%= headImage %>" width="560" height="72"></td>
			</tr>
			</table>
			

			<p>&nbsp;</p>
			<img border="0" src="<%= trainStation %>" width="300" height="203"
				align="right" hspace="15" >	
			<center>	
			<b><font size=+2><i>Full-Time Students:&nbsp; Get On Board with an Additional 25% Discount on NJ TRANSIT Monthly Passes!</i></font></b>
			</center>
			<hr>
			<br><br>
			<blockquote>
				<center>
					<font size=+1>
						<b>Registration Instructions and General Information</b>
					</font>
				</center> 
			<br>
			<b><font color="red" size="+1">Beginning with the mailing of September 2009 monthly passes, a $3 processing fee will be applied each month to Quik-Tik transactions.</font></b>

			<br>
			<br>
			Quik-Tik offers the convenience of auto-pay combined with on-line
			account management. You will receive your student monthly pass directly
			through the mail and your credit card will be automatically billed. 
			<br><br>To receive the 25% discount, you must be full-time and you must <i>initially</i> establish 
			your account within NJ TRANSIT using <a href="#new">the Enroll button below</a>.&nbsp;&nbsp;Once you have signed up,  you can go directly to the 
   			<a href="https://ww2.njtransit.com/qt/qt_servlet.srv?hdnPageAction=QuikTikTo" >NJ TRANSIT website </a> to login or you can use the form below under <a href="#existing">Existing Quik-Tik Users</a>.
			<br>
			<br>
			<b>Reminder:</b>&nbsp; To receive a pass for next month, sign up no later than the 10th of this month. <br>

	
	
			 <b>Troubleshooting Tips:&nbsp; </b><a href="troubleshootnjt.jsp" >Click here</a> if you experience an error regarding "trip type" while purchasing your passes.  
			</blockquote>
	
	<blockquote>
	<hr>
	
	
	<p>
	<b><font size=+1><a name="new">New to Quik-Tik?</a> </font></b>
	<br>
	Getting started is easy. When you enroll below, your full-time status
	will be verified electronically to NJ TRANSIT. Afterwards, the price of
	the monthly pass that you order will automatically reflect the 25%
	student discount. During your first purchase, you will create a
	Quik-Tik user-name and password. To contact Quik-Tik, call
	1-866-QuikTik.&nbsp;&nbsp;Click below to sign up! <br>
	<b><i><font size="-1">You must use the button below the first time you purchase tickets and
	set up an account in order to receive the additional 25% student discount.
	</font></i></b>
	<br>
	<br>
	<p align="center">
	<table border="1" bordercolor="red" width="60%" >
	<tr>
	<td>	
	Students who participate in this program agree that the monthly pass is for their exclusive use only.&nbsp;&nbsp;Each student is eligible to receive one discounted monthly pass per month.&nbsp;&nbsp;Passes are non-transferable.&nbsp;&nbsp;Any abuse or purposeful deception will result in the cancellation of the student's monthly pass account, and (s)he will be unable to participate in the program in the future.&nbsp;&nbsp;This will also apply to any other student who is knowingly involved.
	</td>
	</tr>
	</table>
	<div id="enrollnow" align="left">
	<form name="Register" action="https://ww2.njtransit.com/qt/qt_servlet.srv?hdnPageAction=QuikTikTo" method="post"/>
		<input type="hidden" name="university_code" value="<%= universityCode %>" /> 
		<input type="hidden" name="student_id" value="<%= uniqueNJTransitId %>" /> 
		<input type="submit" name="submit" value="Enroll With NJ TRANSIT Now"/>
	</form>
	</div>
	</blockquote>
	
	
	<blockquote>	
	<a name="existing">&nbsp;</a>
	<hr>
	<b> <font size=+1>Existing Student Quik-Tik Users</font></b><br>
	<b>Account Reactivation:</b>&nbsp;You will need to reactivate your existing account
	using<b> this web page</b>,&nbsp; prior to buying Summer or Fall passes.  &nbsp; You
	only need to do this once per year. &nbsp;&nbsp; <u>Here's how: </u>
	<ul>
		<li>Enter required information below and click &quot;Login to
		Quik-Tik&quot;. This will sign you into Quik-Tik and bring you to the
		main page.</li>
		<li>Enter requested information, which will bring you to the "Account
		Summary" page.</li>
		<li>Scroll to the bottom to see your status information. Click on
		"Change Status".</li>
		<li>Click on "Reactivate previously suspended monthly pass mailing"
		and click on "Submit".</li>
	</ul>

	<b>Account Maintenance:</b>&nbsp; Once you have reactivated your account (if necessary), you may use this form to maintain your account and buy new passes, or go directly to the 
	<a href="https://ww2.njtransit.com/qt/qt_servlet.srv?hdnPageAction=QuikTikTo">NJ TRANSIT website</a> to login.
	<form name="Maintain" action="https://ww2.njtransit.com/qt/qt_servlet.srv?hdnPageAction=QuikTikTo"
		method="post" />
	<table cellpadding="0" cellspacing="0" border="0" width="400">

		<tr>
			<td align="left">NJ TRANSIT Quik-Tik <b>UserName</b>&nbsp;</td>
			<td><input type="text" name="username" size="15" maxlength="35"></td>
		</tr>
		<tr>
			<td align="left">NJ TRANSIT Quik-Tik <b>Password</b>&nbsp;</td>
			<td><input type="password" name="password" size="15" maxlength="35"></td>
		</tr>
		<tr>
			<td><input type="hidden" name="status" value="login_auth" /> <input
				type="hidden" name="university_code" value="<%= universityCode %>" />
			<input type="hidden" name="student_id"
				value="<%= uniqueNJTransitId %>" /></td>
		</tr>

		<tr>
			<td align="right"><br>
			<br>
			</td>
			<td><input type="submit" name="submit" value="Login to Quik-Tik"
				border="0"></td>
		</tr>
	</table>
	</form>
	
	
	<a href="#top">top</a>
	</blockquote>

	
	
	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<%
	//added all those breaks above so that the anchor named existing would work
		}
		catch (Exception e)
		{
			if (user != null) 
			{
				out.println("Please call the helpdesk at 2222");
				System.out.println("An exception occured for user " + user.getUserName() + ". Please check log");
				if (!hasValidStreet1Data)
					System.out.println("Check street1 data for user " + user.getUserName() + ".");
				e.printStackTrace();
			}	
			
	%>
			<bbUI:receipt type="FAIL" title="Error">
			</bbUI:receipt>
	<%
			//throw e;	
		}  //end catch
	%>
	</body>
</bbData:context>