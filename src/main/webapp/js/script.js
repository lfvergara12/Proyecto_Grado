document.getElementById("btnConsultar").addEventListener("click", function () {
    var selectTipoAnalisis = document.getElementById("selectTipoAnalisis").value;
    var selectAnio = document.getElementById("selectAnio").value;
    var selectRegion = document.getElementById("selectRegion").value;

    fetch("UserController", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: "action=cargaPDF" +
            "&selectTipoAnalisis=" + encodeURIComponent(selectTipoAnalisis) +
            "&selectAnio=" + encodeURIComponent(selectAnio) +
            "&selectRegion=" + encodeURIComponent(selectRegion)
    })
    .then(response => {
        if (!response.ok) {
            throw new Error("La solicitud AJAX falló.");
        }
        return response.text(); // Cambia .json() a .text()
    })
    .then(data => {
        mostrarResultado(data); // No se necesita JSON.parse, ya que es texto
    })
    .catch(error => {
        console.error("Error en la solicitud AJAX", error);
        // Puedes mostrar un mensaje de error al usuario aquí
    });
});

function mostrarResultado(resultado) {
    // Aquí debes mostrar el resultado en un cuadro de texto o div en tu página HTML
    // Por ejemplo, si tienes un elemento con el id "resultado", puedes hacer lo siguiente:
    document.getElementById("resultado").textContent = resultado;
}