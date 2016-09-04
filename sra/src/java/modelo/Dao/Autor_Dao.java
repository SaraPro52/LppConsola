
package modelo.Dao;

import com.google.gson.Gson;
import java.util.ArrayList;
import modelo.Bean.Autor_Bean;
import util.InterfaceCrud;

public class Autor_Dao extends InterfaceCrud{
    
    public int Id_Autor;
    public int Id_Version;
    public int Id_Funcinario;
    
    private ArrayList<Autor_Bean> listarAutor = new ArrayList<Autor_Bean>();
    private Autor_Bean autor = null;
    
    public Autor_Dao(){}
    
    public Autor_Dao(Autor_Bean au){
        
        this.Id_Autor = au.getId_Autor();
        this.Id_Version = au.getId_Version();
        this.Id_Funcinario = au.getId_Funcionario();
    }

    @Override
    public Object OperacionRegistro(String val, String operador, Object objeto) {
        try {
            switch(val){
                case "SELECT":
                        rs = saraCrud(val,operador+"1","Autor","Id_Autor",(int) objeto,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                        while(rs.next()){
                            
                            autor = new Autor_Bean(rs.getInt("Id_Version"),rs.getInt("Id_Funcionario"));
                            autor.setId_Autor(rs.getInt("Id_Autor"));
                            if(operador == "-")
                                listarAutor.add(autor);
                        }
                        rs.close();
                        cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                        this.saraCrud(val,"2","Autor","Id_Autor",this.Id_Autor,"Id_Version",""+this.Id_Version+"","Id_Funcionario",""+this.Id_Funcinario+"",
                                "","","","","","","","","","","","","","","","","","");
                        listo = true;
                    break;
            }
        } catch (Exception au1) {
            au1.printStackTrace();
        }
        if(operador == "-" && val == "SELECT"){
            return json = new Gson().toJson(listarAutor);
        }else{
            if(operador == "" && val == "SELECT"){
                return autor;
            }else{
                return listo;
            }
        }
    }
    
    
}
