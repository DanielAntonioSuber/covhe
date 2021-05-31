const buttons = document.querySelectorAll(".formulario__btn");
const formulario = document.getElementById("formulario");
const inputs = document.querySelectorAll("#formulario input");
const nombre = document.getElementById("nombre");
const apellido = document.getElementById("apellido");
const btnSubmit = document.querySelector(".formulario__smt");
const expresiones = {
    usuario: /^[a-zA-Z0-9\_\-]{4,16}$/, // Letras, numeros, guion y guion_bajo
    nombre: /^[a-zA-ZÀ-ÿ\s]{1,40}$/, // Letras y espacios, pueden llevar acentos.
    password: /^.{4,12}$/, // 4 a 12 digitos.
    correo: /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/,
    telefono: /^\d{7,14}$/, // 7 a 14 numeros.
};

const campos = {
    usuario: true,
    nombre: true,
    password: true,
    correo: true,
    apellido: true,
};

buttons.forEach((button) =>
    button.addEventListener("click", (e) => {
        const tar = e.target.parentElement;
        const input = tar.firstElementChild;
        input.disabled = false;
        btnSubmit.hidden = false;
    })
);


const validarFormulario = (e) => {
    switch (e.target.name) {
        case "usuario":
            validarCampo(expresiones.usuario, e.target, "usuario");
            break;
        case "nombre":
            validarCampo(expresiones.nombre, e.target, "nombre");
            break;
        case "password":
            validarCampo(expresiones.password, e.target, "password");
            break;
        case "correo":
            validarCampo(expresiones.correo, e.target, "correo");
            break;
        case "apellido":
            validarCampo(expresiones.nombre, e.target, "apellido");
            break;
    }
};

const validarCampo = (expresion, input, campo) => {
    if (expresion.test(input.value)) {
        document
                .getElementById(`grupo__${campo}`)
                .classList.remove("formulario__grupo-incorrecto");
        document
                .getElementById(`grupo__${campo}`)
                .classList.add("formulario__grupo-correcto");
        document
                .querySelector(`#grupo__${campo} i`)
                .classList.add("fa-check-circle");
        document
                .querySelector(`#grupo__${campo} i`)
                .classList.remove("fa-times-circle");
        document
                .querySelector(`#grupo__${campo} .formulario__input-error`)
                .classList.remove("formulario__input-error-activo");
        campos[campo] = true;
    } else {
        document
                .getElementById(`grupo__${campo}`)
                .classList.add("formulario__grupo-incorrecto");
        document
                .getElementById(`grupo__${campo}`)
                .classList.remove("formulario__grupo-correcto");
        document
                .querySelector(`#grupo__${campo} i`)
                .classList.add("fa-times-circle");
        document
                .querySelector(`#grupo__${campo} i`)
                .classList.remove("fa-check-circle");
        document
                .querySelector(`#grupo__${campo} .formulario__input-error`)
                .classList.add("formulario__input-error-activo");
        campos[campo] = false;
    }
};



inputs.forEach((input) => {
    input.addEventListener("keyup", validarFormulario);
    input.addEventListener("blur", validarFormulario);
});

formulario.addEventListener("submit", (e) => {
    e.preventDefault();

    if (
            campos.usuario &&
            campos.nombre &&
            campos.apellido &&
            campos.password &&
            campos.correo
            ) {

        document
                .getElementById("formulario__mensaje-exito")
                .classList.add("formulario__mensaje-exito-activo");
        setTimeout(() => {
            document
                    .getElementById("formulario__mensaje-exito")
                    .classList.remove("formulario__mensaje-exito-activo");
        }, 5000);

        document
                .querySelectorAll(".formulario__grupo-correcto")
                .forEach((icono) => {
                    icono.classList.remove("formulario__grupo-correcto");
                });
        inputs.forEach(input => {
            input.disabled = false;
        });
        formulario.submit();
    } else {
        document
                .getElementById("formulario__mensaje")
                .classList.add("formulario__mensaje-activo");
    }
});

let task = {name: "task1", do: false};
