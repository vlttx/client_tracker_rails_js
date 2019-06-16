

$(document).ready(()=>{
	console.log('Here I am in clients')
	listenForClick()
	listenForNewClientFormClick()
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
		this.business_name = obj.business_name
		this.website = obj.website
		this.address = obj.address
		this.email = obj.email
			}

		static newClientForm() {
		return (`
		<strong>New Client Form</strong><br>
		<form id="newc">
		<input id='client-business-name' type='text' name="client[business_name]" placeholder = "Business Name"></input><br>
		<input type='text' name="client[address]" placeholder = "Address"></input><br>
		<input type='text' name="client[website]" placeholder = "Website"</input><br>
		<input type='text' name="client[email]" placeholder = "Email"</input><br>
		<input type='submit' />
		</form>
		`)
}
		}


		function projectData (data){
			if (data.projects){
			projectArr = [];
			data.projects.forEach(function (project) {
									projectArr.push(project.description);
								});
								return projectArr;
		} else {
			return (`no projects at the moment`);
		}
	};

Client.prototype.clientHTML = function(){
	return (`
		<div>
	 	<p>Information about this client:</p>
	 	<p><h4>Business name: ${this.business_name}</h4></p>
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

function listenForNewClientFormClick(){
		$('button.js-new').on('click', function(e){
			e.preventDefault();
			let newClientForm = Client.newClientForm();
			let place = document.getElementById("new-client")
			place.innerHTML = newClientForm

				console.log('new form')
				$('#newc').on('submit', function(e){
				e.preventDefault();
				console.log(e)
				const values = $(this).serialize()
				$.post('/clients', values)
				.done(function(data){
				$('#thing').html('');
				let newClient = new Client(data);
				let newHtml = newClient.clientHTML();
				$('#thing').html(newHtml);
				});
});
			
	});
	
		$('#new_client').on('submit', function(e){
	e.preventDefault();
	const values = $(this).serialize()
	$.post('/clients', values)
	.done(function(data){
	$('#thing').html('');
	let newClient = new Client(data);
	let newHtml = newClient.clientHTML();
	$('#thing').html(newHtml);
	});


});

};


//$('#newc').remove();
//$('#newc button');
//$('#thing').append("<%= j render @client %>")



// Get the new note form via AJAX GET request
// function newNote() {
//  $(document).on("click", '.js-new-note', function(event) {
//   event.preventDefault();
//   $.get( $(event.target).attr('href'), function( data ) {
//    var note = new Note(data);
//    var noteRender = note.renderNewNote();
//    $("#new-note").html("");
//    $("#new-note").append(noteRender);
//   });
//  });
// }

// // Create a note via an AJAX POST request
// function createNote() {
//  $(document).on("submit", ".create-note", function(event) {
//   event.preventDefault();
//   var values = $(this).serialize();
//   var url = $(event.target).attr('action');
//   $.post(url, values, function( data ) {
//    $("#new-note").html("");
//    var note = new Note(data);
//    var noteRender = note.renderIndexNote();
//    $(".notes-block").prepend(noteRender);
//   });
//  }); 
// }


