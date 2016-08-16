
package modelo.Bean;

public class Item_Lista_Bean {
    
    private int Id_Item_Lista;
    private String Des_Item_Lista;
    private int Tipo_Item;
    
    public Item_Lista_Bean(){}
    
    public Item_Lista_Bean(String des_itemL,int tipo_item){
        
        this.Des_Item_Lista = des_itemL;
        this.Tipo_Item = tipo_item;
    
    }

    public int getId_Item_Lista() {
        return Id_Item_Lista;
    }

    public void setId_Item_Lista(int Id_Item_Lista) {
        this.Id_Item_Lista = Id_Item_Lista;
    }

    public String getDes_Item_Lista() {
        return Des_Item_Lista;
    }

    public void setDes_Item_Lista(String Des_Item_Lista) {
        this.Des_Item_Lista = Des_Item_Lista;
    }

    public int getTipo_Item() {
        return Tipo_Item;
    }

    public void setTipo_Item(int Tipo_Item) {
        this.Tipo_Item = Tipo_Item;
    }


    
    
}
