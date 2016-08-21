
package modelo.Bean;

public class Formato_Bean {
    
    private int Id_Formato;
    private String Nom_Formato;
    private String Des_Formato;
    
    public Formato_Bean(){}
    
    public Formato_Bean(String nom_Formato,String des_Formato){
    
        this.Nom_Formato = nom_Formato;
        this.Des_Formato = des_Formato;
    }

    public int getId_Formato() {
        return Id_Formato;
    }

    public void setId_Formato(int Id_Formato) {
        this.Id_Formato = Id_Formato;
    }

    public String getNom_Formato() {
        return Nom_Formato;
    }

    public void setNom_Formato(String Nom_Formato) {
        this.Nom_Formato = Nom_Formato;
    }

    public String getDes_Formato() {
        return Des_Formato;
    }

    public void setDes_Formato(String Des_Formato) {
        this.Des_Formato = Des_Formato;
    }
    
    
    
}
