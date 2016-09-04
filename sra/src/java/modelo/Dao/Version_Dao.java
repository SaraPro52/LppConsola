
package modelo.Dao;

import com.google.gson.Gson;
import java.sql.Timestamp;
import java.util.ArrayList;
import modelo.Bean.Version_Bean;
import util.InterfaceCrud;

public class Version_Dao extends InterfaceCrud{
    
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
    private ArrayList<Version_Bean> listarVer = new ArrayList<Version_Bean>();
    private Version_Bean ver = null;
    
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
    public Object OperacionRegistro(String val, String operador, Object objeto) {
        try {
            switch(val){
                case "SELECT":
                        rs = saraCrud(val,operador+"","Version","Id_Version",(int) objeto,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                        while(rs.next()){
                            ver = new Version_Bean( rs.getTimestamp("Fecha_Envio"),
                                                    rs.getTimestamp("Fecha_Publicacion"),    
                                                    rs.getInt("Num_Version"),
                                                    rs.getTimestamp("Fecha_Vigencia"),
                                                    rs.getString("Url_Version"),
                                                    rs.getString("Url_Img"),
                                                    rs.getString("Inst_Instalacion"),
                                                    rs.getString("Reqst_Instalacion"),
                                                    rs.getInt("Id_P_Virtual"),
                                                    rs.getInt("Id_Estado"),
                                                    rs.getInt("Id_Tipo_Version")
                                                    );
                            ver.setId_Version(rs.getInt("Id_Version"));
                            if(operador == "-")
                                listarVer.add(ver);
                        }
                        rs.close();
                        cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                        this.saraCrud(val,"8","Version","Id_Version",         this.Id_Version,
                                                      "Num_Version",        ""+this.Num_Version+"",
                                                      "Url_Version",        this.Url_Version,
                                                      "Url_Img",            this.Url_Img,
                                                      "Inst_Instalacion",   this.Inst_Instalacion,
                                                      "Reqst_Instalacion",  this.Reqst_Instalacion,
                                                      "Id_P_Virtual",       ""+this.Id_P_Virtual+"",
                                                      "Id_Estado",          ""+this.Id_Estado+"",
                                                      "Id_Tipo_Version",    ""+this.Id_Tipo_Version+"",
                                                      "","","","","","");
                        listo = true;
                    break;
            }
        } catch (Exception v1) {
            v1.printStackTrace();
        }
        if(operador == "-" && val == "SELECT"){
            return json = new Gson().toJson(listarVer);
        }else{
            if(operador == "" && val == "SELECT"){
                return ver;
            }else{
                return listo;
            }
        }
    }
    
    
    public boolean  RegistrarOA(
            String nomVirtual,String desVirtual,
            String palabras,int    idFormato,int    numVersion,
            String urlVersion,String urlImg,String instrucciones,
            String requisitos,String todoFun, int numFun ,String todoTem,int numTem 
            
    ){
//        String todoFun = "";
//        String todoTem = "";
//        for (int i = 0; i < funcionarios.length; i++) {
//            
//            if(i == 0)
//                todoFun += funcionarios[i];
//            else
//                todoFun += ","+funcionarios[i];
//        }
//        
//        for (int i = 0; i < temas.length; i++) {
//            
//            if(i == 0)
//                todoTem += temas[i];
//            else
//                todoTem += ","+temas[i];
//        }
        
        
        try {
            cst =conn.prepareCall("{call Registrar_OA(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            
            cst.setString(1, nomVirtual);
            cst.setString(2, desVirtual);
            cst.setString(3, palabras);
            cst.setInt(4, idFormato);
            cst.setInt(5, numVersion);
            cst.setString(6, urlVersion);
            cst.setString(7, urlImg);
            cst.setString(8, instrucciones);
            cst.setString(9, requisitos);
            cst.setString(10, todoFun);
            cst.setInt(11, numFun);
            cst.setString(12, todoTem);
            cst.setInt(13, numTem);
            cst.execute();
            
            listo = true;
            
        } catch (Exception oa) {
            oa.printStackTrace();
        }
        return listo;
    }
    
}
