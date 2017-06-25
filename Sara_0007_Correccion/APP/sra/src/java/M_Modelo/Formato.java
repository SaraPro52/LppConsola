package M_Modelo;

import M_Util.Elomac;
import static M_Util.M_Procedure.Group;
import org.json.JSONArray;

public class Formato extends Elomac{
	public  Formato ( ){ 
		super("Formato",1);
	}
        
        public String consultaTipoFormato(String[] parametrosTipoFormato){
            try {
                JSONArray arrayConsulta = new JSONArray(Elomac.M_ResultSet(Group(parametrosTipoFormato, '~'), 19));
                return arrayConsulta.toString();
            } catch (Exception e) {
                return e.getMessage();
            }
        }
}