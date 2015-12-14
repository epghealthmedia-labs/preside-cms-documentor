<cfscript>
	objectName = prc.objectName;
	objectMeta = prc.objectMeta;

	linkOmits = ['component', 'asset', 'page', 'multilingual_language'];

</cfscript>

<cfoutput>

	#renderView('/admin/documentor/modules/_topRightButton')#

	<p><strong>Full Name:</strong> #objectMeta.fullname#</p>
	
	<p>
		<strong>Extends:</strong>

		<cfif StructKeyExists(objectMeta.extends, 'displayname') >
			
			<cfif NOT ArrayFindNoCase(linkOmits, objectMeta.extends.displayname) ><a href="#event.buildAdminLink(linkTo="documentor.object", queryString="object="&objectMeta.extends.displayname )#"></cfif>

				#objectMeta.extends.displayname#

			<cfif NOT ArrayFindNoCase(linkOmits, objectMeta.extends.displayname) ></a></cfif>

		<cfelseif StructKeyExists(objectMeta.extends, 'name') >

			<cfset name=ListLast(objectMeta.extends.fullname, '.')>

			<a href="#event.buildAdminLink(linkTo="documentor.object", queryString="object="&name )#">#name#</a>

		<cfelse>
			None
		</cfif>
	</p>
	
	<p><strong>Search Enabled:</strong> #objectMeta.searchenabled ?: 'false'#</p>

	<p><strong>Persistent:</strong> #objectMeta.persistent ?: 'false'#</p>
	
	<p><strong>Synchronized:</strong> #objectMeta.synchronized ?: 'false'#</p>
	
	<hr/>


	<h4>CMS Settings</h4>
		
		<p><strong>Data Manager Group:</strong> #objectMeta.datamanagergroup ?: 'n/a'#</p>
		
		<p><strong>Data Manager Grid Fields:</strong> #objectMeta.datamanagergridfields ?: 'n/a'#</p>
		
		<p><strong>LabelField:</strong> #objectMeta.labelfield ?: 'label'#</p>

	<hr/>
	

	<cfif StructKeyExists(objectMeta, 'properties') >
		<p>
			<h4>Properties</h4>
			<table class="table table-bordered table-responsive table-striped">
				<cfset sn = "1" />

				<thead>
					<tr>
						<th>Name</th>
						<th>type</th>
						<th>dbtype</th>
						<th>maxLength</th>
						<th>required</th>
						<th>default</th>
						<th>indexes</th>
						<th>uniqueindexes</th>
						<th>control</th>
						<th>renderer</th>
						<th>minLength</th>
						<th>minValue</th>
						<th>maxValue</th>
						<th>format</th>
						<th>pk</th>
						<th>generator</th>
						<th>relationship</th>
						<th>relatedTo</th>
						<th>relatedVia</th>
						<th>relationshipIsSource</th>
						<th>relatedViaSourceFk</th>
						<th>relatedViaTargetFk</th>
						<th>searchEnabled</th>
						<th>searchSearchable</th>
					</tr>
				</thead>

				<cfloop array="#objectMeta.properties#" item="property">

					<tr>

						<td>#property.name#</td>

						<td>#property.type ?: ''#</td>

						<td>#property.dbtype ?: ''#</td>

						<td>#property.maxLength ?: '0'#</td>

						<td>#property.required ?: 'no'#</td>

						<td>#property.default ?: ''#</td>

						<td>#property.indexes ?: ''#</td>

						<td>#property.uniqueindexes ?: ''#</td>

						<td>#property.control ?: 'default'#</td>

						<td>#property.renderer ?: 'default'#</td>

						<td>#property.minLength ?: 'none'#</td>

						<td>#property.minValue ?: 'none'#</td>

						<td>#property.maxValue ?: 'n/a'#</td>

						<td>#property.format ?: 'n/a'#</td>

						<td>#property.pk ?: 'false'#</td>

						<td>#property.generator ?: 'none'#</td>

						<td>#property.relationship ?: 'none'#</td>

						<td>
							<cfif structKeyExists(property,"relatedTo") >
							
								<cfif NOT ArrayFindNoCase(linkOmits, property.relatedTo) ><a href="#event.buildAdminLink(linkTo="documentor.object", queryString="object="&property.relatedTo )#"></cfif>
								
									#property.relatedTo#

								<cfif NOT ArrayFindNoCase(linkOmits, property.relatedTo) ></a></cfif>

							<cfelse>
								
								none
								
							</cfif>
						</td>

						<td>#property.relatedVia ?: ''#</td>

						<td>#property.relationshipIsSource ?: 'n/a'#</td>

						<td>#property.relatedViaSourceFk ?: 'n/a'#</td>

						<td>#property.relatedViaTargetFk ?: 'n/a'#</td>

						<td>#property.searchEnabled ?: 'false'#</td>

						<td>#property.searchSearchable ?: 'false'#</td>

					</tr>
				</cfloop>
			</table>
		</p>

		<hr/>

	</cfif>
	
	<cfif StructKeyExists(objectMeta, 'functions') >
		<p>
			<h4>Internal Methods</h4>
			<table>
				<cfloop array="#objectMeta.functions#" item="_function">
					<tr>
						<th>Name</th>
						<th>Parameters</th>
						<th>Return Type</th>
					</tr>
					<tr>
						<td>#_function.name#</td>
						<td>
							<table>
								<cfloop array="#_function.parameters#" item="parameter">
									<tr>
										<td>parameter.name</td>
										<td>parameter.required</td>
										<td>parameter.type</td>
									</tr>
								</cfloop>
							</table>
						</td>
						<td>#_function.name#</td>
					</tr>
				</cfloop>
			</table>
		</p>
		<hr/>
	</cfif>
	
	<!---<cfdump var="#objectMeta#" />--->
</cfoutput>
