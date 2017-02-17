package M_Modelo;

import M_Util.Elomac;

public class Categoria extends Elomac{
	public  Categoria ( ){ 
		super("Categoria",1);
	}
        
        public boolean RegistrarCategoria(String[] object,String temas){
            return (boolean) this.Registar(this.Group(object,'~')+"~"+temas, 6);
        }
}