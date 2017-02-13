MUTEX = {
	common : { 
		init: function() {
	
		}
	},
	checklists : {
		init: function() {
		
		},
		index: function() {
			console.log("Checklist Index loaded!");
		}
	},
	
	implementations : {
		init: function() {
			
		},
		new : function() {
			checkSubmitReady("mandatory", "submit-checklist");
		}
	}
};

UTIL = { 
	exec: function( controller, action ) { 
		var ns = MUTEX, action = ( action === undefined ) ? "init" : action;
		if ( controller !== "" && ns[controller] && typeof ns[controller][action] == "function" ) { 
			ns[controller][action]();
		} 
	}, 
	
	init: function() { 
		var body = document.body, controller = body.getAttribute( "data-controller" ), action = body.getAttribute( "data-action" );
		UTIL.exec( "common" );
		UTIL.exec( controller );
		UTIL.exec( controller, action );
	} 
};
 
$( document ).ready( UTIL.init );
 