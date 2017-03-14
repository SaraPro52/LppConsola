package M_Util;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
public class M_Procedure extends M_Connection{
            private     CallableStatement cst = null;
            protected   ResultSet rs    = null;
            private     final String[] procedure = {"{Call SARA_CRUD(?,?,?,?)}",
                                                  "{call RegistrarLista(?)}",
                                                  "{call RegistrarFuncionario(?)}",
                                                  "{call Registrar_PV(?)}",
                                                  "{call MACC(?)}",
                                                  "{call RegistrarEvaluacion(?)}",
                                                  "{call RegistrarCategoria(?)}",
                                                  "{call RegistrarVersion(?)}",
                                                  "{call CorreccionVersion(?)}",
                                                  "{call AprobarPV(?)}",
                                                  "{call ConsultaActualizar(?)}"
                                                  };    
                                                  
            public boolean listo = false;
            protected String json;

        public M_Procedure(){
            super();
        }
        
        protected  ResultSet saraCrud(String sentencia,String tabla,String contenido1, String contenido2){
            try {
                 cst = this.obtenerConn().prepareCall(procedure[0]);
                 cst.setString(1, sentencia);
                 cst.setString(2, tabla);
                 cst.setString(3, contenido1);
                 cst.setString(4, contenido2);  
                cst.execute();
                rs = cst.getResultSet();
            } catch (Exception s) {
                System.out.println("No se ejecuto los procedimientos "+s.getMessage());
                Logger.getLogger(M_Procedure.class.getName()).log(Level.SEVERE,null,s);
                
            }
            return rs;
        }  
        protected void Prueba(int valor){
            try {
                cst = this.obtenerConn().prepareCall("{call Pruebita(?,?)}");
                cst.setInt(1,valor);
                cst.registerOutParameter(2, java.sql.Types.VARCHAR);
                cst.execute();
                System.out.println(cst.getString(2));
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("no se pudo");
            }
        }
        
        protected Object Registar(String todo,int val){
            String p = "";
            switch(val){
                case 1 : p = procedure[1];break;
                case 2 : p = procedure[2];break;
                case 3 : p = procedure[3];break;
                case 4 : p = procedure[4];break;
                case 5 : p = procedure[5];break;
                case 6 : p = procedure[6];break;
                case 7 : p = procedure[7];break;
                case 8 : p = procedure[8];break;
                case 9 : p = procedure[9];break;
                case 10 : p = procedure[10];break;
            }
            try {
            cst = this.obtenerConn().prepareCall(p);
            cst.setString(1,todo);
            cst.execute();
            if(val == 4 || val == 10)return cst.getResultSet();
            listo = true;
            } catch (Exception p2) {
                Logger.getLogger(M_Procedure.class.getName()).log(Level.SEVERE,null,p2);
            }
            return listo;
        }
        
        public static String Group(Object[] array ,char delimitardor){
            String group = "";
            for(int i= 0; i < array.length; i++){
                if(i == 0)group += array[i];
                else group += ""+delimitardor+""+array[i];
            }
            return group;
        }
} 