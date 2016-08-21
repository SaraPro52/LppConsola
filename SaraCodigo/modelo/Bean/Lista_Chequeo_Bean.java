
package modelo.Bean;

import java.sql.Timestamp;

public class Lista_Chequeo_Bean {
    
    private int Id_Lista_Chequeo;
    private String Nom_Lista_Chequeo;
    private String Des_Lista_Chequeo;
    private Timestamp Fecha_Creacion;
    private int Id_Funcionario;
    
    public Lista_Chequeo_Bean(){}
    
    public Lista_Chequeo_Bean(String nom_ListaC,String des_ListaC,int id_Fun){
        
        this.Nom_Lista_Chequeo = nom_ListaC;
        this.Des_Lista_Chequeo = des_ListaC;
        this.Id_Funcionario = id_Fun;
    }

    public int getId_Lista_Chequeo() {
        return Id_Lista_Chequeo;
    }

    public void setId_Lista_Chequeo(int Id_Lista_Chequeo) {
        this.Id_Lista_Chequeo = Id_Lista_Chequeo;
    }

    public String getNom_Lista_Chequeo() {
        return Nom_Lista_Chequeo;
    }

    public void setNom_Lista_Chequeo(String Nom_Lista_Chequeo) {
        this.Nom_Lista_Chequeo = Nom_Lista_Chequeo;
    }

    public String getDes_Lista_Chequeo() {
        return Des_Lista_Chequeo;
    }

    public void setDes_Lista_Chequeo(String Des_Lista_Chequeo) {
        this.Des_Lista_Chequeo = Des_Lista_Chequeo;
    }

    public Timestamp getFecha_Creacion() {
        return Fecha_Creacion;
    }

    public void setFecha_Creacion(Timestamp Fecha_Creacion) {
        this.Fecha_Creacion = Fecha_Creacion;
    }

  
    public int getId_Funcionario() {
        return Id_Funcionario;
    }

    public void setId_Funcionario(int Id_Funcionario) {
        this.Id_Funcionario = Id_Funcionario;
    }
    
    
    
}
