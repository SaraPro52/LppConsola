
package modelo.Dao;

import java.sql.Timestamp;
import modelo.Bean.Evaluacion_General_Bean;
import util.M_Crud;

public class Evaluacion_General_Dao extends M_Crud{
    
    public  int Id_Evaluacion_General;
    public Timestamp Fecha_Evaluacion;
    public String Observacion;
    public String Resultado;
    public int Id_Version;
    public int Id_Lista_Chequeo;
    public int Id_Funcionario;
    
    public Evaluacion_General_Dao(){}
    
    public Evaluacion_General_Dao(Evaluacion_General_Bean eg){
        
        this.Id_Evaluacion_General = eg.getId_Evaluacion_General();
        this.Fecha_Evaluacion = eg.getFecha_Evaluacion();
        this.Observacion = eg.getObservacion();
        this.Resultado = eg.getResultado();
        this.Id_Version = eg.getId_Version();
        this.Id_Lista_Chequeo = eg.getId_Lista_Chequeo();
        this.Id_Funcionario = eg.getId_Funcionario();
        
    }

    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        cont1.put("Id_Evaluacion_General", ""+this.Id_Evaluacion_General);
        cont1.put("Fecha_Evaluacion",   ""+this.Fecha_Evaluacion);
        cont1.put("Observacion",        this.Observacion);
        cont1.put("Resultado",          this.Resultado);
        cont1.put("Id_Version",         ""+this.Id_Version);
        cont1.put("Id_Lista_Chequeo",   ""+this.Id_Lista_Chequeo);
        cont1.put("Id_Funcionario",     ""+this.Id_Funcionario);
        return SuperP(sentencia,"Evaluacion_General",cont1,condicion);
    }

    @Override
    public void carga(int i) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
