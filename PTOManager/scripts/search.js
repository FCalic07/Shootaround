//You can type and search for the person in the dropdown menu aswell
document.getElementById('search-box').addEventListener('keyup', (e) => {
	const query = e.currentTarget.value;
	const employees = document.querySelectorAll('.dropdown-employees');

	for (let i = 0; i < employees.length; i++) {
		const employee = employees[i];

		if (employee.textContent.indexOf(query) >= 0) {
            employee.style.display = "block";
		} else {
            employee.style.display = "none";
		}
	}
});

const xIcon = document.querySelector("#search-x-icon");


xIcon.addEventListener('click', (e)=>{
	const dropdownBtn = document.querySelector(".selectedbtn");
	const selectedEmployee = e.target.parentElement.querySelector("p");

	dropdownBtn.removeChild(selectedEmployee);
	const searchBox = dropdownBtn.querySelector("#search-box");
	searchBox.style.display = "block";

	dropdownBtn.classList.remove('selectedbtn');
	dropdownBtn.classList.add('dropbtn');

	const dropdown = document.querySelector(".dropdown-after");
	dropdown.classList.add("dropdown");
	dropdown.classList.remove("dropdown-after");

	e.target.style.display = "none";

	const createButton = document.getElementById("create-pto-button");
	createButton.style.display = "none";

	const allPTOs = document.querySelectorAll('.pto');
     
	for (let i = 0; i < allPTOs.length; i++) {
	   allPTOs[i].style.display = "flex";
	}

	calendarFlag = false;

	calendar.classList.remove('activity');
	document.getElementById("create-pto-button").innerText = "Create PTO";
});



