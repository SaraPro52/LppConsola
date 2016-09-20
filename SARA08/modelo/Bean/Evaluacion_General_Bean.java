
package modelo.Bean;

import java.sql.Timestamp;

public class Evaluacion_General_Bean {
    
    private int Id_Evaluacion_General;
    private Timestamp Fecha_Evaluacion;
    private String Observacion;
    private String Resultado;
    private int Id_Version;
    private int Id_Lista_Chequeo;
    private int Id_Funcionario;
    
    public Evaluacion_General_Bean(){}
    
    public Evaluacion_General_Bean(String observacion, String resultado,int id_Ver,int id_lc,int id_fun){
    
        this.Observacion = observacion;
        this.Resultado = resultado;
        this.Id_Version = id_Ver;
        this.Id_Lista_Chequeo = id_lc;
        this.Id_Funcionario = id_fun;
    }

    public int getId_Evaluacion_General() {
        return Id_Evaluacion_General;
    }

    public void setId_Evaluacion_General(int Id_Evaluacion_General) {
        this.Id_Evaluacion_General = Id_Evaluacion_General;
    }

    public Timestamp getFecha_Evaluacion() {
        return Fecha_Evaluacion;
    }

    public void setFecha_Evaluacion(Timestamp Fecha_Evaluacion) {
        this.Fecha_Evaluacion = Fecha_Evaluacion;
    }

    public String getObservacion() {
        return Observacion;
    }

    public void setObservacion(String Observacion) {
        this.Observacion = Observacion;
    }

    public String getResultado() {
        return Resultado;
    }

    public void setResultado(String Resultado) {
        this.Resultado = Resultado;
    }

    

    public int getId_Version() {
        return Id_Version;
    }

    public void setId_Version(int Id_Version) {
        this.Id_Version = Id_Version;
    }

    public int getId_Lista_Chequeo() {
        return Id_Lista_Chequeo;
    }

    public void setId_Lista_Chequeo(int Id_Lista_Chequeo) {
        this.Id_Lista_Chequeo = Id_Lista_Chequeo;
    }

    public int getId_Funcionario() {
        return Id_Funcionario;
    }

    public void setId_Funcionario(int Id_Funcionario) {
        this.Id_Funcionario = Id_Funcionario;
    }
    
    
    
}
