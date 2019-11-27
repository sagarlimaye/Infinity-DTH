$(function() {
	var select = document.getElementById("categorySelect");
    var close = document.getElementsByClassName("close");
    var list = document.getElementById("list");
    var i;
    
    function OnClose() {
        var saved = false;
        var div = this.parentElement;
        
        $.ajax("/InfinityDTH/HomeController?option=CategoryRemove&id="+ this.id, {
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
        let categoryName = document.createTextNode(document.getElementById("categoryName").value);
        let minChannels = document.createTextNode(document.getElementById("minChannels").value);
        let maxChannels = document.createTextNode(document.getElementById("maxChannels").value);
        $.post("/InfinityDTH/HomeController", {
            option: "CategoryAdd",
            categoryName: categoryName.textContent,
            minChannels: minChannels.textContent,
            maxChannels: maxChannels.textContent
        }, function(result) {
            node.appendChild(categoryName);
            list.appendChild(node);
            document.getElementById("categoryName").value = "";
            var span = document.createElement("SPAN");
            var txt = document.createTextNode("X");
            var option = document.createElement("option");
            span.className = "close";
            span.id = result.id;
            option.value = result.id;
            option.text = categoryName.textContent;
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
    $("#categories").on('hidden.bs.modal', () => { $("#categorySelect").selectpicker("refresh"); });
});