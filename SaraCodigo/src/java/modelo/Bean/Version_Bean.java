
package modelo.Bean;

import java.sql.Timestamp;

public class Version_Bean {
    
    private int Id_Version;
    private Timestamp Fecha_Envio;
    private Timestamp Fecha_Publicacion;
    private int Num_Version;
    private Timestamp Fecha_Vigencia;
    private String Url_Version;
    private String Url_Img;
    private String Inst_Instalacion;
    private String Reqst_Instalacion;
    private int Id_P_Virtual;
    private int Id_Estado;
    private int Id_Tipo_Version;
    
    public Version_Bean(){}

    public Version_Bean(Timestamp Fecha_Envio, Timestamp Fecha_Publicacion, int Num_Version, Timestamp Fecha_Vigencia, String Url_Version, String Url_Img, String Inst_Instalacion, String Reqst_Instalacion, int Id_P_Virtual, int Id_Estado, int Id_Tipo_Version) {
        this.Fecha_Envio = Fecha_Envio;
        this.Fecha_Publicacion = Fecha_Publicacion;
        this.Num_Version = Num_Version;
        this.Fecha_Vigencia = Fecha_Vigencia;
        this.Url_Version = Url_Version;
        this.Url_Img = Url_Img;
        this.Inst_Instalacion = Inst_Instalacion;
        this.Reqst_Instalacion = Reqst_Instalacion;
        this.Id_P_Virtual = Id_P_Virtual;
        this.Id_Estado = Id_Estado;
        this.Id_Tipo_Version = Id_Tipo_Version;
    }
    
    public Version_Bean(int num_ver,String url_ver,String url_i,String instru,String reqst,int id_pv, int id_est, int id_tv){
    
        this.Num_Version = num_ver;
        this.Url_Version = url_ver;
        this.Url_Img = url_i;
        this.Inst_Instalacion = instru;
        this.Reqst_Instalacion = reqst;
        this.Id_P_Virtual = id_pv;
        this.Id_Estado = id_est;
        this.Id_Tipo_Version = id_tv;
    }

    public int getId_Version() {
        return Id_Version;
    }

    public void setId_Version(int Id_Version) {
        this.Id_Version = Id_Version;
    }

    public Timestamp getFecha_Envio() {
        return Fecha_Envio;
    }

    public void setFecha_Envio(Timestamp Fecha_Envio) {
        this.Fecha_Envio = Fecha_Envio;
    }

    public Timestamp getFecha_Publicacion() {
        return Fecha_Publicacion;
    }

    public void setFecha_Publicacion(Timestamp Fecha_Publicacion) {
        this.Fecha_Publicacion = Fecha_Publicacion;
    }

    public int getNum_Version() {
        return Num_Version;
    }

    public void setNum_Version(int Num_Version) {
        this.Num_Version = Num_Version;
    }

    public Timestamp getFecha_Vigencia() {
        return Fecha_Vigencia;
    }

    public void setFecha_Vigencia(Timestamp Fecha_Vigencia) {
        this.Fecha_Vigencia = Fecha_Vigencia;
    }

    public String getUrl_Version() {
        return Url_Version;
    }

    public void setUrl_Version(String Url_Version) {
        this.Url_Version = Url_Version;
    }

    public String getUrl_Img() {
        return Url_Img;
    }

    public void setUrl_Img(String Url_Img) {
        this.Url_Img = Url_Img;
    }

    public String getInst_Instalacion() {
        return Inst_Instalacion;
    }

    public void setInst_Instalacion(String Inst_Instalacion) {
        this.Inst_Instalacion = Inst_Instalacion;
    }

    public String getReqst_Instalacion() {
        return Reqst_Instalacion;
    }

    public void setReqst_Instalacion(String Reqst_Instalacion) {
        this.Reqst_Instalacion = Reqst_Instalacion;
    }

    public int getId_P_Virtual() {
        return Id_P_Virtual;
    }

    public void setId_P_Virtual(int Id_P_Virtual) {
        this.Id_P_Virtual = Id_P_Virtual;
    }

    public int getId_Estado() {
        return Id_Estado;
    }

    public void setId_Estado(int Id_Estado) {
        this.Id_Estado = Id_Estado;
    }

    public int getId_Tipo_Version() {
        return Id_Tipo_Version;
    }

    public void setId_Tipo_Version(int Id_Tipo_Version) {
        this.Id_Tipo_Version = Id_Tipo_Version;
    }
    
    
    
}
