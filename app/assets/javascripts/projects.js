$(document).ready(()=>{
	console.log('Here I am in projects');
	listenForClicks()
});
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

				}else{
					alert('The list has already loaded!');
				};
		});
	};

