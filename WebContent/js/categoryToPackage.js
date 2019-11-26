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
	

	const updateCategorySelection = () => {
		let selection = categoryList;
		console.log(selection);
		categorySelect.children("option").remove();
		$.each(selection, function(id,category) {
			categorySelect.append("<option value='" + category.id+"'>"+category.name+"</option>");
		});
		console.log(categorySelect);
		categorySelect.selectpicker("refresh");
	}
	
	updateCategorySelection();
});