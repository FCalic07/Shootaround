const employees = [];

//RENDER ALL PTOs
document.addEventListener('DOMContentLoaded', ()=>{
    const storedDate = JSON.parse(localStorage.getItem('formData'));

    for (let i = 0; i < storedDate.length; i++) {
        
        createPTO(storedDate[i].name, storedDate[i].id, storedDate[i].startDate, storedDate[i].endDate);
        
    }
});

//FETCH USERS
document.addEventListener('DOMContentLoaded', async function () {
	try {
		const res = await fetch("https://jsonplaceholder.typicode.com/users", { method: "GET" });
		const data = await res.json();

        for (let i = 0; i < data.length; i++) {
           employees.push([data[i].name, data[i].id]);

           const dropdownContent = document.querySelector(".dropdown-content");
           const employee = document.createElement("a");
           employee.href = "#";
           employee.classList.add("dropdown-employees");
           employee.innerText = data[i].name;
           employee.setAttribute('user-id', data[i].id);
           dropdownContent.appendChild(employee);

           employee.addEventListener('click', handleEmployeeSelected);
        }

	} catch (err) {
		alert(err);
	}

});

// Function to handle employee selection from dropdown menu
function handleEmployeeSelected(event){
    // Flag to check if there are any PTOs for the selected employee
    let ptoFlag; 

	const selectedEmployeeName = document.createElement("p");
	selectedEmployeeName.innerText = event.target.innerText;

	const dropdownBtn = document.querySelector(".dropbtn");
	dropdownBtn.classList.add('selectedbtn');
	dropdownBtn.classList.remove('dropbtn');
	const xIcon = document.getElementById("search-x-icon");
	xIcon.style.display = "block";

	const dropdown = document.querySelector(".dropdown");
	dropdown.classList.add("dropdown-after");
	dropdown.classList.remove("dropdown");

	const searchBox = dropdownBtn.querySelector("#search-box");
	searchBox.style.display = "none";
	dropdownBtn.appendChild(selectedEmployeeName);

    const userId = event.target.getAttribute('user-id');
    dropdownBtn.setAttribute('user-id', userId);

    const allPTOs = document.querySelectorAll('.pto');
    
     //DO PTOs exists
     for (let i = 0; i < allPTOs.length; i++) {
        if(allPTOs[i].getAttribute('user-id') == userId){
            //pto exists
            ptoFlag = true;
        }
        else { //either way don't show other ptos.
        allPTOs[i].style.display = "none";
        }
     }

     //pto doesn't exist
     if(!ptoFlag){
        const createButton = document.getElementById("create-pto-button");
        createButton.style.display = "block";

        createButton.addEventListener('click', handleCreateButtonClick);
     }

}

function handleCreateButtonClick(e) {
    const employee = document.querySelector(".selectedbtn");
    calendar.setAttribute('name', employee.innerText);
    calendar.setAttribute('user-id', employee.getAttribute('user-id'));

    calendarFlag = true;
    calendar.classList.add('activity');
    e.target.innerText = "Choose date";
}

// Function to create a new PTO entry
function createPTO(name, id, startDate, endDate) {
    const displayContainer = document.getElementById("display-pto");

    //CHECK IF THERE'S PTO FOR THAT PERSON
    const allPTOContainers = document.querySelectorAll(".pto");
    for (let i = 0; i < allPTOContainers.length; i++) {
        if(allPTOContainers[i].getAttribute('user-id') == id){
            buildPTO(allPTOContainers[i], startDate, endDate);
            return;   
        }
    }

    const ptoTemplate = document.getElementById("pto-template");
    const ptoNode = document.importNode(ptoTemplate.content , true);
    const pto = ptoNode.querySelector(".pto");
    displayContainer.appendChild(pto);

    pto.querySelector(".pto-title").textContent = name;
    pto.setAttribute("user-id", id);

    pto.querySelector(".plus-icon").addEventListener('click', handlePlusIconClick);

    buildPTO(pto, startDate, endDate);
}

