

$(document).ready(()=>{
	console.log('Here I am in clients')
	listenForClick()
});

function listenForClick(){
	$('button.js-more').on('click', function(e){
		let clientId = e.currentTarget.dataset.id
		fetch(`http://localhost:3000/clients/${clientId}.json`)
	 	.then(response => response.json())
		.then(data => {
		const show = document.getElementById("client-show")
		const client = new Client(data)
		show.innerHTML = client.clientHTML();
		});
	});
}





class Client {
	constructor(obj) {
		this.id = obj.id
		this.website = obj.website
		this.address = obj.address
		this.email = obj.email
		this.projects = obj.projects
			}
		}


		function projectData (data){
			projectArr = [];
			data.projects.forEach(function (project) {
									projectArr.push(project.description);
								});
								return projectArr;
		}

Client.prototype.clientHTML = function(){
	return (`
		<div>
	 	<p>Information about this client:</p>
	 	<p><h4>Website: ${this.website}</h4></p>
		<p><h4>Email: ${this.email}</h4></p>
		<p><h4>Projects: ${projectData(this)}</h4></p>
		<p><h4>Address: ${this.address}<h4></p>
		<div class="mapouter">
		<div class="gmap_canvas">
		<iframe width="399" height="271" id="gmap_canvas" src="https://maps.google.com/maps?q=${this.address}&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>Werbung: <a href="https://www.jetzt-drucken-lassen.de">jetzt-drucken-lassen.de</a></div><style>.mapouter{position:relative;text-align:right;height:271px;width:399px;}.gmap_canvas {overflow:hidden;background:none!important;height:271px;width:399px;}</style>
		</div>
		</div>
		`)
}


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
