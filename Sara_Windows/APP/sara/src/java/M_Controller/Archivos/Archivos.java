package M_Controller.Archivos;

import java.io.File;

/*
    Windows \\
    Linux /
*/

public class Archivos{

    private String ruta;
    File base = new File("");
    
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
     return "\\Archivos\\ArchivosA\\";
     //return "/Archivos/ArchivosA/";
    }

    public String rutaTem() {
      return "\\Archivos\\TemArchivos\\";
     //return "/Archivos/TemArchivos/";
    }

    public String cargaMasiva() {
     return "\\Archivos\\CarguesMasivos\\";
     //return "/Archivos/CarguesMasivos/";
    }

    public String formato() {
     return "\\Archivos\\Formatos\\";
     //return "/Archivos/Formatos/";
    }
}
