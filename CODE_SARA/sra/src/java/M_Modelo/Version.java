package M_Modelo;

import M_Util.Elomac;

public class Version extends Elomac{
	public  Version ( ){ 
		super("Version");
	}
        
        public boolean RegistrarOA(String[] infoOa,String[] funA,String[] temA){
            return (boolean)this.Registar(Group(infoOa,'~')+"~"+Group(funA,',')+"~"+Group(temA,','), 3);
        }
}