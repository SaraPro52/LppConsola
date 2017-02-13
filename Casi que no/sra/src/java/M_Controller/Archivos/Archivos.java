package M_Controller.Archivos;

import java.io.File;

public class Archivos {

    private String ruta;

    public Archivos() {
    }

    public String getRuta() {
        return ruta;
    }

    public void setRuta(String area, String programa, String tema) {
        String ruta = getRuta();
        ruta = area + File.separator + programa + File.separator + tema + File.separator;
        this.ruta = ruta;
    }

    public String getBase() {
        String macc = "C:\\Users\\migue\\Desktop\\Añadiduras\\sra\\web\\TemArchivos\\";
        String juan = "C:\\Users\\JudiniBezarius\\Documents\\Proyectos\\LppConsola\\PruebasJuan\\sra\\web\\Archivos\\";
        return (juan);
    }

    public String rutaTem() {
        String macc = "C:\\Users\\migue\\Desktop\\Añadiduras\\sra\\web\\Archivos\\";
        String juan = "C:\\Users\\JudiniBezarius\\Documents\\Proyectos\\LppConsola\\PruebasJuan\\sra\\web\\TemArchivos\\";
        return (juan);
    }
}