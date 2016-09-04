
package modelo.Dao;

import com.google.gson.Gson;
import java.util.ArrayList;
import modelo.Bean.Comentario_Bean;
import util.InterfaceCrud;

public class Comentario_Dao extends InterfaceCrud{
    
    public int Id_Comentario;
    public String Comentario;
    public int Id_Funcionario;
    public int Id_Version;
    private ArrayList<Comentario_Bean> listarCo = new ArrayList<Comentario_Bean>();
    private Comentario_Bean comentario = null;
    
    public Comentario_Dao(){}
    
    public Comentario_Dao(Comentario_Bean co){
        
        this.Id_Comentario = co.getId_Comentario();
        this.Comentario = co.getComentario();
        this.Id_Funcionario = co.getId_Funcionario();
        this.Id_Version = co.getId_Version();
    }

    @Override
    public Object OperacionRegistro(String val,String operador, Object objeto) {
        try{
            switch(val){
                case "SELECT":
                     rs = saraCrud(val,operador+"1","Comentario","Id_Comentario",(int) objeto,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                     while(rs.next()){
                         
                         comentario = new Comentario_Bean(rs.getString("Comentario"),rs.getInt("Id_Funcionario"),rs.getInt("Id_Version"));
                         comentario.setId_Comentario(rs.getInt("Id_Comentario"));
                         if(operador == "-")
                             listarCo.add(comentario);
                     }
                     rs.close();
                     cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                        this.saraCrud(val,"3","Comentario","Id_Comentario",this.Id_Comentario,"Comentario", this.Comentario,"Id_Funcionario",""+this.Id_Funcionario+"","Id_Version",""+this.Id_Version+"",
                                "", "", "", "", "", "", "", "", "", "", "", "", "", "","","");
                        listo = true;
                    break;
            }
        } catch (Exception co1) {
            co1.printStackTrace();
        }
        if(operador == "-" && val == "SELECT"){
            
            return json = new Gson().toJson(listarCo);
        }else{
            if(operador == "" && val == "SELECT"){
                return comentario;
            }else{
                return listo;
            }
        }
    }
    
    
    
}
