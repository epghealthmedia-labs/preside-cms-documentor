<cfscript>
	
</cfscript>

<cfoutput>

	#renderView('/admin/documentor/modules/_topRightButton')#

	<nav class="nav">
		<li>
			<h5><a href="#event.buildAdminLink( linkTo='documentor.objects')#">Data Objects</a></h5>
		</li>
		
		<li>
			<h5><a href="#event.buildAdminLink( linkTo='documentor.services')#">Services</a></h5>
		</li>					
	</nav>

</cfoutput>