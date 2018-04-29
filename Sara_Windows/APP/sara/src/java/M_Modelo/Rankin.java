package M_Modelo;

import M_Util.Elomac;
import static M_Util.M_Procedure.Group;

public class Rankin extends Elomac{
	public  Rankin (){ 
		super("Rankin",1);
	}
        
        public boolean RegistrarRankin(String[] paramRankin){
            return (boolean)this.Registar(Group(paramRankin,'~'), 22);
        }
        
        public String consultaPuestos(){
            try {
                return new Elomac("45_consultapuestos",2).Select();
            } catch (Exception e) {
                return e.getMessage();
            }
        }
        
        
}
