

$(document).ready(()=>{
	let counter = 0;
	console.log('Here I am in clients')
	listenForClick();
	listenForNewClientFormClick();
	hideMe();
	// cancelForm();

});

function listenForClick(){
	if (counter===0){
	$('button.js-more').on('click', function(e){
		let clientId = e.currentTarget.dataset.id
		fetch(`http://localhost:3000/clients/${clientId}.json`)
	 	.then(response => response.json())
		.then(data => {
		const show = document.getElementById("client-show")
		const client = new Client(data)
		show.innerHTML = client.clientHTML();
	
	});
		counter+=1
	});
	}else{
		$('button.js-more').on('click', function(e){
		const show = document.getElementById("client-show")
		show.innerHTML = '';
		
	});
		counter -=1;
}
}


function hideMe(){
	$('#client-show').on('click', function(e){
			document.getElementById("client-show").innerHTML = ''
	 });
}

// function cancelForm(){
// 	console.log("Cancel is here")
// 	$('#cancelMe').on('click', function(e){
// 		console.log(e)
// 			document.getElementById("newc").innerHTML = ''
// 			document.getElementById("cancel").remove();
// 	 });
// }


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
		<form id="newc" style="display:inline-block">
		<strong>New Client Form</strong><br>
		<input id='client-business-name' type='text' name="client[business_name]" placeholder = "Business Name*" required></input>
		<input type='text' name="client[address]" placeholder = "Address"></input>
		<input type='text' name="client[website]" placeholder = "Website"</input>
		<input type='text' name="client[email]" placeholder = "Email"</input><br>
		<input type='submit' value= "SUBMIT" class="btn btn-success btn-md" />
		<button type="button" id="cancelMe" class="btn btn-danger btn-md" style="display:inline-block">CANCEL</button>
		</form>
		<br>
		
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
	 	<p><h4>Client information:</p></h4>
	 	<p><h5></p>Business name: ${this.business_name}</h5></p></p>
	 	<p><h5></p>Website: ${this.website}</h5></p></p>
		<p><h5></p>Email: ${this.email}</h5></p></p>
		<p><h5></p>Projects: ${projectData(this)}</h5></p></p>
		<p><h5></p>Address: ${this.address}<h5></p></p>
		<div class="mapouter">
		<div class="gmap_canvas">
		<iframe width="399" height="271" id="gmap_canvas" src="https://maps.google.com/maps?q=${this.address}&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>Werbung: <a href="https://www.jetzt-drucken-lassen.de">jetzt-drucken-lassen.de</a></div><style>.mapouter{position:relative;text-align:right;height:271px;width:399px;}.gmap_canvas {overflow:hidden;background:none!important;height:271px;width:399px;}</style>
		</div>
		</div>
		<br>
		<button id="hide" class="btn btn-primary btn-md">CLOSE</button>
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


