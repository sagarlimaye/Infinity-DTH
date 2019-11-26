$(function() {
	$("div.channelList").hide();
	var channelSelect = $("#channelSelect");
	var channelList = $("div.channelItem").map(function() {
		return {
			id: $(this).attr("id"),
			band: $(this).data("band"),
			name: $(this).text(),
			videoFreq: $(this).data("videofreq"),
			audioFreq: $(this).data("audiofreq"),
			chargeType: $(this).data("chargetype"),
			transmissionType: $(this).data("transmissiontype"),
			charge: $(this).data("charge")
		}
	}).get();
	
	$("input[name='chargeType'], input[name='transmissionType']").click(function() {
		var checkbox = $(this);
		updateChannelSelection($(this));
	});
	
	const updateChannelSelection = (checkbox) => {
		let ctype = $("input[name='chargeType']:checked").val();
		let transType = $("input[name='transmissionType']:checked").val();
		let selection = channelList;
		if(ctype == 'fta')
		{
			selection = channelList.filter(channel => channel.chargeType == 'fta');
		}
		if(transType == 'standard')
		{
			selection = selection.filter(channel => channel.transmissionType == 'standard');
		}
		channelSelect.children("option").remove();
		$.each(selection, function(id, channel) {
			channelSelect.append("<option value='" + channel.id+"'>"+channel.name+"</option>");
		});
		channelSelect.selectpicker("refresh");
	}
	
	updateChannelSelection($("input[name='chargeType']"));
});