package M_Modelo;

import M_Util.Elomac;
import static M_Util.M_Procedure.Group;
import org.json.JSONArray;

public class Centro extends Elomac{
	public  Centro ( ){ 
		super("centro",1);
	}
        
    public String CentroAdmin(String[] parametrosCentroAdmin){
        try {
            JSONArray arrayConsulta = new JSONArray(Elomac.M_ResultSet(Group(parametrosCentroAdmin, '~'), 26));
            return arrayConsulta.toString();
        } catch (Exception e) {
            return e.getMessage();
        }
    }
}