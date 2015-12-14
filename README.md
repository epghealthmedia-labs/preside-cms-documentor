# preside-ext-documentor

A presideCMS extension for providing documentation for Preside-CMS https://www.presidecms.com/ application.

Current Features
<ol>
<li>Data Objects
	<ol>
		<li>List all Data Objects currently registered in the application.</li>
		<li> View detailed entity description for each Data Objects.</li>
	</ol>
</li>
<li>Services
	<ol>
		<li>List all Services currently registered in your application.</li>
		<li>Provides a reference API for each registered Service.</li>
	</ol>
</li>
</ol>

Usage
<ol>
	<li>Download or Clone the latest copy onto your preside application's "extension" folder.</li>
	<li>In the "extension.json" file (under the extension folder) add this dataset 		<code>{"priority":0,"name":"preside-ext-documentor","active":true}</code> </li>
	<li>Do a framework re-initialization.</li>
	<li>On the Preside CMS Admin Menu Bar select the System->Documentor</li>
</ol>
   
