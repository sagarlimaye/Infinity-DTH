window.addEventListener('load', () => {
	const editButtons = document.querySelectorAll("button.editChannel");
	
	editButtons.forEach((button) => {
		let tableRow = button.parentNode.parentNode.parentNode;
		let channel = {
			name: tableRow.querySelector("td:nth-child(1)").innerHTML,
			band: tableRow.querySelector("td:nth-child(2)").innerHTML,
			videoFreq: tableRow.querySelector("td:nth-child(3)").innerHTML,
			audioFreq: tableRow.querySelector("td:nth-child(4)").innerHTML,
			chargeType: tableRow.querySelector("td:nth-child(5)").innerHTML,
			transmission: tableRow.querySelector("td:nth-child(6)").innerHTML,
			charge: tableRow.querySelector("td:nth-child(7)").innerHTML,
			id: tableRow.querySelector("input").value
		}
		
		button.addEventListener('click', (event) => {
			let editModal = document.querySelector("div#edit .modal-body");
			console.log(channel.chargeType, channel.transmission);
			console.log(editModal.querySelector('#chargeType').value, editModal.querySelector('#transmissionType').value);
			editModal.querySelector('input[name="channelName"]').value = channel.name;
			editModal.querySelector('input[name="channelBand"]').value = channel.band;
			editModal.querySelector('input[name="videoFreq"]').value = channel.videoFreq;
			editModal.querySelector('input[name="audioFreq"]').value = channel.audioFreq;
			if (channel.chargeType == "Paid") editModal.querySelector('#chargeType').value = channel.chargeType;
			if (channel.transmission == "HD") editModal.querySelector('#transmissionType').value = channel.transmission;
			editModal.querySelector('input[name="charge"]').value = channel.charge;
			document.querySelector('div#edit input[name="channel_Id"]').value = channel.id;
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
	
});