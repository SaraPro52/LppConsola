package M_Modelo;

import M_Util.Elomac;

public class Rankin extends Elomac{
	public  Rankin (){ 
		super("Rankin",1);
	}
        
        public boolean RegistrarRankin(String[] paramRankin){
            return (boolean)this.Registar(Group(paramRankin,'~'), 22);
        }
        
        
        
}
