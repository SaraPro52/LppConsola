
package modelo.Bean;

public class Detalles_Programa_Bean {
    
    private int Id_Detalles_Programa;
    private int Id_Tema;
    private int Id_Programa;
    
    public Detalles_Programa_Bean(){}
    
    public Detalles_Programa_Bean(int id_Tema, int id_Programa){
    
        this.Id_Tema = id_Tema;
        this.Id_Programa = id_Programa;
    }

    public int getId_Detalles_Programa() {
        return Id_Detalles_Programa;
    }

    public void setId_Detalles_Programa(int Id_Detalles_Programa) {
        this.Id_Detalles_Programa = Id_Detalles_Programa;
    }

    public int getId_Tema() {
        return Id_Tema;
    }

    public void setId_Tema(int Id_Tema) {
        this.Id_Tema = Id_Tema;
    }

    public int getId_Programa() {
        return Id_Programa;
    }

    public void setId_Programa(int Id_Programa) {
        this.Id_Programa = Id_Programa;
    }
    
    
}
