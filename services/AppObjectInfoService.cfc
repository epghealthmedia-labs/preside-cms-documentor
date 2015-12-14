component singleton=true output=false {

	property name="relationshipGuidance" inject="RelationshipGuidance";

	/**
	* @objectDirectories.inject      presidecms:directories:preside-objects
	*/

	public any function init( required array objectDirectories) {
		_objectDirectories = arguments.objectDirectories
	}


	// Get the names of all preside Objects.
	public array function getObjectNames( required string directoryPath ) {

		var local = {};

		local.objectNames = [];

		local.objectPaths = this._getObjectPaths( [arguments.directoryPath] );

		for (var objectPath in local.objectPaths) {

			ArrayAppend(local.objectNames, ListLast(objectPath, "/"));
		}

		return local.objectNames;
	}


	//Gets a meta information for an object.
	public struct function getObjectMeta (required string objectName, required string directoryPath) {

		var local = {};

		local.objectPaths = this._getObjectPaths( [arguments.directoryPath] );

		for (var objectPath in local.objectPaths) {
	
			if (ListLast(objectPath, "/") ==  arguments.objectName) {

				return getMetaData(createObject("component", objectPath));
			}
		}
		
		return {};
	}


	//Gets a collection of Object and its Information
	public struct function getObjectMetas ( required array directoryPath ) {

		var objectsList = {};

		for (var objectPath in arguments.objectPaths) {

			var objectName = ListLast( objectPath, "/" );

			var objectInstance = createObject("component", objectPath);

			var objectMeta = getMetaData(objectInstance);

			objectsList[objectName] = objectMeta;
		}

		return objectsList;
	}

	// Get all object Paths 
	private array function _getObjectPaths(array directoryPaths) {
		
		var dirs = (ArrayLen(directoryPaths) > 0) ? directoryPaths : getPresideObjectDirectories();
		
		var dir         = "";
		var dirExpanded = "";
		var files       = "";
		var file        = "";
		var paths       = [];
		var path        = "";
		
		for( dir in dirs ) {
			
			files = DirectoryList( path=dir, recurse=true, filter="*.cfc" );
			
			dirExpanded = ExpandPath( dir );

			for( file in files ) {
				
				path = dir & Replace( file, dirExpanded, "" );
				
				path = ListDeleteAt( path, ListLen( path, "." ), "." );
				
				path = ListChangeDelims( path, "/", "\" );

				ArrayAppend( paths, path );
			}
		}

		return paths;
	}
	

	// Gets all directory paths containing preside-objects
	private array function getPresideObjectDirectories() {

		return _objectDirectories;
	}


}