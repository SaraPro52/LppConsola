
package modelo.Dao;

import modelo.Bean.Autor_Bean;
import util.M_Crud;

public class Autor_Dao extends M_Crud{
    
    public int Id_Autor;
    public int Id_Version;
    public int Id_Funcinario;
    
    public Autor_Dao(){}
    
    public Autor_Dao(Autor_Bean au){
        
        this.Id_Autor = au.getId_Autor();
        this.Id_Version = au.getId_Version();
        this.Id_Funcinario = au.getId_Funcionario();
    }

    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        cont1.put("Id_Autor", ""+this.Id_Autor);
        cont1.put("Id_Version",""+this.Id_Version);
        cont1.put("Id_Funcinario",""+this.Id_Funcinario);
        return SuperP(sentencia,"Autor",cont1,condicion);
    }

    @Override
    public void carga(int i) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    
    
}
