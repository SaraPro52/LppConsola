package M_Modelo;

import M_Util.Elomac;

public class Version extends Elomac{
	public  Version ( ){ 
		super("Version",1);
	}
        
        public boolean RegistrarPV(String[] infoOa,String funA,String[] temA){
            return (boolean)this.Registar(Group(infoOa,'~')+"~"+funA+"~"+Group(temA,','), 3);
        }
        
        public boolean RegistrarVersion(String[] infoVer,String funA){
            return (boolean)this.Registar(Group(infoVer, '~')+"~"+funA, 7);
        }
        
        public boolean CorreccionVersion(String[] correccion){
             return (boolean)this.Registar(Group(correccion, '~'), 8);//-------CAMBIADO 
        }
        
        public boolean AprobarPV(String[] publicar){
            return (boolean)this.Registar(Group(publicar, '~'), 9);
        }
}