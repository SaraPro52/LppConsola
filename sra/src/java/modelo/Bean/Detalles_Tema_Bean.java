
package modelo.Bean;

public class Detalles_Tema_Bean {
    
    private int Id_Detalles_Tema;
    private int Id_Tema;
    private int Id_P_Virtual;
    
    public Detalles_Tema_Bean(){}
    
    public Detalles_Tema_Bean(int id_Tema,int id_PV){
    
        this.Id_Tema = id_Tema;
        this.Id_P_Virtual = id_PV;
    }

    public int getId_Detalles_Tema() {
        return Id_Detalles_Tema;
    }

    public void setId_Detalles_Tema(int Id_Detalles_Tema) {
        this.Id_Detalles_Tema = Id_Detalles_Tema;
    }

    public int getId_Tema() {
        return Id_Tema;
    }

    public void setId_Tema(int Id_Tema) {
        this.Id_Tema = Id_Tema;
    }

    public int getId_P_Virtual() {
        return Id_P_Virtual;
    }

    public void setId_P_Virtual(int Id_P_Virtual) {
        this.Id_P_Virtual = Id_P_Virtual;
    }
    
    
    
}
 