$(document).ready(() => {
	listenForClicksInProjects();
	listenForClicksInClientView();
});

function listenForClicksInProjects() {
	$('button.js-proj').on('click touchstart', function(e) {
		console.log(e);
		let show = document.getElementById('invoices-show');
		if (show && show.innerHTML === '') {
			let projectId = e.currentTarget.dataset.id;
			fetch(`http://localhost:3000/projects/${projectId}.json`)
				.then(response => response.json())
				.then(data => {
					const invoiceArr = data.invoices;
					invoiceArr.sort((a, b) => (a.service > b.service ? 1 : -1));
					if (invoiceArr.length > 0) {
						invoiceArr.forEach(function(invoice, index) {
							const show2 = document.getElementById('invoices-show');
							let iDate = invoice.created_at.slice(0, 10);
							show2.innerHTML += `<p>Title: ${invoice.service}; Total: ${invoice.total}; Created: ${iDate}</p>`;
						});
					} else {
						document.getElementById(
							'invoices-show'
						).innerHTML = `<p><div class="alert alert-danger" role="alert">This project has no invoices</div></p>`;
					}
				});
		} else {
			document.getElementById('invoices-show').innerHTML = '';
		}
	});
}

function listenForClicksInClientView() {
	$('button.btn.btn-primary.btn-md.projects_view').on(
		'click touchstart',
		function(e) {
			const clientId = e.currentTarget.dataset.id;
			fetch(`http://localhost:3000/clients/${clientId}.json`)
				.then(response => response.json())
				.then(data => {
					const projectsArr = data.projects;
					let allProjects = document.getElementById('projects_show');
					if (projectsArr.length > 0 && allProjects.innerHTML === '') {
						projectsArr.forEach(function(project, index) {
							allProjects.innerHTML += `<tr><th>${index +
								1}</th><td><a href="http://localhost:3000/clients/${clientId}/projects/${
								project.id
							}">${project.description}</a></td></tr>`;
						});
					} else {
						allProjects.innerHTML = 'There are no projects to show';
					}
				});
		}
	);
}
