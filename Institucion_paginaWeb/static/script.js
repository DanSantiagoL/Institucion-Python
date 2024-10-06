function buscarUsuario() {
    // Obtén el valor de búsqueda
    let input = document.getElementById("buscador").value.toLowerCase();
    // Obtén las filas de la tabla
    let filas = document.getElementById("tablaUsuarios").getElementsByTagName("tr");

    // Itera sobre las filas y oculta las que no coinciden con la búsqueda
    for (let i = 1; i < filas.length; i++) {
        let documento = filas[i].getElementsByTagName("td")[0].textContent.toLowerCase();
        let nombre = filas[i].getElementsByTagName("td")[3].textContent.toLowerCase();
        
        if (documento.includes(input) || nombre.includes(input)) {
            filas[i].style.display = "";
        } else {
            filas[i].style.display = "none";
        }
    }
}

function buscarMateria() {
    // Obtén el valor de búsqueda
    let input = document.getElementById("buscador").value.toLowerCase();
    // Obtén las filas de la tabla
    let filas = document.getElementById("tablaMaterias").getElementsByTagName("tr");

    // Itera sobre las filas y oculta las que no coinciden con la búsqueda
    for (let i = 1; i < filas.length; i++) {
        let materia = filas[i].getElementsByTagName("td")[1].textContent.toLowerCase(); // Materia
        let profesor = filas[i].getElementsByTagName("td")[2].textContent.toLowerCase(); // Profesor
        
        if (materia.includes(input) || profesor.includes(input)) {
            filas[i].style.display = ""; // Muestra la fila
        } else {
            filas[i].style.display = "none"; // Oculta la fila
        }
    }
}

function buscarCurso() {
    // Obtiene el valor del campo de búsqueda
    let input = document.getElementById("buscador").value.toLowerCase();
    // Obtiene las filas de la tabla
    let filas = document.getElementById("tablaCursos").getElementsByTagName("tr");

    // Itera sobre las filas y oculta las que no coinciden con la búsqueda
    for (let i = 1; i < filas.length; i++) { // empieza en 1 para omitir el encabezado
        let curso = filas[i].getElementsByTagName("td")[1].textContent.toLowerCase();
        let profesor = filas[i].getElementsByTagName("td")[3].textContent.toLowerCase();
        if (curso.includes(input) || profesor.includes(input)) {
            filas[i].style.display = ""; // Muestra la fila
        } else {
            filas[i].style.display = "none"; // Oculta la fila
        }
    }
}

function buscarProfesor() {
    // Obtiene el valor del campo de búsqueda
    let input = document.getElementById("buscador").value.toLowerCase();
    // Obtiene las filas de la tabla
    let filas = document.getElementById("tablaProfesores").getElementsByTagName("tr");

    // Itera sobre las filas y oculta las que no coinciden con la búsqueda
    for (let i = 1; i < filas.length; i++) { // empieza en 1 para omitir el encabezado
        let nombreProfesor = filas[i].getElementsByTagName("td")[1].textContent.toLowerCase();
        let estudios = filas[i].getElementsByTagName("td")[2].textContent.toLowerCase();
        if (nombreProfesor.includes(input) || estudios.includes(input)) {
            filas[i].style.display = ""; // Muestra la fila
        } else {
            filas[i].style.display = "none"; // Oculta la fila
        }
    }
}

function buscarEstudiante() {
    // Obtiene el valor del campo de búsqueda
    let input = document.getElementById("buscador").value.toLowerCase();
    // Obtiene las filas de la tabla
    let filas = document.getElementById("tablaEstudiantes").getElementsByTagName("tr");

    // Itera sobre las filas y oculta las que no coinciden con la búsqueda
    for (let i = 1; i < filas.length; i++) { // empieza en 1 para omitir el encabezado
        let nombreEstudiante = filas[i].getElementsByTagName("td")[1].textContent.toLowerCase();
        let curso = filas[i].getElementsByTagName("td")[2].textContent.toLowerCase();
        if (nombreEstudiante.includes(input) || curso.includes(input)) {
            filas[i].style.display = ""; // Muestra la fila
        } else {
            filas[i].style.display = "none"; // Oculta la fila
        }
    }
}

function buscarAdministrativo() {
    // Obtiene el valor del campo de búsqueda
    let input = document.getElementById("buscador").value.toLowerCase();
    // Obtiene las filas de la tabla
    let filas = document.getElementById("tablaAdministrativos").getElementsByTagName("tr");

    // Itera sobre las filas y oculta las que no coinciden con la búsqueda
    for (let i = 1; i < filas.length; i++) { // empieza en 1 para omitir el encabezado
        let nombreAdministrativo = filas[i].getElementsByTagName("td")[1].textContent.toLowerCase();
        let cargo = filas[i].getElementsByTagName("td")[2].textContent.toLowerCase();
        if (nombreAdministrativo.includes(input) || cargo.includes(input)) {
            filas[i].style.display = ""; // Muestra la fila
        } else {
            filas[i].style.display = "none"; // Oculta la fila
        }
    }
}   