
package modelo.Dao;

import com.google.gson.Gson;
import java.util.ArrayList;
import modelo.Bean.Detalles_Evaluacion_Bean;
import util.InterfaceCrud;

public class Detalles_Evaluacion_Dao extends InterfaceCrud{
    
    public int Id_Detalles_Evaluacion;
    public String Valorizacion;
    public String Observacion;
    public int Id_Detalles_Lista;
    public int Id_Evaluacion_General;
    private ArrayList<Detalles_Evaluacion_Bean> listarDE = new ArrayList<Detalles_Evaluacion_Bean>();
    private Detalles_Evaluacion_Bean detaEval = null;
    
    public Detalles_Evaluacion_Dao(){}
    
    public Detalles_Evaluacion_Dao(Detalles_Evaluacion_Bean de){
        
        this.Id_Detalles_Evaluacion = de.getId_Detalles_Evaluacion();
        this.Valorizacion = de.getValorizacion();
        this.Observacion = de.getObservacion();
        this.Id_Detalles_Lista = de.getId_Detalles_Lista();
        this.Id_Evaluacion_General = de.getId_Evaluacion_General();
    }

    @Override
    public Object OperacionRegistro(String val, int num, Object objeto) {
        try {
            switch(val){
                case "SELECT":
                        rs = saraCrud(val,num,"Detalles_Evaluacion","Id_Detalles_Evaluacion",(int) objeto,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                        while(rs.next()){
                            
                            detaEval = new Detalles_Evaluacion_Bean(rs.getString("Valorizacion"),rs.getString("Observacion"),rs.getInt("Id_Detalles_Lista"),rs.getInt("Id_Evaluacion_General"));
                            detaEval.setId_Detalles_Evaluacion(rs.getInt("Id_Detalles_Evaluacion"));
                            if(num == 1)
                                listarDE.add(detaEval);
                        }
                        rs.close();
                        cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                        this.saraCrud(val,4,"Detalles_Evaluacion","Id_Detalles_Evaluacion",this.Id_Detalles_Evaluacion,"Valorizacion",this.Valorizacion,"Observacion",this.Observacion,"Id_Detalles_Lista",""+this.Id_Detalles_Lista+"","Id_Evaluacion_General",""+this.Id_Evaluacion_General+"",
                                        "","","","","","","","","","","","","","");
                        listo = true;
                    break;
            }
        } catch (Exception dt1) {
            dt1.printStackTrace();
        }
        if(num == 1 && val == "SELECT"){
            
            return json = new Gson().toJson(listarDE);
        }else{
            if(num == 2 && val == "SELECT"){
                return detaEval;
            }else{
                return listo;
            }
        }
    }
    
}
