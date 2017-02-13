checkSubmitReady = function(mandatoryClassName, submitClassName){
	var submitReady = true;
	$("input:checkbox."+mandatoryClassName).each(function(){
		if (!$(this).prop("checked")==true){
			submitReady = false;
		}
	});
	$("input:text."+mandatoryClassName).each(function(){
		if (!$(this).val()){
			submitReady = false;
		}
	});
	$("input[type='number']."+mandatoryClassName).each(function(){
		if (!$(this).val()){
			submitReady = false;
		}
	});
	if (submitReady){
		$("input:submit." + submitClassName).prop('disabled', false);
	} else {
		$("input:submit." + submitClassName).prop('disabled', true);
	}
};