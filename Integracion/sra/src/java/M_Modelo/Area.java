package M_Modelo;

import M_Util.Elomac;

public class Area extends Elomac{
	public  Area ( ){ 
		super("Area",1);
	}
        
        public boolean RegistrarArea(String[] infoArea, int idCentro){
            Elomac area = new Elomac(1,1,infoArea);
            if(area.Insert()){
                String[] aCent = {"",""+area.atributos.get("Id_Area"),""+idCentro};
                Elomac areaCentro = new Elomac(2,1,aCent);
                if(areaCentro.Insert()){
                    return true;
                }else return false;
                    
            }else return false;
        }

} 