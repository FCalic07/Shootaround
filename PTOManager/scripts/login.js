const form = document.querySelector("form");
const alertBox = document.querySelector(".alert-box-hidden");
const alertBoxXIcon = alertBox.querySelector("i");
const alertMessage = alertBox.querySelector("p");

form.addEventListener('submit', handleFormSubmit);

function handleFormSubmit(event) {
	const password = passwordInput.value;
	let message = "";

	//can be simpler but it works for now
	if(password.length > 8){
		if(containsNumber(password)){
			if(containsUppercase(password)){
				if(containsLowercase(password)){
					if(containsSpecialCharacter(password)){

						setCookie(usernameInput.value, emailInput.value, password);

					} else{
						message =("Atleast 1 special character required");
					}
				} else{
					message = ("Atleast 1 lowercase letter required")
				}
			} else{
				message = "Atleast 1 uppercase letter required"
			}
		} else{
			message = "Atleast 1 number required";
		}
	} else{
		message = "Atleast 8 characters required";
	}

	//if message exists
	if(message.length > 0){
		event.preventDefault();
		
		alertBox.classList.add("alert-box");
		alertBox.classList.remove("alert-box-hidden");
		alertMessage.innerText = message;
		passwordInput.focus();
	}

}

alertBoxXIcon.addEventListener('click', () =>{
	alertBox.classList.remove("alert-box");
	alertBox.classList.add("alert-box-hidden");
})

function containsNumber(str){
	return /[0-9]/.test(str);
}
function containsUppercase(str) {
	return /[A-Z]/.test(str);
}
function containsLowercase(str) {
	return /[a-z]/.test(str);
}
function containsSpecialCharacter(str){
	return /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/.test(str);
}

//function for password input
const slashEyeIcon = document.querySelector(".fa-eye-slash");
slashEyeIcon.addEventListener('click', ()=>{
	if(passwordInput.type == 'password'){
		passwordInput.type = 'text';
		slashEyeIcon.classList.remove("fa-eye-slash");
		slashEyeIcon.classList.add("fa-eye");
	}
	else{
		passwordInput.type = 'password';
		slashEyeIcon.classList.add("fa-eye-slash");
		slashEyeIcon.classList.remove("fa-eye");

	}

});