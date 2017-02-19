package M_Modelo;

import M_Util.Elomac;

public class Lista_Chequeo extends Elomac{
	public  Lista_Chequeo ( ){ 
		super("Lista_Chequeo",1);
	}
        
        public boolean RegistrarLista(Object[] lista,String items){
            return (boolean)this.Registar(Group(lista,'~')+"~"+items,1);
        }
        
        public boolean ModificarLista(String[] mLista,String[] mItems){
            
            Elomac listaMo = new Elomac(20,1,mLista);
            try {
                 if(listaMo.Update()){
                     for (int i = 0; i < mLista.length; i++) {
                         Detalles_Lista dtaL = new Detalles_Lista();
                         dtaL.atributos.replace("Id_Lista_Chequeo", mLista[0]);
                         dtaL.atributos.replace("Id_Item_Lista", mItems[i]);
                         System.out.println(mLista[0]+"---"+mItems[i]);
                         if(dtaL.Insert()){
                             System.out.println("Si");
                         }else{
                             System.out.println("No");
                         }
                     }
                     return true;
                 }else{
                       System.out.println("No se pudo1");
                       return false;
                 }
            } catch (Exception e) {
                System.out.println(e.getMessage());
                return false;
            }
            
            
        }
}