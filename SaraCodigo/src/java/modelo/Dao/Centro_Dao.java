
package modelo.Dao;

import com.google.gson.Gson;
import java.util.ArrayList;
import modelo.Bean.Centro_Bean;
import util.InterfaceCrud;

public class Centro_Dao extends InterfaceCrud{

    
    public int Id_Centro;
    public String Num_Centro;
    public String Nom_Centro;
    public String Direccion;
    public int Id_Ciudad;
    private ArrayList<Centro_Bean> listarCentros = new ArrayList<Centro_Bean>();
    private Centro_Bean cenB1 = null;
    
    public Centro_Dao(){}
    
    public Centro_Dao(Centro_Bean cenB){
    
        this.Id_Centro = cenB.getId_Centro();
        this.Num_Centro= cenB.getNum_Centro();
        this.Nom_Centro = cenB.getNom_Centro();
        this.Direccion = cenB.getDireccion();
        this.Id_Ciudad = cenB.getId_Ciudad();
    }
    

    @Override
    public Object  OperacionRegistro(String val, int num,int id) {
       
        try {
            switch (val) {
                case "SELECT":
                    rs = saraCrud(val,num,"Centro","Id_Centro",id,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
            
                    while(rs.next()){

                        cenB1 = new Centro_Bean(rs.getString("Nom_Centro"),rs.getString("Num_Centro"),rs.getString("Direccion"),rs.getInt("Id_Ciudad"));
                        cenB1.setId_Centro(rs.getInt("Id_Centro"));
                        if(num == 1)
                        listarCentros.add(cenB1);
                    }
                    rs.close();
                    cst.close();
                    break;
                case "INSERT":
                case "UPDATE":    
                    this.saraCrud(val,4,"Centro","Id_Centro",this.Id_Centro,"Nom_Centro",this.Nom_Centro,"Direccion",this.Direccion, "Id_Ciudad", ""+this.Id_Ciudad+"", 
                         "Num_Centro",this.Num_Centro, "", "", "", "", "","", "", "", "", "", "", "", "", "");
                    listo = true;
                    break;
            }
            
        } catch (Exception s1) {
            s1.printStackTrace();
        }
        System.out.println("siii");
        if(num == 1 && val == "SELECT"){
            return new Gson().toJson(listarCentros);            
        }else{
            if(num == 2 && val == "SELECT"){
                return  cenB1;
            }else
            {
                return listo;
            }
        }
    }


    
}
