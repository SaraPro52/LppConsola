
package modelo.Bean;

public class Producto_Virtual_Bean {
    
    private int Id_P_Virtual;
    private String Nom_P_Virtual;
    private String Des_P_Virtual;
    private String Palabras_Clave;
    private int Id_Formato;
    
    public Producto_Virtual_Bean(){}
    
    public Producto_Virtual_Bean(String nom_PV, String des_PV,String palabras_C, int id_F){
    
        this.Nom_P_Virtual = nom_PV;
        this.Des_P_Virtual = des_PV;
        this.Palabras_Clave = palabras_C;
        this.Id_Formato = id_F;
    }

    public int getId_P_Virtual() {
        return Id_P_Virtual;
    }

    public void setId_P_Virtual(int Id_P_Virtual) {
        this.Id_P_Virtual = Id_P_Virtual;
    }

    public String getNom_P_Virtual() {
        return Nom_P_Virtual;
    }

    public void setNom_P_Virtual(String Nom_P_Virtual) {
        this.Nom_P_Virtual = Nom_P_Virtual;
    }

    public String getDes_P_Virtual() {
        return Des_P_Virtual;
    }

    public void setDes_P_Virtual(String Des_P_Virtual) {
        this.Des_P_Virtual = Des_P_Virtual;
    }

    public String getPalabras_Clave() {
        return Palabras_Clave;
    }

    public void setPalabras_Clave(String Palabras_Clave) {
        this.Palabras_Clave = Palabras_Clave;
    }

    public int getId_Formato() {
        return Id_Formato;
    }

    public void setId_Formato(int Id_Formato) {
        this.Id_Formato = Id_Formato;
    }
    
    
}
