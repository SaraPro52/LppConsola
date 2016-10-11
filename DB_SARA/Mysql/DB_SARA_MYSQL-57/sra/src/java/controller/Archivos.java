package controller;
import java.io.File;
public class Archivos {
    private String ruta;
    private String base;
    public Archivos() {}
    public String getRuta() {
        return ruta;
    }
    public void setRuta(String area, String programa, String tema) {
        String ruta = getRuta();
        ruta = area + File.separator + programa + File.separator + tema + File.separator;
        this.ruta = ruta;
    }
    public String getBase() {
        String base = "C:\\Users\\Judini\\Documents\\sra\\Archivos\\";
        return base;
    }
    public void setBase(String base) {
        this.base = base;
    }
    public String rutas() {
        String ruta = getBase()+getRuta();
        return ruta;
    }
}