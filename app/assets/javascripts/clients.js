
// doc loading:

$(document).ready(()=>{
    console.log('Here I am in clients')
    listenForClick()
});



// <script type="text/javascript" chartset="utf-8">
// $(function(){
// 	$(".js-more").on("click", function(){
// 		let id = $(this).data("id");
// 		$.get("/clients/" + id + "/projects", function(project){
// 			let projects_list = "<strong>Has projects</strong>";
// 			if (projects === 'false'){
// 				projects_list = "<strong>No projects yet</strong>";
// 			}
// 		});
// 	})
// };

function listenForClick(){
	$('button.js-more').on('click', function(e){
		e.preventDefault()
		let clientId = e.currentTarget.dataset.id
		fetch(`http://localhost:3000/clients/${clientId}.json`)
	 	.then(response => response.json())
		.then(data => console.log(data));
		// getClients()
	})
}
// Display Functions
// const displayClients = (data) => {
//   let indexHtml = buildClientIndex(data);
//   $('#main-body').html(indexHtml);
//   data.forEach(client => {
//     let newClient = new Client(client);
//     let eachHtml = newClient.formatIndex();
//     $(`.status-${newClient.statusDiv}`).append(eachHtml);
//   });
// };


class Client {
	constructor(obj) {
		this.id = obj.id
		this.business_name = obj.business_name
		this.address = obj.address
		this.email = email
	}
}

// Client.prototype.clientHTML = function(){
// 	return (`
// 		<div>
// 		<h3>${this.business_name}</h3>
// 		<p><h4>${this.address}<h4></p>
// 		<p><h4>${this.email}</h4></p>
// 		</div>
// 		`)
// }

// Client.prototype.newClientForm = function(){
// 	return (`
// 		<strong>New Client Form</strong>
// 		<form>
// 		<input id='client-business-name' type='text' name='business-name'</input><br>
// 		<input type='text' name='address'></input><br>
// 		<input type='text' name='email'</input><br>
// 		<input type='submit' />
// 		</form>
// 		`)
// }


// document.addEventListener("turbolinks:load", function(){
//  const body = document.querySelector("body")
//  body.addEventListener("click", function(e) {
//    if(e.target.className === "js-more"){
//    	const clientId = e.target.dataset.id
//    	fetch(`http://localhost:3000/clients/${clientId}.json`)
//    	.then(resp => resp.json())
//    	.then(data => {
//    		const show = document.getElementById("client-show")
//    		show.innerHTML = `<p>Address: ${data.address}</p><p>Website: ${data.website}</p><p>Email: ${data.email}</p>`
//    	})
//    }
//  });
// });