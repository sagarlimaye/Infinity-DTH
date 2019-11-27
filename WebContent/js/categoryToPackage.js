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

    var select = document.getElementById("featureSelect");
    var close = document.getElementsByClassName("close");
    var list = document.getElementById("list");
    var i;
    
    function OnClose() {
        var saved = false;
        var div = this.parentElement;
        
        $.ajax("/InfinityDTH/HomeController?option=FeatureRemove&id="+this.id, {
            method: "DELETE",
            statusCode: {
                204: () => {
                    $(select).find("option[value='"+this.id+"']").remove();
                    div.remove(); 
                },
                500: () => { alert("Could not delete that feature"); }
            } 
        });  
    }
    
    function OnClick() {
        var saved = false;
        var node = document.createElement("li");
        var textnode = document.createTextNode(document.getElementById("idea").value);
        $.post("/InfinityDTH/HomeController", {
            option: "FeatureAdd",
            featureName: textnode.textContent
        }, function(result) {
            node.appendChild(textnode);
            list.appendChild(node);
            document.getElementById("idea").value = "";
            var span = document.createElement("SPAN");
            var txt = document.createTextNode("X");
            var option = document.createElement("option");
            span.className = "close";
            span.id = result.id;
            option.value = result.id;
            option.text = textnode.textContent;
            span.appendChild(txt);
            node.appendChild(span);
            select.appendChild(option);
            span.onclick = OnClose;
        });
    }
    
    // Click on a close button to hide the current list item
    for (i = 0; i < close.length; i++) {
        close[i].onclick = OnClose;
    }
    
    // Create a new list item when clicking on the "Add" button
    document.getElementById("add").onclick = OnClick;
    $("#features").on('hidden.bs.modal', () => { $("#featureSelect").selectpicker("refresh"); });
});