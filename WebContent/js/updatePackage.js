window.addEventListener('load', () => {
	const editButtons = document.querySelectorAll("button.editChannel");
	const channelNameRows = document.querySelectorAll("td.channels")
	
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
				id: tableRow.querySelector("input").value
		}
		
		button.addEventListener('click', (event) => {
			let editModal = document.querySelector("div#edit .modal-body");
			editModal.querySelector('input[name="packageName"]').value = pack.name;
			editModal.querySelector('input[name="chargingType"]').value = pack.chargingType;
			editModal.querySelector('input[name="transmissionType"]').value = pack.transmissionType;
			editModal.querySelector('input[name="chargeCost"]').value = pack.cost;
			editModal.querySelector('input[name="availableFrom"]').value = (pack.availableFrom);
			editModal.querySelector('input[name="availableTo"]').value = pack.availableTo;
			//editModal.querySelector('input[name="addedByDef"]').value = pack.addedByDef;
			document.querySelector('div#edit input[name="package_Id"]').value = pack.id;
			//document.querySelector('')
			//console.log(document.querySelector('div#edit input[name="channel_Id"]').value);
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
	
});