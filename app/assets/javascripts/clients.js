<script type="text/javascript" chartset="utf-8">
$(function(){
	$(".js-more").on("click", function(){
		let id = $(this).data("id");
		$.get("/clients/" + id + "/projects", function(project){
			let projects_list = "<strong>Has projects</strong>";
			if (projects === 'false'){
				projects_list = "<strong>No projects yet</strong>";
			}
		});
	})
};


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