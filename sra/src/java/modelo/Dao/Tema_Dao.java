
package modelo.Dao;

import com.google.gson.Gson;
import java.util.ArrayList;
import modelo.Bean.Tema_Bean;
import util.InterfaceCrud;

public class Tema_Dao extends InterfaceCrud{
    
    public int Id_Tema;
    public String Nom_Tema;
    public String Des_Tema;
    private ArrayList<Tema_Bean> listarTema = new ArrayList<Tema_Bean>();
    private Tema_Bean tema = null;
    private String tabla = "Tema";
    private String columnaId = "Id_Tema";
    public char ope = 'N';
    public Tema_Dao(){}
    
    public Tema_Dao(Tema_Bean tm){
        
        this.Id_Tema = tm.getId_Tema();
        this.Nom_Tema = tm.getNom_Tema();
        this.Des_Tema = tm.getDes_Tema();
    }

    @Override
    public Object OperacionRegistro(String val, String operador, Object objeto) {
        try {
            switch(val){
                case "SELECT":
                    
                    if(ope == 'S'){
                        this.tabla = "V_Detalles_Programa";
                        this.columnaId = "Id_Programa";
                    }
                        
                        rs = saraCrud(val,operador+"4",this.tabla,this.columnaId,(int) objeto,"Id_Tema",null,"Nom_Tema",null,"Des_Tema",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                        while(rs.next()){
                            
                            tema = new Tema_Bean(rs.getString("Nom_Tema"),rs.getString("Des_Tema"));
                            tema.setId_Tema(rs.getInt("Id_Tema"));
                            if((operador == "-") || (operador == "" && ope == 'S'))
                                listarTema.add(tema);
                        }
                        rs.close();
                        cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                        this.saraCrud(val,"2","Tema","Id_Tema",this.Id_Tema,"Nom_Tema",this.Nom_Tema,"Des_Tema",this.Des_Tema,
                                "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
                        listo = true;
                    break;
            }
        } catch (Exception t1) {
            t1.printStackTrace();
        }
        if((operador == "-" && val == "SELECT") || (operador == "" && val == "SELECT" && ope == 'S')){
            return json = new Gson().toJson(listarTema);
        }else{
            if(operador == "" && val == "SELECT" && ope == 'N'){
                return tema;
            }else{
                return listo;
            }
        }
    }
    
    
    
}
