<%@ page import=
	   "blackboard.persist.*,      
        blackboard.platform.*,
        blackboard.platform.session.*,     
		blackboard.portal.data.*, 
        blackboard.portal.servlet.*,
        blackboard.platform.plugin.PlugInUtil,
        blackboard.persist.user.*,
        blackboard.data.user.*,
        edu.shu.StudentStatus"     
     	errorPage="/error.jsp" 
%>

	<%@ taglib uri="/bbUI" prefix="bbUI" %>
	<%@ taglib uri="/bbData" prefix="bbData" %>
	<html>
	
	
	<body>
		<bbData:context id="ctx">	
<%
		User user = ctx.getUser();	
		StudentStatus stuStat = new StudentStatus(user);	
		String banner = PlugInUtil.getUri("shu", "shunjtransit", "images/njtransitlogo09.jpg"); //THESE WILL BE DIFFERENT-BASED ON BB-MANIFEST.XML
		String styleIt = PlugInUtil.getUri("shu", "shunjtransit", "styles/stylesheet.css");     //THESE WILL BE DIFFERENT-BASED ON BB-MANIFEST.XML
		//LogService ls = BbServiceManager.getLogService();        
    	//ls.defineNewFileLog("NJTransitError.log", "logs/NJTransitError.log", LogService.Verbosity.ERROR, true);
    	//Log logDirLog = ls.getConfiguredLog("NJTransitError.log");	
		boolean isEligibleForDiscount = false;
		try
		{
			isEligibleForDiscount = stuStat.isEligibleForDiscount();	
		}
		catch (Exception e)
		{	
    		//do nothing -- user has improper street1 data.  Just show the non-full time view so the user cannot get a discount.	
		}
%>

		<link rel="stylesheet" type="text/css" href="<%= styleIt %>" />			
<% 
	
		if (!isEligibleForDiscount)
		{
			//if they are not fulltime according to the special NJTransit indicator in street1, give them the following information.
%>				
	
	 
			<div class="uportal-text-heading">
				<b>					
						Get On Board With NJ TRANSIT Quik-Tik Monthly Passes
				</b>
			</div>
			<hr>
    		<div class="uportal-text">
      		
      			The NJ TRANSIT Quik-Tik program offers great discounts to frequent travelers and even greater discounts to full-time students.  Although, according to our records, you aren't eligible for the full-time discount -- the Quik-Tik program offers many conveniences to all travelers.  If you believe our records are incorrect, please contact the Registrar Office at (973) 761-9332.<br>
	  			<hr>
	  			For more general information on NJ TRANSIT Quik-Tik, click on the logo below.
			</div>
			  		  	<br>
	  	<div align="center">
	  		<a href = "https://www.njtransit.com/qt/qt_servlet.srv?hdnPageAction=QTFaqTo" target="_blank"><img border="0" src= "<%= banner %>" /></a>
		</div>
		
<%
	}
	else	
	{		
		//get the url of the shunjtransit page where the student can register and log in
		//this is better than hardcoding. You never know where future versions of 
		//Blackboard and/or Tomcat may place your page and name your URL	
		String myUrl = PlugInUtil.getUri("shu", "shunjtransit", "shunjtransit.jsp");
%>        
		<div class="uportal-text-heading">
			
				<b>Get On Board with an Additional 25% Discount on NJ TRANSIT Monthly Passes</b>
		</div>	
			
       		<hr>
       	<div class="uportal-text">    
    		<b>Great News!!</b>&nbsp;  As a full-time student at Seton Hall University, you are eligible to receive a rail, bus or light rail monthly pass at an <b><i>additional</i></b> &nbsp;25% discount with the NJ TRANSIT Quik-Tik program!
	    </div>
    	
    	
    	<div class="uportal-red-text-small">
    		<br>Beginning with the mailing of September 2009 monthly passes, a $3 processing fee will be applied each month to Quik-Tik transactions.
    	</div>
    	
    	<br>
    	<div class="uportal-text">
			<a href="<%= myUrl %>" target="_blank"> Learn More </a>
		</div>
		<br>
		
	    <div align="center">
    		<img border="0" src= "<%= banner %>" />
    	</div>
    	
<%
    }	
%>
</bbData:context>
</body>
</html>
 