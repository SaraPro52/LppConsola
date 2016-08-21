
package modelo.Bean;

public class Programa_Bean {
    
    private int Id_Programa;
    private String Nom_Programa;
    private String Nivel_Formacion;
    
    public Programa_Bean(){}
    
    public Programa_Bean(String nom_Programa, String nivel_Forma){
        
        this.Nom_Programa = nom_Programa;
        this.Nivel_Formacion = nivel_Forma;
    }

    public int getId_Programa() {
        return Id_Programa;
    }

    public void setId_Programa(int Id_Programa) {
        this.Id_Programa = Id_Programa;
    }

    public String getNom_Programa() {
        return Nom_Programa;
    }

    public void setNom_Programa(String Nom_Programa) {
        this.Nom_Programa = Nom_Programa;
    }

    public String getNivel_Formacion() {
        return Nivel_Formacion;
    }

    public void setNivel_Formacion(String Nivel_Formacion) {
        this.Nivel_Formacion = Nivel_Formacion;
    }
    
    
    
}
