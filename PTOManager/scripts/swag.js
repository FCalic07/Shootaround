const usernameInput = document.getElementById("username-input");
const emailInput = document.getElementById("email-input");
const passwordInput = document.getElementById("password-input");
const formLabels = document.querySelectorAll('.gray-labels');

/*
just basic label toggle for better looks
*/


for (let i = 0; i < formLabels.length; i++) {
	formLabels[i].nextElementSibling.addEventListener('focus', () => {
		formLabels[i].classList.add('white-labels');
		formLabels[i].classList.remove('gray-labels');
	})
	formLabels[i].nextElementSibling.addEventListener('blur', () => {
		formLabels[i].classList.add('gray-labels');
		formLabels[i].classList.remove('white-labels');
	})
}

const passwordLabel = document.getElementById("password-label");
passwordInput.addEventListener('focus', () => {
	passwordLabel.classList.add('white-labels');
	passwordLabel.classList.remove('gray-labels');
});
passwordInput.addEventListener('blur', () => {
	passwordLabel.classList.add('gray-labels');
	passwordLabel.classList.remove('white-labels');
});

const loginCircleIcon = document.querySelector("#login-button");
loginCircleIcon.setAttribute('signed', 'off');

loginCircleIcon.addEventListener('click', () => {
	const state = loginCircleIcon.getAttribute('signed');
	const label = document.getElementById("sign-in-label");

	if(state == 'off'){
		usernameInput.focus();
	}
	else if(state == 'in'){
		label.innerText = "Login"
		showLoggedOffContent();
		document.documentElement.scrollTop = 0;
	}

})
