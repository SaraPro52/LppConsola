package modelo.Bean;

public class Centro_Bean {
   private int Id_Centro = 0;
    private String Num_Centro;
    private String Nom_Centro;
    private String Direccion;
    private int Id_Ciudad;
    
    public Centro_Bean(){}
    
    public Centro_Bean(String num_Centro, String nom_Centro,String direccion, int id_Ciudad){
    
        this.Num_Centro = num_Centro;
        this.Nom_Centro = nom_Centro;
        this.Direccion = direccion;
        this.Id_Ciudad = id_Ciudad;
    }

    public int getId_Centro() {
        return Id_Centro;
    }

    public String getNum_Centro() {
        return Num_Centro;
    }

    public void setNum_Centro(String Num_Centro) {
        this.Num_Centro = Num_Centro;
    }

    public void setId_Centro(int Id_Centro) {
        this.Id_Centro = Id_Centro;
    }

    public String getNom_Centro() {
        return Nom_Centro;
    }

    public void setNom_Centro(String Nom_Centro) {
        this.Nom_Centro = Nom_Centro;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public int getId_Ciudad() {
        return Id_Ciudad;
    }

    public void setId_Ciudad(int Id_Ciudad) {
        this.Id_Ciudad = Id_Ciudad;
    }    
}
