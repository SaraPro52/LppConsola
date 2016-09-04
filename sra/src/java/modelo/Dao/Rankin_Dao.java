
package modelo.Dao;

import com.google.gson.Gson;
import java.util.ArrayList;
import modelo.Bean.Rankin_Bean;
import util.InterfaceCrud;

public class Rankin_Dao extends InterfaceCrud{
    
    public int Id_Rankin;
    public int Num_Visitas;
    public int Num_Descargas;
    public int Cant_5;
    public int Cant_4;
    public int Cant_3;
    public int Cant_2;
    public int Cant_1;
    public int Numero_Votos;
    public int Id_Version;
    private ArrayList<Rankin_Bean> listarRan = new ArrayList<Rankin_Bean>();
    private Rankin_Bean rankin = null;
    
    public Rankin_Dao(){}
    
    public Rankin_Dao(Rankin_Bean ran){
        
        this.Id_Rankin = ran.getId_Rankin();
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
    public Object OperacionRegistro(String val, String operador, Object objeto) {
        try {
            switch(val){
                case "SELECT":
                        rs = saraCrud(val,operador+"","Rankin","Id_Rankin",(int) objeto,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                        while(rs.next()){
                            
                            rankin = new Rankin_Bean(rs.getInt("Num_Visitas"),
                                                    rs.getInt("Num_Descargas"),
                                                    rs.getInt("Cant_5"),
                                                    rs.getInt("Cant_4"),
                                                    rs.getInt("Cant_3"),
                                                    rs.getInt("Cant_2"),
                                                    rs.getInt("Cant_1"),
                                                    rs.getInt("Numero_Votos"),
                                                    rs.getInt("Id_Version"));
                            rankin.setId_Rankin(rs.getInt("Id_Rankin"));
                            if(operador == "-")
                                listarRan.add(rankin);
                        }
                        rs.close();
                        cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                        this.saraCrud(val,"9","Rankin","Id_Rankin",this.Id_Rankin,
                                                    "Num_Visitas",""+this.Num_Visitas+"",
                                                    "Num_Descargas",""+this.Num_Descargas+"",
                                                    "Cant_5",""+this.Cant_5+"",
                                                    "Cant_4",""+this.Cant_4+"",
                                                    "Cant_3",""+this.Cant_3+"",
                                                    "Cant_2",""+this.Cant_2+"",
                                                    "Cant_1",""+this.Cant_1+"",
                                                    "Numero_Votos",""+this.Numero_Votos+"",
                                                    "Id_Version",""+this.Id_Version+"",
                                                    "","","","");
                        listo = true;
                    break;
            }
        } catch (Exception ran1) {
            ran1.printStackTrace();
        }
        if(operador == "-" && val == "SELECT"){
            return json = new Gson().toJson(listarRan);
        }else{
            if(operador == "" && val == "SELECT"){
                return rankin;
            }else{
                return listo;
            }
        }
    }
    
}
