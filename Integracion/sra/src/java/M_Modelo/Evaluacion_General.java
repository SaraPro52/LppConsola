package M_Modelo;

import M_Util.Elomac;

public class Evaluacion_General extends Elomac{
	public  Evaluacion_General ( ){ 
		super("Evaluacion_General",1);
	}
        
        public boolean RegistrarEvaluacion(String[] infoEva,String[] infoItem){
            return (boolean)this.Registar(this.Group(infoEva,'~')+"~"+this.Group(infoItem,'|'), 5);
        }
        
}