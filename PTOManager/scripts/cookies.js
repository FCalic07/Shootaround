//basic function to add cookies

function setCookie(username, email, password) {
	document.cookie = `username=${username}`;
	document.cookie = `email=${email}`;
	document.cookie = `password=${password}`;
}


//used every time website loads because i didn't want it to change to a different page
function checkCookie() {
	const username = getCookie('username');
	const email = getCookie('email');
	const password = getCookie('password');

	if(username && email && password){
		showLoggedInContent();

		const loginCircleIcon = document.querySelector("#login-button");
		loginCircleIcon.setAttribute('signed', 'in');
		const label = document.getElementById("sign-in-label");	
		label.innerText = "Log off"
	}
	else {
		showLoggedOffContent();
	}
}

function getCookie(variable){
	const cookies = document.cookie.split('; ');
    for (const cookie of cookies) {
        const [cookieName, cookieValue] = cookie.split('=');
        if (cookieName === variable) {
            return decodeURIComponent(cookieValue);
        }
    }
    return null;
}

function showLoggedInContent() {
	const container = document.getElementById("container");
	container.style.display = "none";
	const username = getCookie('username')

	const welcomePage = document.querySelector(".welcome-page");
	welcomePage.innerHTML = `<h1>Welcome, ${username}<h1/>`;
	welcomePage.classList.add("welcome-page-after-login");
	welcomePage.classList.remove("welcome-page");
}

function showLoggedOffContent() {
	const container = document.getElementById("container");
	const loggedContainer = document.getElementById("logged-in-container");
	loggedContainer.style.display ="none";
	container.style.display = "flex";

	//delete cookie
	deleteCookies(["username", "email", "password"]);
	

	const welcomePage = document.querySelector(".welcome-page-after-login");
	welcomePage.innerHTML = `<h1>Welcome stranger<h1/>
							 <h1>Please sign in<h1/>`;
	welcomePage.classList.add("welcome-page");
	welcomePage.classList.remove("welcome-page-after-login");
	const loginCircleIcon = document.querySelector("#login-button");
	loginCircleIcon.setAttribute('signed', 'off');

}

function deleteCookies(cookieNames) {
    // Get all cookies
    const cookies = document.cookie.split(";");

    // Loop through each cookie
    for (let i = 0; i < cookies.length; i++) {
        const cookie = cookies[i].trim(); // Trim whitespace
    	const eqPos = cookie.indexOf("=");
        const name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
        
        // Check if this cookie's name matches any of the names provided
        if (cookieNames.includes(name)) {
            // Set its expiration date to a past time
            document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
        }
    }
}
