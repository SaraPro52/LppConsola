package M_Modelo;

import M_Util.Elomac;
import org.json.JSONArray;
import org.json.JSONObject;

public class Version extends Elomac{
	public  Version ( ){ 
		super("version",1);
	}
        
        public String RegistrarPV(String[] infoOa,String funA,String[] temA){
            return this.RegistarReturn(Group(infoOa,'~')+"~"+funA+"~"+Group(temA,','), 3);//16/04/2017------------
        }
        
        public String RegistrarVersion(String[] infoVer,String funA){
            return this.RegistarReturn(Group(infoVer, '~')+"~"+funA, 7);//16/04/2017------------
        }
        
        public String RegistrarActualizacion(String[] infoVer,String funA,String[] temA){ //16/04/2017------------
            return this.RegistarReturn(Group(infoVer,'~')+"~"+funA+"~"+Group(temA,','), 14);
        }
        
        public String CorreccionVersion(String[] correccion){
             return this.RegistarReturn(Group(correccion, '~'), 8);//16/04/2017------------
        }
        
        public String AprobarPV(String[] publicar){
            return this.RegistarReturn(Group(publicar, '~'), 9);//16/04/2017------------
        }
        
        //-----------CAMBIO 2
//        public Object ConsultaActualizar(int idFun){
//            return Elomac.M_ResultSet(""+idFun, 10);
//        }
        //-----------CAMBIO 2
        
        //---16/04/2015
        public String VistaActualizar(int idPv, int idVer){
            try {
                JSONArray consulta = null;
                JSONObject consultasTodo = new JSONObject();
                String actualizar = idPv+"~"+idVer+"~";
                for (int i = 0; i < 4; i++) {
                    consulta = new JSONArray(Elomac.M_ResultSet(actualizar+(i+1),13));
                    consultasTodo.put("Peticion_"+(i+1), consulta);
                }
                return consultasTodo.toString();
            } catch (Exception e) {
                return e.getMessage();
            }
        }//---16/04/2015
        
        public String MisProductos(String idFun){
        
        try {
            JSONArray arrayConsulta = new JSONArray(Elomac.M_ResultSet(idFun, 30));
            return arrayConsulta.toString();
        } catch (Exception e) {
             return e.getMessage();
        }
    }
}