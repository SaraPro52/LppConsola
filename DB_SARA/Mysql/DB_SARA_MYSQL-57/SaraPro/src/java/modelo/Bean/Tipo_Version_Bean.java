
package modelo.Bean;

public class Tipo_Version_Bean {
    
    private int Id_Tipo_Version;
    private String Nom_Tipo_Version;
    private String Des_Tipo_Version;
    
    
    public Tipo_Version_Bean(){}
    
    public Tipo_Version_Bean(String nom_TipoV, String des_TipoVer){
        
        this.Nom_Tipo_Version = nom_TipoV;
        this.Des_Tipo_Version = des_TipoVer;
    }

    public int getId_Tipo_Version() {
        return Id_Tipo_Version;
    }

    public void setId_Tipo_Version(int Id_Tipo_Version) {
        this.Id_Tipo_Version = Id_Tipo_Version;
    }

    public String getNom_Tipo_Version() {
        return Nom_Tipo_Version;
    }

    public void setNom_Tipo_Version(String Nom_Tipo_Version) {
        this.Nom_Tipo_Version = Nom_Tipo_Version;
    }

    public String getDes_Tipo_Version() {
        return Des_Tipo_Version;
    }

    public void setDes_Tipo_Version(String Des_Tipo_Version) {
        this.Des_Tipo_Version = Des_Tipo_Version;
    }
    
    
    
}
