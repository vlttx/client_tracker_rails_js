$(document).ready(()=>{
	console.log('Here I am in projects');
});
	let counter = 0
function listenForClick(){
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

				}else{
					alert('The list has already loaded!');
				};
		});
	};

// Display Function
	 // const displayInvoices = (data) => {
	 // 	return (`
	 // 	<div>
	 // 	<p>Invoices for this project:</p>
	 // 	<p><h4>Service: ${data.website}</h4></p>
		// <p><h4>Total: ${data.email}</h4></p>
		// </div>
		// `)
	 // }