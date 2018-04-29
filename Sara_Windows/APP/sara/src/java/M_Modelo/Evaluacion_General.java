package M_Modelo;

import M_Util.Elomac;
import org.json.JSONArray;
import org.json.JSONObject;

public class Evaluacion_General extends Elomac{
	public  Evaluacion_General ( ){ 
		super("evaluacion_general",1);
	}
        
        public boolean RegistrarEvaluacion(String[] infoEva,String[] infoItem){
            return (boolean)this.Registar(this.Group(infoEva,'~')+"~"+this.Group(infoItem,'|'), 5);
            
        }
        
        public Object ConsultarEvaluacion(int idEvalua,int resultado){
            
            try {
                String delimitador = "[{colum:0,operador:0,valor1:"+idEvalua+",añadir:0},{colum:8,operador:0,valor1:"+resultado+"}]";
                String[] elegir = {"0","1","2","7","8","9"};
                String[] elegir1 = {"3","4","5","6"};
                
                String consulta = new Elomac(36,2).Select(elegir, delimitador);
                
                JSONObject evaJ = new JSONArray(consulta).getJSONObject(0);
                evaJ.put("Items", (String) new Elomac(36,2).Select(elegir1, delimitador));
                System.out.println(evaJ);
                return evaJ;
            } catch (Exception e) {
                return e.getMessage();
            }
        }
        
}