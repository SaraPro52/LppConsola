
package modelo.Dao;

import com.google.gson.Gson;
import java.sql.Timestamp;
import java.util.ArrayList;
import modelo.Bean.Evaluacion_General_Bean;
import util.InterfaceCrud;

public class Evaluacion_General_Dao extends InterfaceCrud{
    
    public  int Id_Evaluacion_General;
    public Timestamp Fecha_Evaluacion;
    public String Observacion;
    public String Resultado;
    //public int Resultado;
    public int Id_Version;
    public int Id_Lista_Chequeo;
    public int Id_Funcionario;
    private ArrayList<Evaluacion_General_Bean> listarEva = new ArrayList<Evaluacion_General_Bean>();
    private Evaluacion_General_Bean evalua = null;
    
    public Evaluacion_General_Dao(){}
    
    public Evaluacion_General_Dao(Evaluacion_General_Bean eg){
        
        this.Id_Evaluacion_General = eg.getId_Evaluacion_General();
        this.Fecha_Evaluacion = eg.getFecha_Evaluacion();
        this.Observacion = eg.getObservacion();
        this.Resultado = eg.getResultado();
        this.Id_Version = eg.getId_Version();
        this.Id_Lista_Chequeo = eg.getId_Lista_Chequeo();
        this.Id_Funcionario = eg.getId_Funcionario();
        
    }

    @Override
    public Object OperacionRegistro(String val, String operador, Object objeto) {
        try {
            switch(val){
                case  "SELECT":
                        rs = saraCrud(val,operador+"1","Evaluacion_General","Id_Evaluacion_General",(int) objeto,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                        while(rs.next()){
                            
                            evalua  = new Evaluacion_General_Bean(rs.getString("Observacion"),rs.getString("Resultado"),rs.getInt("Id_Version"),rs.getInt("Id_Lista_Chequeo"),rs.getInt("Id_Funcionario"));
                            evalua.setId_Evaluacion_General(rs.getInt("Id_Evaluacion_General"));
                            evalua.setFecha_Evaluacion(rs.getTimestamp("Fecha_Evaluacion"));
                            if(operador == "-")
                                listarEva.add(evalua);
                            
                        }
                        rs.close();
                        cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                        this.saraCrud(val,"5","Evaluacion_General","Id_Evaluacion_General",this.Id_Evaluacion_General,"Observacion",this.Observacion,"Resultado",""+this.Resultado+"","Id_Version",""+this.Id_Version+"","Id_Lista_Chequeo",""+this.Id_Lista_Chequeo+"","Id_Funcionario",""+this.Id_Funcionario+"",
                                    "","","","","","","","","","","","");
                        listo = true;
                    break;
            }
        } catch (Exception eg1) {
            eg1.printStackTrace();
        }
        if(operador == "-" && val == "SELECT"){
            return json = new Gson().toJson(listarEva);            
        }else{
            if(operador == "" && val == "SELECT"){
                return  evalua;
            }else
            {
                return listo;
            }
        }
    }
    
}
