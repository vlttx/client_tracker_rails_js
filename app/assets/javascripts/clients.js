$(document).ready(()=>{
	
	listenForClick();
	listenForNewClientFormClick();
});

function listenForClick(){
	let counter = 0;
	if (counter===0){
	$('button.js-more').on('click', function(e){
		e.preventDefault();
		let clientId = e.currentTarget.dataset.id
		fetch(`http://localhost:3000/clients/${clientId}.json`)
	 	.then(response => response.json())
		.then(data => {
		const show = document.getElementById("client-show")
		const client = new Client(data)
		let newForm = document.getElementById('newc');
			if (newForm){
			newForm.style.display = "none"
			show.innerHTML = client.clientHTML();
			$(this).attr("display", "inline-block")
			hideMe();

			}else{
				show.innerHTML = client.clientHTML();
				$(this).attr("display", "inline-block")
				hideMe();
			}

	});
	});
	}else{
		$('button.js-more').on('click', function(){
		const show = document.getElementById("client-show")
		show.innerHTML = '';
		
	});
		counter -=1;
}
}


class Client {
	constructor(obj) {
		this.id = obj.id
		this.business_name = obj.business_name
		this.website = obj.website
		this.address = obj.address
		this.email = obj.email
		this.projects = obj.projects
			}

		static newClientForm() {
		return (`
		<form id="newc" style="display:inline-block">
		<strong>New Client Form</strong><br>
		<input id='client-business-name' type='text' name="client[business_name]" placeholder = "Business Name*" required></input>
		<input type='text' name="client[address]" placeholder = "Address"></input>
		<input type='text' name="client[website]" placeholder = "Website"</input>
		<input type='text' name="client[email]" placeholder = "Email"</input><br>
		<input type='submit' value= "SUBMIT" class="btn btn-success btn-md" />
		<button type="button" id="cancelMe" onclick="toggle('newc')" class="btn btn-danger btn-md" style="display:inline-block">CANCEL</button>
		</form>
		<br>
		
		`)
		}
}

function hideMe(){
	if (document.getElementById('client-show').innerHTML != ""){
		$('button#hide.btn.btn-danger.btn-md').on('click', function(e){
		e.preventDefault()
		let clientView = document.getElementById('client-show');
		clientView.innerHTML = ''
	})
}else{
	listenForClick();
}
}

function toggle(divId) {
  	let divN = document.getElementById(divId);
  	// Toggle 
  	divN.style.display == "inline-block" ? divN.style.display = "none" : divN.style.display = "inline-block"; 
}


function projectData (data){
	if (data.projects){
	projectArr = [];
	data.projects.forEach(function (project) {
							projectArr.push(project.description);
						});
						return projectArr;
} else {
	return (`No projects at the moment`);
}
};

Client.prototype.clientHTML = function(){
	return (`
		<div class="client-show" style="display:inline-block">
	 	<p><h4><strong>Client information:</strong></p></h4>
	 	<p><h5><strong>Business name: </strong>${this.business_name}</h5></p>
	 	<p><h5><strong>Website: </strong>${this.website}</h5></p>
		<p><h5><strong>Email: </strong>${this.email}</h5></p></p>
		<p><h5><strong>Projects: ${projectData(this)}</h5></strong></p>
		<p><h5><strong>Address: ${this.address}<h5></strong></p>
		<div class="mapouter">
		<div class="gmap_canvas">
		<iframe width="399" height="271" id="gmap_canvas" src="https://maps.google.com/maps?q=${this.address}&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>Werbung: <a href="https://www.jetzt-drucken-lassen.de">jetzt-drucken-lassen.de</a></div><style>.mapouter{position:relative;text-align:right;height:271px;width:399px;}.gmap_canvas {overflow:hidden;background:none!important;height:271px;width:399px;}</style>
		</div>
		</div>
		<br>
		<button id="hide" class="btn btn-danger btn-md">CLOSE</button>
		</div>
		`)
}



function listenForNewClientFormClick(){
		$('button.js-new').on('click', function(e){
			e.preventDefault();
			let newClientForm = Client.newClientForm();
			let place = document.getElementById("new-client")
			place.innerHTML = newClientForm
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
	
	$('#new-client').on('submit', function(e){
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


