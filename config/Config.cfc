component output=false {
	public void function configure( required struct config ) output=false {
		var conf     = arguments.config;
		var settings = conf.settings ?: {};

		settings.adminConfigurationMenuItems.append( "documentor" );

		settings.adminPermissions.documentor = [ "objects", "object", "services", "service" ];
		settings.adminRoles.sysadmin.append( "documentor.*" );
	}
}