package controller;
import com.google.gson.Gson;
import java.util.ArrayList;

public class convert {

    private int id;
    private String nombre;

    public convert() {
    }

    public String listarSele(String json) {
        ArrayList<convert> listaSelect = new ArrayList<convert>();
        for (int i = 0; i < json.length(); i++) {
   
            
        }        
        return new Gson().toJson(listaSelect);
    }

    
    public int getId() {return id;}
    public void setId(int id) {this.id = id;}
    public String getNombre() {return nombre;}
    public void setNombre(String nombre) {this.nombre = nombre;}
}
