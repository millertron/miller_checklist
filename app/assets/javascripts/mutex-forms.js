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

updateAdditionalFieldsForValueType = function(index){
	var valueTypeField = $("#checklist_checklist_items_attributes_"+index+"_value_type");
	if (!valueTypeField || !valueTypeField[0]){
		return false;
	}
	if (valueTypeField.val() == "metric"){
		$("#metricFieldForms").css('display', '');
	} else {
		$("#metricFieldForms").css('display', 'none');
		$("#checklist_checklist_items_attributes_"+index+"_metric_target_max").val('');
		$("#checklist_checklist_items_attributes_"+index+"_metric_target_min").val('');
	}
	return true;
};

checklist_form = function(){
	var checklistItem = true;
	var checklistItemCount = 0;
	while (checklistItem){
		if (updateAdditionalFieldsForValueType(checklistItemCount)) {
			checklistItemCount++;
		} else{
			checklistItem = false;
		}
	}
};