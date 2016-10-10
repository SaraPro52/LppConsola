
package modelo.Bean;

public class Tipo_Estado_Bean{
    
    private int Id_Tipo_Estado;
    private String Nom_Tipo_Estado;
    
    public Tipo_Estado_Bean(){}
    
    public Tipo_Estado_Bean(String nom){
        this.Nom_Tipo_Estado = nom;
    }

    public int getId_Tipo_Estado() {
        return Id_Tipo_Estado;
    }

    public void setId_Tipo_Estado(int Id_Tipo_Estado) {
        this.Id_Tipo_Estado = Id_Tipo_Estado;
    }

    public String getNom_Tipo_Estado() {
        return Nom_Tipo_Estado;
    }

    public void setNom_Tipo_Estado(String Nom_Tipo_Estado) {
        this.Nom_Tipo_Estado = Nom_Tipo_Estado;
    }
    
    
    
    
    
}
