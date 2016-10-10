
package modelo.Dao;

import modelo.Bean.Detalles_Evaluacion_Bean;
import util.M_Crud;

public class Detalles_Evaluacion_Dao extends M_Crud{
    
    public int Id_Detalles_Evaluacion;
    public String Valorizacion;
    public String Observacion;
    public int Id_Detalles_Lista;
    public int Id_Evaluacion_General;
    
    public Detalles_Evaluacion_Dao(){}
    
    public Detalles_Evaluacion_Dao(Detalles_Evaluacion_Bean de){
        
        this.Id_Detalles_Evaluacion = de.getId_Detalles_Evaluacion();
        this.Valorizacion = de.getValorizacion();
        this.Observacion = de.getObservacion();
        this.Id_Detalles_Lista = de.getId_Detalles_Lista();
        this.Id_Evaluacion_General = de.getId_Evaluacion_General();
    }

    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        cont1.put("Id_Detalles_Evaluacion", ""+this.Id_Detalles_Evaluacion);
        cont1.put("Valorizacion",           this.Valorizacion);
        cont1.put("Observacion",            this.Observacion);
        cont1.put("Id_Detalles_Lista",      ""+this.Id_Detalles_Lista);
        cont1.put("Id_Evaluacion_General",  ""+this.Id_Evaluacion_General);
        return SuperP(sentencia,"Detalles_Evaluacion",cont1,condicion);
    }


}
