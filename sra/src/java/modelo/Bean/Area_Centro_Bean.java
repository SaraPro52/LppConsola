
package modelo.Bean;

public class Area_Centro_Bean {
    
    private int Id_Area_Centro;
    private int Id_Area;
    private int Id_Centro;
    
    public Area_Centro_Bean(){}
    
    public Area_Centro_Bean(int id_Area,int id_Centro){
    
        
        this.Id_Area = id_Area;
        this.Id_Centro = id_Centro;
        
    }

    public int getId_Area_Centro() {
        return Id_Area_Centro;
    }

    public void setId_Area_Centro(int Id_Area_Centro) {
        this.Id_Area_Centro = Id_Area_Centro;
    }

    public int getId_Area() {
        return Id_Area;
    }

    public void setId_Area(int Id_Area) {
        this.Id_Area = Id_Area;
    }

    public int getId_Centro() {
        return Id_Centro;
    }

    public void setId_Centro(int Id_Centro) {
        this.Id_Centro = Id_Centro;
    }
    
    
}
