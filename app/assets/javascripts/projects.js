$(document).ready(()=>{
	console.log('Here I am in projects');
	listenForClicks()
});

// function listenForClicks(){
// 		$('button.js-proj').on('click', function(e){
// 			if (show === ''){
// 				let projectId = e.currentTarget.dataset.id
// 				fetch(`http://localhost:3000/projects/${projectId}.json`)
// 				.then(response => response.json())
// 				.then(data => {
// 					const invoiceArr = data.invoices;
// 					invoiceArr.forEach(function (invoice, index) {
// 					const show = document.getElementById("invoices-show")
// 					let iDate = invoice.created_at.slice(0,10);
// 						show.innerHTML += `<p>Title: ${invoice.service}; Total: ${invoice.total}; Created: ${iDate}</p>`;
// 				});
//  					});
// 			}else{
// 					document.getElementById("invoices-show").remove()
// 	}
// });
// }



	let counter = 0
	function listenForClicks(){
	$('button.js-proj').on('click', function(e){
			

				if (counter === 0){
					let projectId = e.currentTarget.dataset.id
	fetch(`http://localhost:3000/projects/${projectId}.json`)
	.then(response => response.json())
	.then(data => {

		const invoiceArr = data.invoices;
		invoiceArr.forEach(function (invoice, index) {
		const show = document.getElementById("invoices-show")
		let iDate = invoice.created_at.slice(0,10);
			show.innerHTML += `<p>Title: ${invoice.service}; Total: ${invoice.total}; Created: ${iDate}</p>`;
		});;
		return counter+=1;
	});
 					
				}else if (counter%2 != 0){
					document.getElementById("invoices-show").remove()
					return counter+=1;

				}else{
				let projectId = e.currentTarget.dataset.id
 						fetch(`http://localhost:3000/projects/${projectId}.json`)
						.then(response => response.json())
						.then(data => {

									const invoiceArr = data.invoices;
									invoiceArr.forEach(function (invoice, index) {
									const show = document.getElementById("invoices-show")
									let iDate = invoice.created_at.slice(0,10);
  									show.innerHTML += `<p>Title: ${invoice.service}; Total: ${invoice.total}; Created: ${iDate}</p>`;
									});;
									return counter+=1;
						});
				};

		});
	};