function buildPTO(pto, startDate, endDate) {
    const today = new Date();
    const start = new Date(startDate[2], startDate[1] - 1, startDate[0]); // Month is 0-based index in JavaScript Date object
    const end = new Date(endDate[2], endDate[1] - 1, endDate[0]); // Month is 0-based index in JavaScript Date object

    let imageSource;
    if(startDate[1] == 12 || startDate[1] == 1 || startDate[1] == 2){
        imageSource = 'https://www.climaterealityproject.org/sites/default/files/styles/twitter/public/timothy-eberly-lhm2nldtc9g-unsplash.jpg?h=ec041e41&itok=IzDiEf0g' //ZIMA
    }
    else if(startDate[1] == 3 || startDate[1] == 4 || startDate[1] == 5){
        imageSource = 'images/spring.jpg' 
    }
    else if(startDate[1] == 6 || startDate[1] == 7 || startDate[1] == 8){
        imageSource = 'https://hips.hearstapps.com/hmg-prod/images/champagne-beach-espiritu-santo-island-vanuatu-royalty-free-image-1655672510.jpg?crop=1.00xw:0.755xh;0,0.173xh&resize=1200:*'
    }
    else if(startDate[1] == 9 || startDate[1] == 10 || startDate[1] == 11){
        imageSource = 'images/autumn.jpg' //JESEN
    }

    //CHECK IS IT PAST, CURRENT OR UPCOMING PTO
    if (end < today) {
        const pastPTOcontainer = pto.querySelector(".past-pto");
        if(pastPTOcontainer.classList.contains("hidden")){
            pastPTOcontainer.classList.remove("hidden");
        }

        const pastPTO = document.createElement("div");
        pastPTO.classList.add('pto-image');
        pastPTO.setAttribute('start', startDate);
        pastPTO.setAttribute('end', endDate);
        pastPTO.innerHTML = `
            <img src="${imageSource}">
            <span class="pto-date">${startDate[0]}.${startDate[1]}.${startDate[2]} - ${endDate[0]}.${endDate[1]}.${endDate[2]}</span>
            <i class="fa fa-times x-icon"></i>`
        pastPTO.querySelector(".x-icon").addEventListener('click', handleXIconClick);
        pastPTOcontainer.appendChild(pastPTO);


    } else if (start <= today && end >= today) {
        const currentPTOcontainer = pto.querySelector(".current-pto");
        if(currentPTOcontainer.classList.contains("hidden")){
            currentPTOcontainer.classList.remove("hidden");
        }

        const currentPTO = document.createElement("div");
        currentPTO.classList.add('pto-image');
        currentPTO.setAttribute('start', startDate);
        currentPTO.setAttribute('end', endDate);
        currentPTO.innerHTML = `
            <img src="${imageSource}">
            <span class="pto-date">${startDate[0]}.${startDate[1]}.${startDate[2]} - ${endDate[0]}.${endDate[1]}.${endDate[2]}</span>
            <i class="fa fa-times x-icon"></i>`
        currentPTO.querySelector(".x-icon").addEventListener('click', handleXIconClick);
        currentPTOcontainer.appendChild(currentPTO);

    } else {
        const upcomingPTOcontainer = pto.querySelector(".upcoming-pto");
        if(upcomingPTOcontainer.classList.contains("hidden")){
            upcomingPTOcontainer.classList.remove("hidden");
        }

        const upcomingPTO = document.createElement("div");
        upcomingPTO.classList.add('pto-image');
        upcomingPTO.setAttribute('start', startDate);
        upcomingPTO.setAttribute('end', endDate);
        upcomingPTO.innerHTML = `
            <img src="${imageSource}">
            <span class="pto-date">${startDate[0]}.${startDate[1]}.${startDate[2]} - ${endDate[0]}.${endDate[1]}.${endDate[2]}</span>
            <i class="fa fa-times x-icon"></i>`

        upcomingPTO.querySelector(".x-icon").addEventListener('click', handleXIconClick);
        upcomingPTOcontainer.appendChild(upcomingPTO);
    }
}

function handlePlusIconClick(event){

    calendar.setAttribute('name', event.target.parentElement.parentElement.querySelector(".pto-title").innerText);
    calendar.setAttribute('user-id', event.target.parentElement.parentElement.getAttribute('user-id'));
    calendar.classList.add('activity');

    calendarFlag = true;
}

//DELETING A SINGLE PTO
function handleXIconClick(event){
    const ptoImage = event.target.parentElement;
    const ptoContainer = ptoImage.parentElement;
    const pto = ptoContainer.parentElement.parentElement;
    
    const userId = pto.getAttribute('user-id');
    const start = ptoImage.getAttribute('start');
    const end = ptoImage.getAttribute('end');

    ptoImage.remove();
    //ARE THERE ANY PTOS OF THE SAME TYPE
    let check = ptoContainer.querySelectorAll('.pto-image');
    if(!check.length){
        ptoContainer.remove();

        check = pto.querySelectorAll('.pto-image');
        //ARE THERE ANY PTOS IN GENERAL FOR THAT PERSON
        if(!check.length){
            pto.remove();

            const selectedbtn = document.querySelector(".selectedbtn");
            if(selectedbtn){
                const createButton = document.getElementById("create-pto-button");
                createButton.addEventListener('click', handleCreateButtonClick); //just in case
                createButton.style.display = "block";
            }
        }
    }

    //REMOVE IT FROM LOCALSTORAGE
    const storedFormData = JSON.parse(localStorage.getItem('formData'));
    console.log(start + " " + end);
    storedFormData.forEach((element, index) => {
        if(element.id == userId && element.startDate == start && element.endDate == end){
            console.log(element);
            storedFormData.splice(index, 1);
        } 
    });

    localStorage.clear();
    localStorage.setItem('formData', JSON.stringify(storedFormData));
}
