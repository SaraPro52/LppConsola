
package modelo.Bean;

import java.sql.Timestamp;

public class Categoria_Bean {
    
    private int Id_Categoria;
    private String Nom_Categoria;
    private String Des_Categoria;
    private Timestamp Fecha_Creacion;
    private int Id_Funcionario;
    
    public Categoria_Bean(){}
    
    public Categoria_Bean(String nomCate,String desCate,Timestamp fechaCrea,int idFun){
        
        this.Nom_Categoria = nomCate;
        this.Des_Categoria = desCate;
        this.Fecha_Creacion = fechaCrea;
        this.Id_Funcionario = idFun;
    }

    public int getId_Categoria() {
        return Id_Categoria;
    }

    public void setId_Categoria(int Id_Categoria) {
        this.Id_Categoria = Id_Categoria;
    }

    public String getNom_Categoria() {
        return Nom_Categoria;
    }

    public void setNom_Categoria(String Nom_Categoria) {
        this.Nom_Categoria = Nom_Categoria;
    }

    public String getDes_Categoria() {
        return Des_Categoria;
    }

    public void setDes_Categoria(String Des_Categoria) {
        this.Des_Categoria = Des_Categoria;
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
