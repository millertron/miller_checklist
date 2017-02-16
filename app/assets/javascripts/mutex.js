// Garber-Irish Implementation of JS execution on DOM load
MUTEX = {
	common : { 
		init: function() {
	
		}
	},
	checklists : {
		init: function() {
		
		},
		index: function() {

		},
		new: function() {
			checklist_form();
		},
		edit: function() {
			checklist_form();
		}
	},
	
	implementations : {
		init: function() {
			
		},
		new : function() {
			checkSubmitReady("mandatory", "submit-checklist");
		}
	},
	
	form_options : {
		init: function() {
			
		},
		index : function() {
			checkSubmitReady("mandatory", "submit-form_option");
		}
	},
	
	analytics : {
		init: function() {
			
		},
		index : function(){
			$('#summary-form').bind('ajax:success', function(event, data) {  
				$("#data-summary").html(data);
			});
			$('#summary-form').submit();
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

//Use instead of $(document).ready
$( document ).on("turbolinks:load", UTIL.init );
 