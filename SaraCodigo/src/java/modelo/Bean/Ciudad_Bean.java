
package modelo.Bean;

public class Ciudad_Bean {
    
    private int Id_Ciudad;
    private String Nom_Ciudad;
    
    public Ciudad_Bean(){}
    
    public Ciudad_Bean(String nom_Ciudad){
        
        this.Nom_Ciudad = nom_Ciudad;
    }

    public int getId_Ciudad() {
        return Id_Ciudad;
    }

    public void setId_Ciudad(int Id_Ciudad) {
        this.Id_Ciudad = Id_Ciudad;
    }

    public String getNom_Ciudad() {
        return Nom_Ciudad;
    }

    public void setNom_Ciudad(String Nom_Ciudad) {
        this.Nom_Ciudad = Nom_Ciudad;
    }
    
}
