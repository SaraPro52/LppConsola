
package modelo.Bean;

import java.sql.Timestamp;

public class Notificacion_Bean {
    
    private int Id_Notificacion;
    private Timestamp Fecha_Envio;
    private String Conte_Notificacion;
    private String Archivos_Adjuntos;
    private int Id_Tipo_Notificacion;
    private int Id_Funcionario;
        
    public Notificacion_Bean(){}
    
    public Notificacion_Bean(Timestamp fechaEn, String conteNotif,String adjuntos, int idTipoNotif,int idFun){
        
        this.Fecha_Envio = fechaEn;
        this.Conte_Notificacion = conteNotif;
        this.Archivos_Adjuntos = adjuntos;
        this.Id_Tipo_Notificacion = idTipoNotif;
        this.Id_Funcionario = idFun;
    }

    public int getId_Notificacion() {
        return Id_Notificacion;
    }

    public void setId_Notificacion(int Id_Notificacion) {
        this.Id_Notificacion = Id_Notificacion;
    }

    public Timestamp getFecha_Envio() {
        return Fecha_Envio;
    }

    public void setFecha_Envio(Timestamp Fecha_Envio) {
        this.Fecha_Envio = Fecha_Envio;
    }

    public String getConte_Notificacion() {
        return Conte_Notificacion;
    }

    public void setConte_Notificacion(String Conte_Notificacion) {
        this.Conte_Notificacion = Conte_Notificacion;
    }

    public String getArchivos_Adjuntos() {
        return Archivos_Adjuntos;
    }

    public void setArchivos_Adjuntos(String Archivos_Adjuntos) {
        this.Archivos_Adjuntos = Archivos_Adjuntos;
    }

    public int getId_Tipo_Notificacion() {
        return Id_Tipo_Notificacion;
    }

    public void setId_Tipo_Notificacion(int Id_Tipo_Notificacion) {
        this.Id_Tipo_Notificacion = Id_Tipo_Notificacion;
    }

    public int getId_Funcionario() {
        return Id_Funcionario;
    }

    public void setId_Funcionario(int Id_Funcionario) {
        this.Id_Funcionario = Id_Funcionario;
    }
    
    
}
