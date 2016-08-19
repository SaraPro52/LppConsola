
package modelo.Dao;

import com.google.gson.Gson;
import java.util.ArrayList;
import modelo.Bean.Tema_Bean;
import util.InterfaceCrud;

public class Tema_Dao extends InterfaceCrud{
    
    public int Id_Tema;
    public String Nom_Tema;
    public String Des_Tema;
    private ArrayList<Tema_Bean> listarTema = new ArrayList<Tema_Bean>();
    private Tema_Bean tema = null;
    
    public Tema_Dao(){}
    
    public Tema_Dao(Tema_Bean tm){
        
        this.Id_Tema = tm.getId_Tema();
        this.Nom_Tema = tm.getNom_Tema();
        this.Des_Tema = tm.getDes_Tema();
    }

    @Override
    public Object OperacionRegistro(String val, int num, int id) {
        try {
            switch(val){
                case "SELECT":
                        rs = saraCrud(val,num,"Tema","Id_Tema",id,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                        while(rs.next()){
                            
                            tema = new Tema_Bean(rs.getString("Nom_Tema"),rs.getString("Des_Tema"));
                            tema.setId_Tema(rs.getInt("Id_Tema"));
                            if(num == 1)
                                listarTema.add(tema);
                        }
                        rs.close();
                        cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                        this.saraCrud(val,2,"Tema","Id_Tema",this.Id_Tema,"Nom_Tema",this.Nom_Tema,"Des_Tema",this.Des_Tema,
                                "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
                        listo = true;
                    break;
            }
        } catch (Exception t1) {
            t1.printStackTrace();
        }
        if(num == 1 && val == "SELECT"){
            return json = new Gson().toJson(listarTema);
        }else{
            if(num == 2 && val == "SELECT"){
                return tema;
            }else{
                return listo;
            }
        }
    }
    
    
    
}
