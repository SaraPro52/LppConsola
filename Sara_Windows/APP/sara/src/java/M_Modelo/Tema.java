package M_Modelo;

import M_Util.Elomac;
import static M_Util.M_Procedure.Group;
import org.json.JSONArray;

public class Tema extends Elomac{
	public  Tema ( ){ 
		super("tema",1);
	}
        
    public String TemaAdmin(String[] parametrosTemaAdmin){
        try {
            JSONArray arrayConsulta = new JSONArray(Elomac.M_ResultSet(Group(parametrosTemaAdmin, '~'), 23));
            return arrayConsulta.toString();
        } catch (Exception e) {
            return e.getMessage();
        }
    }
}