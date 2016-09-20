
package modelo.Bean;

public class Detalles_Categoria_Bean {
    
    private int Id_Detalles_Categoria;
    private int Id_Categoria;
    private int Id_Tema;
    
    public Detalles_Categoria_Bean(){}
    
    public Detalles_Categoria_Bean(int idCate,int idTema){
    
        this.Id_Categoria = idCate;
        this.Id_Tema = idTema;
    }

    public int getId_Detalles_Categoria() {
        return Id_Detalles_Categoria;
    }

    public void setId_Detalles_Categoria(int Id_Detalles_Categoria) {
        this.Id_Detalles_Categoria = Id_Detalles_Categoria;
    }

    public int getId_Categoria() {
        return Id_Categoria;
    }

    public void setId_Categoria(int Id_Categoria) {
        this.Id_Categoria = Id_Categoria;
    }

    public int getId_Tema() {
        return Id_Tema;
    }

    public void setId_Tema(int Id_Tema) {
        this.Id_Tema = Id_Tema;
    }
    
}
