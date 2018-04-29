package M_Modelo;

import M_Util.Elomac;
import static M_Util.M_Procedure.Group;
import org.json.JSONArray;

public class Programa extends Elomac{
	public  Programa ( ){ 
		super("Programa",1);
	}
        
        public boolean RegistrarPrograma(String[] programainfo,String[] areas,String[] temas){
            try {
                Elomac programa = new Elomac(23,1,programainfo);
                programa.Insert(); 
                String idP = (String)programa.atributos.get("id_programa");
                System.out.println(idP);
                
                for(int i = 0; i < areas.length; i++ ){
                    String[] dtA = {"",areas[i],idP};
                    System.out.println(areas[i]+" "+idP);
                    new Elomac(8,1,dtA).Insert();
                }
                for(int j = 0;j < temas.length;j++){
                    String[] dtP = {"",temas[j],idP};
                    System.out.println(temas[j]+" "+idP);
                    new Elomac(13,1,dtP).Insert();
                }
                return true;
            } catch (Exception e) {
                return false; 
            }
        }
        
        
        public String ProgramaAdmin(String[] parametrosProgramaAdmin){
            try {
                JSONArray arrayConsulta = new JSONArray(Elomac.M_ResultSet(Group(parametrosProgramaAdmin, '~'), 24));
                return arrayConsulta.toString();
            } catch (Exception e) {
                return e.getMessage();
            }
        }
}