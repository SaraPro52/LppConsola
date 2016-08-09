
package modelo.Bean;

public class Estado_Bean{
    
    private int Id_Estado = 0;
    private String Nom_Estado;

    
    public Estado_Bean(){}
    
    public Estado_Bean(String nom){
        
        this.Nom_Estado = nom;
        
    
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
