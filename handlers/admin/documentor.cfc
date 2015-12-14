component extends="preside.system.base.AdminHandler"{
	
	property name="AppObjectInfoService" 	inject="AppObjectInfoService";

	public void function init() {

		_objectDirectoryPath 	= '/app/preside-objects';
		_servicesDirectoryPath 	= '/app/services';
	}

	public void function prehandler( event, rc, prc ) output=false {

		super.preHandler( argumentCollection = arguments );

		event.addAdminBreadCrumb(
			  title = 'Documentor'
			, link  = event.buildAdminLink( linkTo="documentor" )
		);		
	}

	public void function index (event, rc, prc, args={}) { // Home Page
		
		prc.pageTitle		= 'PresideCMS Documentor';
		prc.pageSubtitle 	= 'by EPGHealthmedia Development Team';
	}


	public void function objects ( event, rc, prc, args={} ) { // Objects Page

		event.addAdminBreadCrumb(
			  title = 'Data Objects'
			, link  = event.buildAdminLink( linkTo="documentor.objects" )
		);

		prc.pageTitle		= 'Your Data Objects';
		prc.pageSubtitle 	= 'All current preside data objects in your application';		

		prc.objectNames = AppObjectInfoService.getObjectNames(_objectDirectoryPath);

		event.setView('/admin/documentor/objects/index');
	}


	public void function object (event, rc, prc, args={}) { // objects Detail Page

		event.addAdminBreadCrumb(
			  title = rc.object
			, link  = event.buildAdminLink( linkTo="documentor.object" )
		);

		prc.pageTitle		= rc.object;
		prc.pageSubtitle 	= 'Data Object';

		prc.objectName = rc.object;
		prc.objectMeta = AppObjectInfoService.getObjectMeta( rc.object, _objectDirectoryPath);
		event.setView('/admin/documentor/objects/detail');
	}


	public void function services (event, rc, prc, args={}) { // Services Page

		event.addAdminBreadCrumb(
			  title = 'Services'
			, link  = event.buildAdminLink( linkTo="documentor.object" )
		);

		prc.pageTitle		= 'Your Services';
		prc.pageSubtitle 	= 'All services in your application';

		prc.serviceNames = AppObjectInfoService.getObjectNames(_servicesDirectoryPath);
		event.setView('/admin/documentor/services/index');
	} 


	public any function service (event, rc, prc, args={}) { // Services Detail Page

		event.addAdminBreadCrumb(
			  title = rc.service
			, link  = event.buildAdminLink( linkTo="documentor.service" )
		);
		prc.pageTitle		= rc.service;
		prc.pageSubtitle 	= 'Service';

		prc.serviceName = rc.service;
		prc.serviceMeta = AppObjectInfoService.getObjectMeta( rc.service, _servicesDirectoryPath);
		event.setView('/admin/documentor/services/detail');

	}

}