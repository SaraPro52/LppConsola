package M_Modelo;

import M_Util.Elomac;

public class Lista_Chequeo extends Elomac{
	public  Lista_Chequeo ( ){ 
		super("Lista_Chequeo");
	}
        
        public boolean RegistrarLista(Object[] lista,Object[] items){
            return (boolean)this.Registar(Group(lista,'~')+"~"+Group(items,','),1);
        }
}