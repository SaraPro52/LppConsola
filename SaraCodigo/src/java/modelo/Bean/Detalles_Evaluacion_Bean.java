
package modelo.Bean;

public class Detalles_Evaluacion_Bean {
    
    private int Id_Detalles_Evaluacion;
    private String Valorizacion;
    private String Observacion;
    private int Id_Detalles_Lista;
    private int Id_Evaluacion_General;
    
    public Detalles_Evaluacion_Bean(){}
    
    public Detalles_Evaluacion_Bean(String valori,String obser,int id_DT,int id_EG){
        
        this.Valorizacion = valori;
        this.Observacion = obser;
        this.Id_Detalles_Lista = id_DT;
        this.Id_Evaluacion_General  = id_EG;
    }

    public int getId_Detalles_Evaluacion() {
        return Id_Detalles_Evaluacion;
    }

    public void setId_Detalles_Evaluacion(int Id_Detalles_Evaluacion) {
        this.Id_Detalles_Evaluacion = Id_Detalles_Evaluacion;
    }

    public String getValorizacion() {
        return Valorizacion;
    }

    public void setValorizacion(String Valorizacion) {
        this.Valorizacion = Valorizacion;
    }

    public String getObservacion() {
        return Observacion;
    }

    public void setObservacion(String Observacion) {
        this.Observacion = Observacion;
    }

    public int getId_Detalles_Lista() {
        return Id_Detalles_Lista;
    }

    public void setId_Detalles_Lista(int Id_Detalles_Lista) {
        this.Id_Detalles_Lista = Id_Detalles_Lista;
    }

    public int getId_Evaluacion_General() {
        return Id_Evaluacion_General;
    }

    public void setId_Evaluacion_General(int Id_Evaluacion_General) {
        this.Id_Evaluacion_General = Id_Evaluacion_General;
    }
    
    
}
