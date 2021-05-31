function menu() {
    const ham = document.querySelector(".ham");
    const enlaces = document.querySelector(".menu-ul");
    const barras = document.querySelectorAll(".ham span");

    const desplegarMenu = () => {
        enlaces.classList.toggle("activado");
        barras.forEach((child) => child.classList.toggle("animado"));//cambiar ham
    };

    ham.addEventListener("click", desplegarMenu);
}

export {menu};