let calendarFlag = false;
const calendar = document.querySelector('.calendar')

const month_names = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']

isLeapYear = (year) => {
    return (year % 4 === 0 && year % 100 !== 0 && year % 400 !== 0) || (year % 100 === 0 && year % 400 ===0)
}

getFebDays = (year) => {
    return isLeapYear(year) ? 29 : 28
}
// Function to generate the calendar for a given month and year
generateCalendar = (month, year) => {

    const calendar_days = calendar.querySelector('.calendar-days');
    const calendar_header_year = calendar.querySelector('#year');

    const days_of_month = [31, getFebDays(year), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    calendar_days.innerHTML = '';

    const currDate = new Date();  

    const curr_month = `${month_names[month]}`;
    month_picker.innerHTML = curr_month;
    calendar_header_year.innerHTML = year;

    // get first day of month
    
    const first_day = new Date(year, month, 1);
    const startingDay = (first_day.getDay() === 0) ? 6 : first_day.getDay() - 1;
    
    // Loop through each day in the month and fill the calendar
    for (let i = 0; i < days_of_month[month] + startingDay; i++) {
        const day = document.createElement('div');
        if (i >= startingDay) {
            day.classList.add('calendar-day-hover');
            day.innerHTML = i - startingDay + 1;
            if (i - startingDay + 1 === currDate.getDate() && year === currDate.getFullYear() && month === currDate.getMonth()) {
                day.classList.add('curr-date');
            }

            day.addEventListener('click', calendarDayClick);
        }
        calendar_days.appendChild(day);
    }
}

let ptoStart, ptoEnd;


function calendarDayClick(event) {
    //calendar click shouldn't do anything if not in process of making a pto
    if (!calendarFlag) {
        return;
    }

    const day = event.target.innerText;
    const month = month_names.indexOf(event.target.parentElement.parentElement.parentElement.querySelector("#month-picker").innerText) + 1;
    const year = event.target.parentElement.parentElement.parentElement.querySelector("#year").innerText;
    const choosenDate = [day, month, year];

    //first clicked date is start date
    if (!ptoStart) {
        ptoStart = choosenDate;
        console.log("pto start je " + ptoStart);
        event.target.classList.add('start-date');
    } 
    else if (!ptoEnd) {
        const choosen = new Date(`${month} ${day}, ${year}`);
        const start = new Date(`${ptoStart[1]} ${ptoStart[0]}, ${ptoStart[2]}`);

        if (choosen < start) {
            //TODO: change to modul maybe
            alert("Please select an end date that is after the start date.");
        } 
        else {
            ptoEnd = choosenDate;
            //easy way of "transfering" name and user-id
            createPTO(calendar.getAttribute('name'), calendar.getAttribute('user-id'), ptoStart, ptoEnd);

            //way of storing info in localStorage
            const storage = {
                name: calendar.getAttribute('name'),
                id: calendar.getAttribute('user-id'),
                startDate: ptoStart,
                endDate: ptoEnd
            };

            const createButton = document.getElementById("create-pto-button");
            createButton.style.display = "none";

            const storedFormData = JSON.parse(localStorage.getItem('formData')) || [];

            storedFormData.push(storage);

            localStorage.setItem('formData', JSON.stringify(storedFormData));

            calendarFlag = false;
            console.log("pto end je " + ptoEnd);

            calendar.classList.remove('activity');
            document.getElementById("create-pto-button").innerText = "Create PTO"

            document.querySelector('.start-date').classList.remove('start-date');
            //default
            ptoStart = undefined;
            ptoEnd = undefined;

        }
    }

}


const month_list = calendar.querySelector('.month-list')

//month names
month_names.forEach((e, index) => {
    const month = document.createElement('div')
    month.innerHTML = `<div data-month="${index}">${e}</div>`
    month.querySelector('div').onclick = () => {
        month_list.classList.remove('show')
        curr_month.value = index;
        generateCalendar(curr_month.value, curr_year.value);
    }
    month_list.appendChild(month)
})

const month_picker = calendar.querySelector('#month-picker')

month_picker.onclick = () => {
    month_list.classList.add('show')
}

const currDate = new Date()

const curr_month = {value: currDate.getMonth()}
const curr_year = {value: currDate.getFullYear()}

generateCalendar(curr_month.value, curr_year.value)

//generate newcalendar for every year (depends on is it a leap year or not)
document.querySelector('#prev-year').onclick = () => {
    --curr_year.value
    generateCalendar(curr_month.value, curr_year.value)
}

document.querySelector('#next-year').onclick = () => {
    ++curr_year.value
    generateCalendar(curr_month.value, curr_year.value)
}