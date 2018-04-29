package M_Modelo;

import M_Util.Elomac;
import static M_Util.M_Procedure.Group;
import org.json.JSONArray;

public class Area extends Elomac {

    public Area() {
        super("area", 1);
    }

    public boolean RegistrarArea(String[] infoArea, int idCentro) {
        Elomac area = new Elomac(1, 1, infoArea);
        if (area.Insert()) {
            String[] aCent = {"", "" + area.atributos.get("id_area"), "" + idCentro};
            Elomac areaCentro = new Elomac(2, 1, aCent);
            if (areaCentro.Insert()) {
                return true;
            } else {
                return false;
            }

        } else {
            return false;
        }
    }

    public boolean ModificarArea(String[] infoArea, int idCentro) {
        Elomac area = new Elomac(1, 1, infoArea);
        if (area.Update()) {
            return true;
        } else {
            return false;
        }
    }
    
    
    public String AreaAdmin(String[] parametrosAreaAdmin){
        try {
            JSONArray arrayConsulta = new JSONArray(Elomac.M_ResultSet(Group(parametrosAreaAdmin, '~'), 25));
            return arrayConsulta.toString();
        } catch (Exception e) {
            return e.getMessage();
        }
    }
}
