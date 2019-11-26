$(function() {
	$("div.categoryList").hide();
	var categorySelect = $("#categorySelect");
	var categoryList = $("div.categoryItem").map(function() {
		return {
			id: $(this).data("cid"),
			minChannels: $(this).data("min"),
			maxChannels: $(this).data("max"),
			name: $(this).data("name")
		}
	}).get();
	

	const updateChannelSelection = (checkbox) => {
		let selection = categoryList;
		
		$.each(selection, function(id,category) {
			channelSelect.append("<option value='" + category.id+"'>"+category.name+"</option>");
		});
		categorySelect.selectpicker("refresh");
	}
	
	//updateCategorySelection($("input[name='chargeType']"));
});