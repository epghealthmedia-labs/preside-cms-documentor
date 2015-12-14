<cfscript>
	serviceNames = prc.serviceNames ?: {};
	ArraySort(serviceNames, "text", "asc");
</cfscript>

<cfoutput>	
	
	#renderView('/admin/documentor/modules/_topRightButton')#

	<ol>

		<cfloop array="#serviceNames#" item ="name">

			<li>
				<a href="#event.buildAdminLink(linkTo="documentor.service", queryString="service="&name )#">#name#</a>
			</li>

		</cfloop>
		
	</ol>	

</cfoutput>