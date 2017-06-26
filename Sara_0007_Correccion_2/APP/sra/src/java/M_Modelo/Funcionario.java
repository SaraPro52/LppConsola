package M_Modelo;

import M_Util.Elomac;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Funcionario extends Elomac{
	public  Funcionario ( ){ 
		super("Funcionario",1);
	}
        
        public boolean RegistrarFuncionario(Object[] fun){
            return (boolean)this.Registar(Group(fun,'~'), 2);
        }
        
        public String ListaAsignarRoles(String idCentro){
            String[] campos ={"2"};
            String listaFun1 = new Elomac(26,1).Select(campos);
            String listaNegativa = "";
            try {
                for (int i = 0; i < new JSONArray(listaFun1).length(); i++) {
                    JSONObject jso = new JSONArray(listaFun1).getJSONObject(i);
                    if(i == 0)
                        listaNegativa += jso.getString("Id_Funcionario"); 
                    else
                        listaNegativa += ","+jso.getString("Id_Funcionario"); 
                }
                    
                   String[] campos1 = {"0","1","2","4","6","8"}; 
                   return (new Elomac(20,2).Select(campos1,"[{colum:0,operador:7,valor1:'"+listaNegativa+"',añadir:0},{colum:3,operador:0,valor1:"+idCentro+"}]"));
            } catch (JSONException ex) {
                return("no se pudo");
            }
        }
        
        public boolean ModificarContraseña(String[] parametrosModifContr){
            return (boolean)this.Registar(Group(parametrosModifContr,'~'), 20);
        }
        
        public String Logueo(String[] paramUser){
            try {
                JSONArray arrayConsulta = new JSONArray(Elomac.M_ResultSet(Group(paramUser, '~'), 21));
                return arrayConsulta.toString();
            } catch (Exception e) {
                return e.getMessage();
            }
        }
        
       
}