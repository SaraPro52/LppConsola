
package modelo.Bean;

public class Area_Bean {
    
    private int Id_Area;
    private String Nom_Area;
    private String Lider_Area;
    
    public Area_Bean(){}
    public Area_Bean(String nom){
        this.Nom_Area= nom;
    }
    public Area_Bean(int id_Area, String nom_Area, String lider_Area){
        
        this.Id_Area = id_Area;
        this.Nom_Area = nom_Area;
        this.Lider_Area = lider_Area;
    }

    public int getId_Area() {
        return Id_Area;
    }

    public void setId_Area(int Id_Area) {
        this.Id_Area = Id_Area;
    }

    public String getNom_Area() {
        return Nom_Area;
    }

    public void setNom_Area(String Nom_Area) {
        this.Nom_Area = Nom_Area;
    }

    public String getLider_Area() {
        return Lider_Area;
    }

    public void setLider_Area(String Lider_Area) {
        this.Lider_Area = Lider_Area;
    }
    
    
}
