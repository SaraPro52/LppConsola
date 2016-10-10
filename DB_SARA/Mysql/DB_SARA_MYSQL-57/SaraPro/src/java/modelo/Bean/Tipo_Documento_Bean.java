
package modelo.Bean;

public class Tipo_Documento_Bean {
    
    private int Id_Tipo_Documento;
    private String Nom_Tipo_Documento;
    
    public Tipo_Documento_Bean(){}
    
    public Tipo_Documento_Bean(String nom_tipoD){
        this.Nom_Tipo_Documento = nom_tipoD;
    
    }

    public int getId_Tipo_Documento() {
        return Id_Tipo_Documento;
    }

    public void setId_Tipo_Documento(int Id_Tipo_Documento) {
        this.Id_Tipo_Documento = Id_Tipo_Documento;
    }

    public String getNom_Tipo_Documento() {
        return Nom_Tipo_Documento;
    }

    public void setNom_Tipo_Documento(String Nom_Tipo_Documento) {
        this.Nom_Tipo_Documento = Nom_Tipo_Documento;
    }
    
    
}
