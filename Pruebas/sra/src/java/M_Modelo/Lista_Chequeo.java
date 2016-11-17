package M_Modelo;

import M_Util.Elomac;

public class Lista_Chequeo extends Elomac{
	public  Lista_Chequeo ( ){ 
		super("Lista_Chequeo",1);
	}
        
        public boolean RegistrarLista(Object[] lista,String items){
            return (boolean)this.Registar(Group(lista,'~')+"~"+items,1);
        }
}