<cfoutput>
	
	<div class="top-right-button-group">
		
	<a target="_blank" href="http://www.epghealthmedia.com/"><img src="http://www.epghealthmedia.com/images/epghealthmedialogo.png" alt="" width="115" height="auto"></a> &nbsp;&nbsp;

	<cfif hasCmsPermission( "urlRedirects.addRule" )>
		
		<!--- Future Extension

		<a class="pull-right inline" href="#event.buildAdminLink( linkTo="" )#" data-global-key="a">
			
			<button class="btn btn-success btn-sm">
				
				<i class="fa fa-cogs"></i>
				
				Generate Static Site
			
			</button>

		</a>

		--->

	</cfif>

	</div>

</Cfoutput>	
