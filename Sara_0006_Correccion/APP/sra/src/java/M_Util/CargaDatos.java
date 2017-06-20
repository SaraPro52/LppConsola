
package M_Util;

import com.opencsv.CSVReader;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import org.json.JSONArray;
import org.json.JSONObject;

public class CargaDatos {
    private String contenidoInsert1 = "";
    private String columnasInsert = "";
    private String datosInsert = "";
    public CargaDatos(){}
 
    
    public String cargaMasiva(String nomArchivo,String nomTabla){
        contenidoInsert1 = "INSERT INTO "+nomTabla+" ";
        
        String ruta =  "..\\sra\\web\\Archivos\\CarguesMasivos\\"+nomArchivo;
        try {
            File archivoCSV = new File(ruta);
            String[] nextLine;
            if(archivoCSV.canRead()){
                int cont = 0;
                BufferedReader buReader = new BufferedReader(new FileReader(archivoCSV)); 
                System.out.println(archivoCSV.toString());
                CSVReader lector = new CSVReader(buReader);
                while ((nextLine = lector.readNext()) != null) {
                    datosInsert = "";
                    String[] subDatos;
                    subDatos = nextLine[0].split(";");
                    for (int i = 0; i < subDatos.length; i++) {
                        if(cont == 0){
                            if(i == 0) columnasInsert += ""+subDatos[i];
                            else columnasInsert += ","+subDatos[i];
                        }else{
                            if(i == 0) datosInsert += "\""+subDatos[i]+"\"";
                            else datosInsert += ",\""+subDatos[i]+"\"";
                        }
                    }
                   if(cont == 0) {
                       contenidoInsert1 += " ("+columnasInsert+") VALUES ";
                   }
                   else if (cont == 1) {
                       contenidoInsert1 += "("+datosInsert+") ";
                   }
                   else contenidoInsert1 += " , ("+datosInsert+") ";
                   cont++;
                }
                
            }
            new M_Procedure().Registar(contenidoInsert1, 4);
            return "Exito";
        } catch (Exception e) {
            return "falllaaa"+e.getMessage();
        }
    }
    
    
    public String csvJson(String nomArchivo){
        String ruta =  "..\\sra\\web\\Archivos\\CarguesMasivos\\"+nomArchivo;
        JSONArray  carga = new JSONArray();
        try {
            File archivoCSV = new File(ruta);
            String[] nextLine;
            if(archivoCSV.canRead()){
                JSONObject nomColum = new JSONObject();
                JSONObject registro = null;
                int cont = 0;
                BufferedReader buReader = new BufferedReader(new FileReader(archivoCSV)); 
                System.out.println(archivoCSV.toString());
                CSVReader lector = new CSVReader(buReader);
                while ((nextLine = lector.readNext()) != null) {
                    String[] subDatos;
                    if(cont > 0)registro = new JSONObject();
                    subDatos = nextLine[0].split(";");
                    for (int i = 0; i < subDatos.length; i++) {
                        if(cont == 0){
                            nomColum.put(i+"", subDatos[i]);
                        }else{
                            registro.put(nomColum.getString(nomColum.names().getString(i)), subDatos[i]);
                        }
                    }
                   cont++;
                   if(registro != null)
                    carga.put(registro);
                }
            }
            return carga.toString();
        } catch (Exception e) {
            return "falllaaa"+e.getMessage();
        }
    }
    
    
}
