<cfscript>
	objectNames = prc.objectNames ?: [];
	ArraySort(objectNames, "text", "asc");
</cfscript>

<!---
<cfoutput>
<div class="mermaid">
graph TD;
subgraph one
Candy-->Harry
Harry-->Sally
Sally-->Henry
end
subgraph two
Henry-->Danny
Manny-->Sarah
Manny-->Danny
end
Sally-->Henry
classDef default fill:##f9f,stroke:##333,stroke-width:1px;
linkStyle default stroke:##FF0000,stroke-width:1px;
</div>
</cfoutput>
<script src="https://cdn.rawgit.com/knsv/mermaid/0.5.3/dist/mermaid.min.js"></script>
<script> mermaid.initialize({startOnLoad:true});console.log('Test page! mermaid version'+mermaid.version()); </script>
--->

<cfoutput>
	
	#renderView('/admin/documentor/modules/_topRightButton')#

	<ol>

		<cfloop array="#objectNames#" item ="name">

			<li>
				<a href="#event.buildAdminLink(linkTo="documentor.object", queryString="object="&name )#">#name#</a>
			</li>

		</cfloop>
		
	</ol>

</cfoutput>