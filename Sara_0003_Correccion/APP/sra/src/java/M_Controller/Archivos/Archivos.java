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
        String macc = "C:\\Users\\migue\\Desktop\\Proyectos\\SARA_Pro\\Versiones_Sara\\V1_SARA\\Sara_0003_Correccion\\APP\\sra\\web\\Archivos\\ArchivosA\\";
        String juan = "C:\\Users\\JudiniBezarius\\Desktop\\LppConsola-master\\Sara_0003_Correccion\\APP\\sra\\web\\Archivos\\ArchivosA\\";
        return (juan);
    }

    public String rutaTem() {
        String macc = "C:\\Users\\migue\\Desktop\\Proyectos\\SARA_Pro\\Versiones_Sara\\V1_SARA\\Sara_0001_Correccion\\APP\\sra\\web\\Archivos\\TemArchivos\\";
        String juan = "C:\\Users\\JudiniBezarius\\Desktop\\LppConsola-master\\Sara_0003_Correccion\\APP\\sra\\web\\Archivos\\TemArchivos\\";
        return (juan);
    }
}