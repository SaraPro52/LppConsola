
package modelo.Bean;

public class Estado_Bean{
    
    private int Id_Estado;
    private String Nom_Estado;
    private String Id_Tipo_Estado;// puede ser un objeto?
    
    public Estado_Bean(){}
    
    public Estado_Bean(int id_Estado, String nom, String id_Tipo){
        
        this.Id_Estado = id_Estado;
        this.Nom_Estado = nom;
        this.Id_Tipo_Estado = id_Tipo;
    
    }

    public int getId_Estado() {
        return Id_Estado;
    }

    public void setId_Estado(int Id_Estado) {
        this.Id_Estado = Id_Estado;
    }

    public String getNom_Estado() {
        return Nom_Estado;
    }

    public void setNom_Estado(String Nom_Estado) {
        this.Nom_Estado = Nom_Estado;
    }

    public String getId_Tipo_Estado() {
        return Id_Tipo_Estado;
    }

    public void setId_Tipo_Estado(String Id_Tipo_Estado) {
        this.Id_Tipo_Estado = Id_Tipo_Estado;
    }
    
    
    
    
}
