
package modelo.Bean;

public class Detalles_Area_Bean {
    
    private int Id_Detalles_Area;
    private int Id_Area;
    private int Id_Programa;
    
    public Detalles_Area_Bean(){}
    
    public Detalles_Area_Bean(int id_Pro,int id_Are){
        
        this.Id_Programa = id_Pro;
        this.Id_Area = id_Are;
    }

    public int getId_Detalles_Area() {
        return Id_Detalles_Area;
    }

    public void setId_Detalles_Area(int Id_Detalles_Area) {
        this.Id_Detalles_Area = Id_Detalles_Area;
    }

    public int getId_Programa() {
        return Id_Programa;
    }

    public void setId_Programa(int Id_Programa) {
        this.Id_Programa = Id_Programa;
    }

    public int getId_Area() {
        return Id_Area;
    }

    public void setId_Area(int Id_Area) {
        this.Id_Area = Id_Area;
    }
    
    
}
