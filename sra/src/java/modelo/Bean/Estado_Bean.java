
package modelo.Bean;

public class Estado_Bean{
    
    private int     Id_Estado;
    private String  Nom_Estado;
    private int     Id_Tipo_Estado;

    
    public Estado_Bean(){}
    
    public Estado_Bean(String nom,int tipo){
        
        this.Nom_Estado = nom;
        this.Id_Tipo_Estado = tipo;
        
    
    }

    public int getId_Tipo_Estado() {
        return Id_Tipo_Estado;
    }

    public void setId_Tipo_Estado(int Id_Tipo_Estado) {
        this.Id_Tipo_Estado = Id_Tipo_Estado;
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

}
