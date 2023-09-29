/**
 * 
 */
function consultarResultado() {
    // Obtén los valores de los campos del formulario
    var tipoAnalisis = document.getElementById("selectTipoAnalisis").value;
    var anio = document.getElementById("selectAnio").value;
    var region = document.getElementById("selectRegion").value;

    // Debugging: Verifica los valores capturados
    console.log("Tipo de análisis:", tipoAnalisis);
    console.log("Año:", anio);
    console.log("Región:", region);

    // Realiza una petición AJAX al servlet
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "UserController", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var response = JSON.parse(xhr.responseText);
            mostrarResultado(response);
        }
    };

    // Envía los parámetros del formulario al servlet
    xhr.send("selectTipoAnalisis=" + tipoAnalisis + "&selectAnio=" + anio + "&selectRegion=" + region);
}

function mostrarResultado(response) {
    // Muestra el resultado en un cuadro de diálogo interactivo
    Swal.fire({
        title: 'Resultado de la Consulta',
        text: response.resultadoTexto,
        icon: 'info'
    });
}
