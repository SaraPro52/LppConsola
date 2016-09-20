
package modelo.Dao;

import java.sql.Timestamp;
import modelo.Bean.Version_Bean;
import util.M_Crud;

public class Version_Dao extends M_Crud{
    
    public int Id_Version;
    public Timestamp Fecha_Envio;
    public Timestamp Fecha_Publicacion;
    public int Num_Version;
    public Timestamp Fecha_Vigencia;
    public String Url_Version;
    public String Url_Img;
    public String Inst_Instalacion;
    public String Reqst_Instalacion;
    public int Id_P_Virtual;
    public int Id_Estado;
    public int Id_Tipo_Version;
    
    public Version_Dao(){}
    public Version_Dao(Version_Bean vr){
        
        this.Id_Version =           vr.getId_Version();
        this.Fecha_Envio =          vr.getFecha_Envio();
        this.Fecha_Publicacion =    vr.getFecha_Publicacion();
        this.Num_Version =          vr.getNum_Version();
        this.Fecha_Vigencia =       vr.getFecha_Vigencia();
        this.Url_Version =          vr.getUrl_Version();
        this.Url_Img =              vr.getUrl_Img();
        this.Inst_Instalacion =     vr.getInst_Instalacion();
        this.Reqst_Instalacion =    vr.getReqst_Instalacion();
        this.Id_P_Virtual =         vr.getId_P_Virtual();
        this.Id_Estado =            vr.getId_Estado();
        this.Id_Tipo_Version =      vr.getId_Tipo_Version();
    }

    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        cont1.put("Id_Version",         ""+this.Id_Version);
        cont1.put("Fecha_Envio",        ""+this.Fecha_Envio);
        cont1.put("Fecha_Publicacion",  ""+this.Fecha_Publicacion);
        cont1.put("Num_Version",        ""+this.Num_Version);
        cont1.put("Fecha_Vigencia",     ""+this.Fecha_Vigencia);
        cont1.put("Url_Version",        this.Url_Version);
        cont1.put("Url_Img",            this.Url_Img);
        cont1.put("Inst_Instalacion",   this.Inst_Instalacion);
        cont1.put("Reqst_Instalacion",  this.Reqst_Instalacion);
        cont1.put("Id_P_Virtual",       ""+this.Id_P_Virtual);
        cont1.put("Id_Estado",          ""+this.Id_Estado);
        cont1.put("Id_Tipo_Version",    ""+this.Id_Tipo_Version);
        return SuperP(sentencia,"Area",cont1,condicion);
    }

    public boolean RegistrarOA(String[] todoA,String[] funA,String[] temA){
        String todo = "";String fun  = "";String tema = "";
        for(int i = 0; i< todoA.length;i++){
            if(i == 0)todo += todoA[i];
            else todo += "~"+todoA[i];
        }
        for(int i = 0;i < funA.length;i++){
            if(i == 0)fun += funA[i];
            else fun += ","+funA[i];
        }
        for(int i = 0; i< temA.length;i++){
            if(i == 0)tema += temA[i];
            else tema += ","+temA[i];
        }
       todo += "~"+fun+"~"+tema;
       return (boolean)this.Registar(todo, 3);
    }
    
}
