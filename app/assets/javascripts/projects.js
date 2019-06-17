$(document).ready(()=>{
	console.log('Here I am in projects');
	listenForClicksInProjects()
});

function listenForClicksInProjects(){

		$('button.js-proj').on('click', function(e){
			let show = document.getElementById("invoices-show")
			if (show && show.innerHTML === ''){
				console.log("where show is zero")
				let projectId = e.currentTarget.dataset.id
				fetch(`http://localhost:3000/projects/${projectId}.json`)
				.then(response => response.json())
				.then(data => {
					const invoiceArr = data.invoices;
					if (invoiceArr.length > 0){
					invoiceArr.forEach(function (invoice, index) {
					const show2 = document.getElementById("invoices-show")
					let iDate = invoice.created_at.slice(0,10);
						show2.innerHTML += `<p>Title: ${invoice.service}; Total: ${invoice.total}; Created: ${iDate}</p>`;
				});
				}else{
					document.getElementById("invoices-show").innerHTML=`<p><div class="alert alert-danger" role="alert">This project has no invoices</div></p>`
				}

 					});
			}else{
				console.log("where show is NOT zero")
					document.getElementById("invoices-show").innerHTML=''
	}
});
}



	// let counter = 0
	// function listenForClicks(){
	// $('button.js-proj').on('click', function(e){
			

	// 			if (counter === 0){
	// 				let projectId = e.currentTarget.dataset.id
	// fetch(`http://localhost:3000/projects/${projectId}.json`)
	// .then(response => response.json())
	// .then(data => {

	// 	const invoiceArr = data.invoices;
	// 	invoiceArr.forEach(function (invoice, index) {
	// 	const show = document.getElementById("invoices-show")
	// 	let iDate = invoice.created_at.slice(0,10);
	// 		show.innerHTML += `<p>Title: ${invoice.service}; Total: ${invoice.total}; Created: ${iDate}</p>`;
	// 	});;
	// 	return counter+=1;
	// });
 					
	// 			}else if (counter%2 != 0){
	// 				document.getElementById("invoices-show").remove()
	// 				return counter+=1;

	// 			}else{
	// 			let projectId = e.currentTarget.dataset.id
 // 						fetch(`http://localhost:3000/projects/${projectId}.json`)
	// 					.then(response => response.json())
	// 					.then(data => {

	// 								const invoiceArr = data.invoices;
	// 								invoiceArr.forEach(function (invoice, index) {
	// 								const show = document.getElementById("invoices-show")
	// 								let iDate = invoice.created_at.slice(0,10);
 //  									show.innerHTML += `<p>Title: ${invoice.service}; Total: ${invoice.total}; Created: ${iDate}</p>`;
	// 								});;
	// 								return counter+=1;
	// 					});
	// 			};

	// 	});
	// };
