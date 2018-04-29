package M_Modelo;

import M_Util.Elomac;

public class Categoria extends Elomac{
	public  Categoria ( ){ 
		super("categoria",1);
	}
        
        public boolean RegistrarCategoria(String[] object,String temas){
            return (boolean) this.Registar(this.Group(object,'~')+"~"+temas, 6);
        }
        
        public String RegistrarTemaCategoria(String[] datosTema){//20/04/2017
            try {
                return  Elomac.M_ResultSet("2,"+this.Group(datosTema, '~')+"", 15);
            } catch (Exception e) {
                return "null";
            }
        }
}