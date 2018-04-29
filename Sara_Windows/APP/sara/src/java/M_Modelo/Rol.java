package M_Modelo;

import M_Util.Elomac;
import static M_Util.M_Procedure.Group;
import org.json.JSONArray;

public class Rol extends Elomac{
	public  Rol ( ){ 
		super("rol",1);
	}
        
        public String AsignarRol(String[] parametrosAsignarRol){
            try {
                JSONArray arrayConsulta = new JSONArray(Elomac.M_ResultSet(Group(parametrosAsignarRol, '~'), 29));
                return arrayConsulta.toString();
            } catch (Exception e) {
                return e.getMessage();
            }
        }
}