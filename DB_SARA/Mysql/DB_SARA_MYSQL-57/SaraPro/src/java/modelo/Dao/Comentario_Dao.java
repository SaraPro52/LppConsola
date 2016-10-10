
package modelo.Dao;


import modelo.Bean.Comentario_Bean;
import util.M_Crud;

public class Comentario_Dao extends M_Crud{
    
    public int Id_Comentario;
    public String Comentario;
    public int Id_Funcionario;
    public int Id_Version;
 
    public Comentario_Dao(){}
    
    public Comentario_Dao(Comentario_Bean co){
        
        this.Id_Comentario = co.getId_Comentario();
        this.Comentario = co.getComentario();
        this.Id_Funcionario = co.getId_Funcionario();
        this.Id_Version = co.getId_Version();
    }

    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        cont1.put("Id_Comentario", ""+this.Id_Comentario);
        cont1.put("Comentario",     this.Comentario);
        cont1.put("Id_Funcionario", ""+this.Id_Funcionario);
        cont1.put("Id_Funcionario", ""+this.Id_Funcionario);
        return SuperP(sentencia,"Comentario",cont1,condicion);
    }
    
    
    
}
