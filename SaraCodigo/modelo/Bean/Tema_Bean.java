
package modelo.Bean;

public class Tema_Bean {
    
    private int Id_Tema;
    private String Nom_Tema;
    private String Des_Tema;
    
    public Tema_Bean(){}
    
    public Tema_Bean(String nom_Tema,String des_Tema){
        
        this.Nom_Tema = nom_Tema;
        this.Des_Tema = des_Tema;
    }

    public int getId_Tema() {
        return Id_Tema;
    }

    public void setId_Tema(int Id_Tema) {
        this.Id_Tema = Id_Tema;
    }

    public String getNom_Tema() {
        return Nom_Tema;
    }

    public void setNom_Tema(String Nom_Tema) {
        this.Nom_Tema = Nom_Tema;
    }

    public String getDes_Tema() {
        return Des_Tema;
    }

    public void setDes_Tema(String Des_Tema) {
        this.Des_Tema = Des_Tema;
    }
    
    
    
}
