
package modelo.Bean;

public class Detalles_Lista_Bean {
    
    private int Id_Detalles_Lista;
    private int Id_Lista_Chequeo;
    private int Id_Item_Lista;
    
    public Detalles_Lista_Bean(){}
    
    public Detalles_Lista_Bean(int id_Lista,int id_Item){
        
        this.Id_Lista_Chequeo = id_Lista;
        this.Id_Item_Lista = id_Item;
    }

    public int getId_Detalles_Lista() {
        return Id_Detalles_Lista;
    }

    public void setId_Detalles_Lista(int Id_Detalles_Lista) {
        this.Id_Detalles_Lista = Id_Detalles_Lista;
    }

    public int getId_Lista_Chequeo() {
        return Id_Lista_Chequeo;
    }

    public void setId_Lista_Chequeo(int Id_Lista_Chequeo) {
        this.Id_Lista_Chequeo = Id_Lista_Chequeo;
    }

    public int getId_Item_Lista() {
        return Id_Item_Lista;
    }

    public void setId_Item_Lista(int Id_Item_Lista) {
        this.Id_Item_Lista = Id_Item_Lista;
    }
    
    
}
