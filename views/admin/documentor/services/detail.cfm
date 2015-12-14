<cfscript>
	serviceName = prc.serviceName;
	serviceMeta = prc.serviceMeta;
	linkOmits = ['component', 'asset', 'page', 'multilingual_language'];
</cfscript>

<cfoutput>

	#renderView('/admin/documentor/modules/_topRightButton')#
	
	<p><strong>Full Name:</strong> #serviceMeta.fullname#</p>
	
	<p>
		<strong>Extends:</strong>
		<cfif StructKeyExists(serviceMeta.extends, 'displayname') >
			<cfif NOT ArrayFindNoCase(linkOmits, serviceMeta.extends.displayname) ><a href="#event.buildAdminLink(linkTo="documentor.object", queryString="object="&serviceMeta.extends.displayname )#"></cfif>
				#serviceMeta.extends.displayname#
			<cfif NOT ArrayFindNoCase(linkOmits, serviceMeta.extends.displayname) ></a></cfif>
		<cfelseif StructKeyExists(serviceMeta.extends, 'name') >
			<cfset name=ListLast(serviceMeta.extends.fullname, '.')>
			<a href="#event.buildAdminLink(linkTo="documentor.object", queryString="object="&name )#">#name#</a>
		<cfelse>
			None
		</cfif>
	</p>

	<p>
		<strong>Singleton:</strong> 
		<cfif StructKeyExists(serviceMeta, 'singleton') >
			<cfif serviceMeta.singleton == 'true'>
				True
			</cfif>
		<cfelse>
			False
		</cfif>
	</p>

	<hr/>

	<cfif StructKeyExists(serviceMeta, 'functions') >

		<h4>#arrayLen(serviceMeta.functions)# registered methods</h4>
		
		<table class="table table-bordered table-responsive table-striped">
			
			<thead>
				<tr>
					<th>Method/Function Name</th>
					<th>Visibility/Access</th>
					<th>Return Type</th>
					<th>Arguments/Parameters</th>
					<th>Description</th>
				</tr>
			</thead>
			
			<tbody>

				<cfloop array="#serviceMeta.functions#" item="method">

					<tr>
						
						<td>#method.name# ()</td>

						<td>#method.access#</td>

						<td>#method.returnType#</td>
						
						<td>
							
							<cfif ArrayLen(method.parameters) >

								<table class="table table-bordered table-responsive">
								
									<thead><tr>
										<th>Name</th>
										<th>Type</th>
										<th>Required</th>
										<th>Default</th>
										<th>Description</th>
									</tr></thead>

									<tbody>
			
										<cfloop array="#method.parameters#" item="param">

											<tr>

												<td>#param.name# </td>

												<td>#param.type#</td>

												<td><cfif param.required=='true'>#param.required#<cfelse>false</cfif></td>
												
												<td>#param.default ?: 'none'#</td>

												<td>#param.hint ?: 'none'#</td>

											</tr>

										</cfloop>					
			
									</tbody>						

								</table>

							</cfif>	

						</td>
						
						<td>#method.hint ?: 'none'#</td>
					
					</tr>

				</cfloop>

			</tbody>

		</table>
	</cfif>

</cfoutput>
