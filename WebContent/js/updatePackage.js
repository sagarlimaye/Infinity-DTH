window.addEventListener('load', () => {
	const editButtons = document.querySelectorAll("button.editChannel");
	const channelNameRows = document.querySelectorAll("td.channels");
	const channelSelect = document.querySelector("#channelSelect");
	
	editButtons.forEach((button) => {
		let tableRow = button.parentNode.parentNode.parentNode;
		let pack = {
				name: tableRow.querySelector("td:nth-child(1)").innerHTML,
				chargingType: tableRow.querySelector("td:nth-child(2)").innerHTML,
				transmissionType: tableRow.querySelector("td:nth-child(3)").innerHTML,
				cost: tableRow.querySelector("td:nth-child(4)").innerHTML,
				availableFrom: tableRow.querySelector("td:nth-child(5)").innerHTML,
				availableTo: tableRow.querySelector("td:nth-child(6)").innerHTML,
				addByDefault: tableRow.querySelector("td:nth-child(7)").innerHTML,
				channels: tableRow.querySelector("td:nth-child(8)").innerText.split(", "),
				id: tableRow.querySelector("input").value
		}
		pack.channels[pack.channels.length -1] = pack.channels[pack.channels.length -1].
			substring(0, pack.channels[pack.channels.length -1].length -1);
		
		button.addEventListener('click', (event) => {
			let editModal = document.querySelector("div#edit .modal-body");
			editModal.querySelector('input[name="packageName"]').value = pack.name;
			let channels = channelSelect.childNodes
			let displayedOptions = "";
			
			channels.forEach(channel => {
				if (channel != channels.item(0)) {
					if (pack.channels.includes(channel.innerText.trim())) {
						channel.selected = 'selected';
						displayedOptions += channel.innerText.trim() + ", ";
					} else {
						channel.selected = false;
					}
				}
			});
			if (displayedOptions === "") {
				document.querySelector('.filter-option-inner-inner').innerText = "Nothing Selected";
			} else {
				document.querySelector('.filter-option-inner-inner').innerText = 
					displayedOptions.substring(0, displayedOptions.length - 2);
			}
			
			const chargeType = editModal.querySelectorAll('input[name="chargeType"]');
			chargeType.forEach((charge) => {
				if (charge.value == pack.chargingType) charge.checked = true;
			});
			
			const transmissionType = editModal.querySelectorAll('input[name="transmissionType"]');
			transmissionType.forEach((transmission) => {
				if (transmission.value == pack.transmissionType) transmission.checked = true;
			});
			
			const addedByDefault = editModal.querySelectorAll('input[name="addedByDefault"]');
			addedByDefault.forEach((added) => {
				if (added.value == pack.addByDefault) added.checked = true;
			});
			
			editModal.querySelector('input[name="chargeCost"]').value = pack.cost;
			editModal.querySelector('input[name="availableFrom"]').value = (pack.availableFrom);
			editModal.querySelector('input[name="availableTo"]').value = pack.availableTo;
			document.querySelector('div#edit input[name="package_Id"]').value = pack.id;
		});
	});
	const removeButton = document.querySelectorAll("button.removeChannel");
	removeButton.forEach((rmButton) =>{
		let tableRow = rmButton.parentNode.parentNode.parentNode;
		let id =  tableRow.querySelector("input").value;
		rmButton.addEventListener('click', (event) => {
			document.querySelector('div#delete input[name = "remove_id"]').value = id;
		});
	});
	
	// remove ending comma
	channelNameRows.forEach(channelNames => {
		channelNames.innerText = channelNames.innerText.substring(0, channelNames.innerText.length - 1);
	});
	
	$('input[name="chargeCost"]').on("change", function() {
		this.value = validateDecimal(this.value, 0, 5000);
	});
	
	function validateDecimal(num, min, max) {
		num = Number.parseFloat(num).toFixed(2);
		if (isNaN(num)) num = min;
		if (num < min) num = min;
		else if (num > max) num = max;
		
		return num;
	}
});