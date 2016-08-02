
package modelo.Bean;

public class Rol_Bean {
    
    private int Id_Rol;
    private String Nom_Rol;
    private String Des_Rol;
    
    public Rol_Bean(){}
    
    public Rol_Bean(int id_Rol,String nom_Rol, String des_Rol){
        
        this.Id_Rol = id_Rol;
        this.Nom_Rol = nom_Rol;
        this.Des_Rol = des_Rol;
    }

    public int getId_Rol() {
        return Id_Rol;
    }

    public void setId_Rol(int Id_Rol) {
        this.Id_Rol = Id_Rol;
    }

    public String getNom_Rol() {
        return Nom_Rol;
    }

    public void setNom_Rol(String Nom_Rol) {
        this.Nom_Rol = Nom_Rol;
    }

    public String getDes_Rol() {
        return Des_Rol;
    }

    public void setDes_Rol(String Des_Rol) {
        this.Des_Rol = Des_Rol;
    }
    
}
