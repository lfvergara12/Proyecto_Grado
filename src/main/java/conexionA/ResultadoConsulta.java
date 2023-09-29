package conexionA;

public class ResultadoConsulta {
	private String resultadoTexto;
	// Constructor vacío
    public ResultadoConsulta() {
    }

    // Constructor con parámetros
    public ResultadoConsulta(String resultadoTexto) {
        this.resultadoTexto = resultadoTexto;
    }

    // Getter para resultadoTexto
    public String getResultadoTexto() {
        return resultadoTexto;
    }

    // Setter para resultadoTexto
    public void setResultadoTexto(String resultadoTexto) {
        this.resultadoTexto = resultadoTexto;
    }
}

