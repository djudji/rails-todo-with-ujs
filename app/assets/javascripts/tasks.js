$(document).on('turbolinks:load', function() {
  $("input[type='checkbox']").on('click', function(e){
		//var isChecked = $(this).is(":checked");
		//console.log(isChecked);
		$(this).closest('form').submit();
	});
});


