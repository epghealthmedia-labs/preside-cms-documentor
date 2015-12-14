<cfif hasCmsPermission( "documentor.navigate" )>
	<cfoutput>
		<li>
			<a href="#event.buildAdminLink( linkTo='documentor' )#">
				<i class="fa fa-fw fa-book"></i>
				Documentor
			</a>
		</li>
	</cfoutput>
</cfif>