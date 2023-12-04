// Seleccionando todos los elementos requeridos
const start_btn = document.querySelector(".start_btn button");
const info_box = document.querySelector(".info_box");
const exit_btn = info_box.querySelector(".buttons .quit");
const continue_btn = info_box.querySelector(".buttons .restart");
const quiz_box = document.querySelector(".quiz_box");
const result_box = document.querySelector(".result_box");
const option_list = document.querySelector(".option_list");
const time_line = document.querySelector("header .time_line");
const timeText = document.querySelector(".timer .time_left_txt");
const timeCount = document.querySelector(".timer .timer_sec");

// Si se hace clic en el botón de comenzar cuestionario
start_btn.onclick = ()=>{
    info_box.classList.add("activeInfo"); // mostrar el cuadro de información
}

// Si se hace clic en el botón de salir del cuestionario
exit_btn.onclick = ()=>{
    info_box.classList.remove("activeInfo"); // ocultar el cuadro de información
}

// Si se hace clic en el botón de continuar con el cuestionario
continue_btn.onclick = ()=>{
    info_box.classList.remove("activeInfo"); // ocultar el cuadro de información
    quiz_box.classList.add("activeQuiz"); // mostrar el cuadro de cuestionario
    showQuetions(0); // llamando a la función showQestions
    queCounter(1); // pasando 1 parámetro a queCounter
    startTimer(15); // llamando a la función startTimer
    startTimerLine(0); // llamando a la función startTimerLine
}

let timeValue =  15;
let que_count = 0;
let que_numb = 1;
let userScore = 0;
let counter;
let counterLine;
let widthValue = 0;

const restart_quiz = result_box.querySelector(".buttons .restart");
const quit_quiz = result_box.querySelector(".buttons .quit");

// Si se hace clic en el botón de reiniciar el cuestionario
restart_quiz.onclick = ()=>{
    quiz_box.classList.add("activeQuiz"); // mostrar el cuadro de cuestionario
    result_box.classList.remove("activeResult"); // ocultar el cuadro de resultados
    timeValue = 15;
    que_count = 0;
    que_numb = 1;
    userScore = 0;
    widthValue = 0;
    showQuetions(que_count); // llamando a la función showQestions
    queCounter(que_numb); // pasando el valor de que_numb a queCounter
    clearInterval(counter); // borrar el contador
    clearInterval(counterLine); // borrar counterLine
    startTimer(timeValue); // llamando a la función startTimer
    startTimerLine(widthValue); // llamando a la función startTimerLine
    timeText.textContent = "Tiempo restante"; // cambiar el texto de timeText a Tiempo restante
    next_btn.classList.remove("show"); // ocultar el botón siguiente
}

// Si se hace clic en el botón de salir del cuestionario
quit_quiz.onclick = ()=>{
    window.location.reload(); // recargar la ventana actual
}

const next_btn = document.querySelector("footer .next_btn");
const bottom_ques_counter = document.querySelector("footer .total_que");

// Si se hace clic en el botón Siguiente pregunta
next_btn.onclick = ()=>{
    if(que_count < questions.length - 1){ // si el recuento de preguntas es menor que la longitud total de preguntas
        que_count++; // incrementar el valor de que_count
        que_numb++; // incrementar el valor de que_numb
        showQuetions(que_count); // llamando a la función showQestions
        queCounter(que_numb); // pasando el valor de que_numb a queCounter
        clearInterval(counter); // borrar el contador
        clearInterval(counterLine); // borrar counterLine
        startTimer(timeValue); // llamando a la función startTimer
        startTimerLine(widthValue); // llamando a la función startTimerLine
        timeText.textContent = "Tiempo restante"; // cambiar el texto de timeText a Tiempo restante
        next_btn.classList.remove("show"); // ocultar el botón siguiente
    } else {
        clearInterval(counter); // borrar el contador
        clearInterval(counterLine); // borrar counterLine
        showResult(); // llamando a la función showResult
    }
}

// Obteniendo preguntas y opciones desde el array
function showQuetions(index){
    const que_text = document.querySelector(".que_text");

    // creando una nueva etiqueta span y div para la pregunta y la opción y pasando el valor usando el índice del array
    let que_tag = '<span>'+ questions[index].numb + ". " + questions[index].question +'</span>';
    let option_tag = '<div class="option"><span>'+ questions[index].options[0] +'</span></div>'
    + '<div class="option"><span>'+ questions[index].options[1] +'</span></div>'
    + '<div class="option"><span>'+ questions[index].options[2] +'</span></div>'
    + '<div class="option"><span>'+ questions[index].options[3] +'</span></div>';
    que_text.innerHTML = que_tag; // agregando nueva etiqueta span dentro de que_tag
    option_list.innerHTML = option_tag; // agregando nueva etiqueta div dentro de option_tag

    const option = option_list.querySelectorAll(".option");

    // establecer el atributo onclick para todas las opciones disponibles
    for(i=0; i < option.length; i++){
        option[i].setAttribute("onclick", "optionSelected(this)");
    }
}
// creando las nuevas etiquetas div para los íconos
let tickIconTag = '<div class="icon tick"><i class="fas fa-check"></i></div>';
let crossIconTag = '<div class="icon cross"><i class="fas fa-times"></i></div>';

