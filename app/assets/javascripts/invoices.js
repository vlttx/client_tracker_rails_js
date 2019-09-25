$(document).ready(() => {
	listenForInput();
	listenForPrint();
});

function listenForInput() {
	let typingTimer;
	let doneTypingInterval = 1500;

	//on keyup, start the countdown
	$('#invoice_amount').keyup(function() {
		clearTimeout(typingTimer);
		if ($('#invoice_amount').val()) {
			typingTimer = setTimeout(doneTyping, doneTypingInterval);
		}
	});

	//user is "finished typing" calculate
	function doneTyping() {
		let invoiceRate = document.getElementById('invoice_rate').value;
		let invoiceQuantity = document.getElementById('invoice_amount').value;
		let total = document.getElementById('invoice_total');
		total.value = invoiceRate * invoiceQuantity;
	}
}

function listenForPrint() {
	$('.download').on('click', function() {
		console.log('f');
		let noWay = document.getElementById('way');
		noWay.innerHTML = '';
	});
}
