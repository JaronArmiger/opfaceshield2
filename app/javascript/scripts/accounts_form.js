$(document).on('turbolinks:load', function() {
  const otherDiv = $("#other-div");
  $("#account_institution_type").change( function() {
  	const selected = $(this).val();
  	if (selected === "Other") {
 	  otherDiv.show();
  	} else {
      otherDiv.hide();
    }
  });

  const accountEditForm = $(".account-edit-form")
  if (accountEditForm) {
  	const otherType = $("#account_other_type");
  	const institutionType = $("#institution_type");
  	otherType.val(institutionType.text());
  }
});
