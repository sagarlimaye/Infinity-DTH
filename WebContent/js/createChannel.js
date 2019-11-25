window.addEventListener('load', () => {
	$("#videoFreq").on("change", function() {
		this.value = validateDecimal(this.value, 40, 225);
	});
	
	$("#audioFreq").on("change", function() {
		this.value = validateDecimal(this.value, 45, 230);
	});
	
	$("#charge").on("change", function() {
		this.value = validateDecimal(this.value, 0, 500);
	});
	
	function validateDecimal(num, min, max) {
		num = Number.parseFloat(num).toFixed(2);
		if (isNaN(num)) num = min;
		if (num < min) num = min;
		else if (num > max) num = max;
		
		return num;
	}
	
});