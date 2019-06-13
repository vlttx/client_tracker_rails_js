$(document).ready(()=>{
	console.log('Here I am in projects');
});

function listenForClick(){
	$('button.js-proj').on('click', function(e){
		// e.preventDefault()
		console.log(e)
		// let clientId = e.currentTarget.dataset.id
		// fetch(`http://localhost:3000/clients/${clientId}.json`)
	 // 	.then(response => response.json())
		// .then(data => {
		// const show = document.getElementById("client-show")
		// let client = displayClient(data);
		// show.innerHTML = client;
		// console.log(show);
		// });
	})
}