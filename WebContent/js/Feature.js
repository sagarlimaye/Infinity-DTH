$(function() {
	$("div.featureList").hide();
	var channelSelect = $("#featureSelect");
	var channelList = $("div.featureItem").map(function() {
		return {
			id: $(this).attr("id"),
		
			name: $(this).data("name")

			
		}
	}).get();
	
	const updateChannelSelection = (checkbox) => {
		let selection = featureList;
		
		$.each(selection, function(id,feature) {
			channelSelect.append("<option value='" + feature.id+"'>"+feature.name+"</option>");
		});
		categorySelect.selectpicker("refresh");
	}
	
	
	
});