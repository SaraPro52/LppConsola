
package M_Util;

import com.csvreader.CsvReader;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
public class CargarDatos extends M_Crud{

    private String tabla;
    private String url;
    
    public CargarDatos(String tabla,String url){
        this.tabla = tabla;
        this.url = url;
    }
    public void IngresarCSV(){
        
        CsvReader reader = null;{
        
            try {
                    reader = new CsvReader(url);
                    reader.setDelimiter(';');
                    reader.readHeaders();
                    String[] he = reader.getHeaders();
                    Map<String,Object> atributos = null;
                    ArrayList<String> h1 = new ArrayList<String>();
                    String id = "";
                    
                    for (int i = 0; i < reader.getHeaderCount(); i++) {
                        if(he[i] != ""){
                            h1.add(he[i]);
                            System.out.println(he[i]);
                        }
                    }
                    while(reader.readRecord()){
                        atributos = new LinkedHashMap<String,Object>();
                        for (int i = 0; i < h1.size(); i++) {
                            if(reader.get(i) != ""){
                                if(i == 0){
                                    id = reader.get(h1.get(i));
                                }
                                atributos.put(h1.get(i),reader.get(h1.get(i)));
                                System.out.println(h1.get(i)+" -- " + reader.get(h1.get(i)));
                            }
                        }
                        String json = new Gson().toJson(atributos);
                        System.out.println(json);
                        
                        //poner en una posicion en especifico, para cuando se quiera actualizar como insertar 
                        //por medio de la clase elomac
                        
//                        try {
//                            Elomac elo = new Elomac(tabla,1);
//                            String consulta = null;
//                            try {
//                               consulta = (String)elo.Select(Integer.parseInt(id));
//                               if((boolean)this.SuperP("UPDATE",tabla,atributos,""+h1.get(0)+" = " + id)){
//                                    System.out.println("si actualizo");
//                                }else{
//                                    System.out.println("no actualizo");
//                                }
//                            } catch (Exception e) {
//                                System.out.println(e.getMessage());
//                                if((boolean)this.SuperP("INSERT",tabla,atributos,"")){
//                                    System.out.println("si Registro");
//                                }else{
//                                    System.out.println("no Registro");
//                                }
//                            }
                            
                            
//                            if(consulta != null){
//                                if((boolean)this.SuperP("UPDATE",tabla,atributos,""+h1.get(0)+" = " + id)){
//                                    System.out.println("si actualizo");
//                                }else{
//                                    System.out.println("no actualizo");
//                                }
//                            }else{
//                                if((boolean)this.SuperP("INSERT",tabla,atributos,"")){
//                                    System.out.println("si Registro");
//                                }else{
//                                    System.out.println("no Registro");
//                                }
//                            }
                            
//                        } catch (Exception e) {
//                            System.out.println(e.getMessage());
//                        }
                    }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        
        }       
    }
    
    public static void main(String[] args) {
        
        CargarDatos c = new CargarDatos("Ciudad","C:/Users/migue/Desktop/LppConsola/DB_SARA/MariaDB/Libro1.csv");
        c.IngresarCSV();
    }


    
}