// si el usuario hace clic en una opción
function optionSelected(answer){
    clearInterval(counter); // borrar el contador
    clearInterval(counterLine); // borrar counterLine
    let userAns = answer.textContent; // obtener la opción seleccionada por el usuario
    let correcAns = questions[que_count].answer; // obtener la respuesta correcta del array
    const allOptions = option_list.children.length; // obtener todos los elementos de opción

    if(userAns == correcAns){ // si la opción seleccionada por el usuario es igual a la respuesta correcta del array
        userScore += 1; // aumentar el valor de la puntuación en 1
        answer.classList.add("correct"); // agregar color verde a la opción seleccionada correctamente
        answer.insertAdjacentHTML("beforeend", tickIconTag); // agregar ícono de marca a la opción seleccionada correctamente
        console.log("Respuesta correcta");
        console.log("Tus respuestas correctas = " + userScore);
    } else {
        answer.classList.add("incorrect"); // agregar color rojo a la opción seleccionada incorrectamente
        answer.insertAdjacentHTML("beforeend", crossIconTag); // agregar ícono de cruz a la opción seleccionada incorrectamente
        console.log("Respuesta incorrecta");

        for(i=0; i < allOptions; i++){
            if(option_list.children[i].textContent == correcAns){ // si hay una opción que coincide con la respuesta del array
                option_list.children[i].setAttribute("class", "option correct"); // agregar color verde a la opción coincidente
                option_list.children[i].insertAdjacentHTML("beforeend", tickIconTag); // agregar ícono de marca a la opción coincidente
                console.log("Respuesta correcta seleccionada automáticamente.");
            }
        }
    }
    for(i=0; i < allOptions; i++){
        option_list.children[i].classList.add("disabled"); // una vez que el usuario selecciona una opción, deshabilitar todas las opciones
    }
    next_btn.classList.add("show"); // mostrar el botón siguiente si el usuario seleccionó alguna opción
}

function showResult(){
    info_box.classList.remove("activeInfo"); // ocultar el cuadro de información
    quiz_box.classList.remove("activeQuiz"); // ocultar el cuadro de cuestionario
    result_box.classList.add("activeResult"); // mostrar el cuadro de resultados
    const scoreText = result_box.querySelector(".score_text");
    if (userScore > 3){ // si el usuario obtuvo más de 3 respuestas correctas
        // creando una nueva etiqueta span y pasando el número de respuestas correctas del usuario y el número total de preguntas
        let scoreTag = '<span>Obtuviste <p>'+ userScore +'</p> de <p>'+ questions.length +' 🎉'+'</p></span>';
        scoreText.innerHTML = scoreTag;  // agregando nueva etiqueta span dentro de score_Text
    } else if(userScore > 1){ // si el usuario obtuvo más de 1 respuesta correcta
        let scoreTag = '<span>Obtuviste <p>'+ userScore +'</p> de <p>'+ questions.length +' 😎'+'</p></span>';
        scoreText.innerHTML = scoreTag;
    } else { // si el usuario obtuvo menos de 1 respuesta correcta
        let scoreTag = '<span>Obtuviste <p>'+ userScore +'</p> de <p>'+ questions.length +' 😐'+'</p></span>';
        scoreText.innerHTML = scoreTag;
    }
}

function startTimer(time){
    counter = setInterval(timer, 1000);
    function timer(){
        timeCount.textContent = time; // cambiar el valor de timeCount con el valor de tiempo
        time--; // decrementar el valor de tiempo
        if(time < 9){ // si el temporizador es menor que 9
            let addZero = timeCount.textContent;
            timeCount.textContent = "0" + addZero; // agregar un 0 antes del valor de tiempo
        }
        if(time < 0){ // si el temporizador es menor que 0
            clearInterval(counter); // borrar el contador
            timeText.textContent = "Se acabó el tiempo"; // cambiar el texto de timeText a tiempo agotado
            const allOptions = option_list.children.length; // obtener todos los elementos de opción
            let correcAns = questions[que_count].answer; // obtener la respuesta correcta del array
            for(i=0; i < allOptions; i++){
                if(option_list.children[i].textContent == correcAns){ // si hay una opción que coincide con la respuesta del array
                    option_list.children[i].setAttribute("class", "option correct"); // agregar color verde a la opción coincidente
                    option_list.children[i].insertAdjacentHTML("beforeend", tickIconTag); // agregar ícono de marca a la opción coincidente
                    console.log("Tiempo agotado: Respuesta correcta seleccionada automáticamente.");
                }
            }
            for(i=0; i < allOptions; i++){
                option_list.children[i].classList.add("disabled"); // una vez que el usuario selecciona una opción, deshabilitar todas las opciones
            }
            next_btn.classList.add("show"); // mostrar el botón siguiente si el usuario seleccionó alguna opción
        }
    }
}

function startTimerLine(time){
    counterLine = setInterval(timer, 29);
    function timer(){
        time += 1; // aumentar el valor de tiempo en 1
        time_line.style.width = time + "px"; // aumentar el ancho de time_line con px según el valor de tiempo
        if(time > 549){ // si el valor de tiempo es mayor que 549
            clearInterval(counterLine); // borrar counterLine
        }
    }
}

function queCounter(index){
    // creando una nueva etiqueta span y pasando el número de pregunta y el total de preguntas
    let totalQueCounTag = '<span><p>'+ index +'</p> de <p>'+ questions.length +'</p> Preguntas</span>';
    bottom_ques_counter.innerHTML = totalQueCounTag;  // agregando nueva etiqueta span dentro de bottom_ques_counter
}
