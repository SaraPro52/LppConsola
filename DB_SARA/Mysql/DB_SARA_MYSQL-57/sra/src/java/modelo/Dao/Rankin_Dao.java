
package modelo.Dao;


import modelo.Bean.Rankin_Bean;
import util.M_Crud;

public class Rankin_Dao extends M_Crud{
    
    public int Id_Rankin;
    public int Puesto;
    public int Num_Visitas;
    public int Num_Descargas;
    public int Cant_5;
    public int Cant_4;
    public int Cant_3;
    public int Cant_2;
    public int Cant_1;
    public int Numero_Votos;
    public int Id_Version;
    
    public Rankin_Dao(){}
    
    public Rankin_Dao(Rankin_Bean ran){
        
        this.Id_Rankin = ran.getId_Rankin();
        this.Puesto = ran.getPuesto();
        this.Num_Visitas = ran.getNum_Visitas();
        this.Num_Descargas = ran.getNum_Descargas();
        this.Cant_5 = ran.getCant_5();
        this.Cant_4 = ran.getCant_4();
        this.Cant_3 = ran.getCant_3();
        this.Cant_2 = ran.getCant_2();
        this.Cant_1 = ran.getCant_1();
        this.Numero_Votos = ran.getNumero_Votos();
        this.Id_Version = ran.getId_Version();
    
    }

    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        cont1.put("Id_Rankin", ""+this.Id_Rankin);
        cont1.put("Puesto",   ""+this.Puesto);
        cont1.put("Num_Visitas", ""+this.Num_Visitas);
        cont1.put("Num_Descargas", ""+this.Num_Descargas);
        cont1.put("Cant_5", ""+this.Cant_5);
        cont1.put("Cant_4", ""+this.Cant_4);
        cont1.put("Cant_3", ""+this.Cant_3);
        cont1.put("Cant_2", ""+this.Cant_2);
        cont1.put("Cant_1", ""+this.Cant_1);
        cont1.put("Numero_Votos", ""+this.Numero_Votos);
        cont1.put("Id_Version", ""+this.Id_Version);
        
        return SuperP(sentencia,"Rankin",cont1,condicion);
    }

    @Override
    public void carga(int i) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
