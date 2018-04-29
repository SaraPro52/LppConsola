package M_Util;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
public class M_Procedure extends M_Connection{
            private     CallableStatement cst = null;
            protected   ResultSet rs    = null;
            private static final String[] procedure = {"{Call SARA_CRUD(?,?,?,?)}",
                                                  "{call RegistrarLista(?)}",
                                                  "{call RegistrarFuncionario(?)}",
                                                  "{call Registrar_PV(?,?)}",
                                                  "{call MACC(?)}",
                                                  "{call RegistrarEvaluacion(?)}",
                                                  "{call RegistrarCategoria(?)}",
                                                  "{call RegistrarVersion(?,?)}",
                                                  "{call CorreccionVersion(?,?)}",
                                                  "{call AprobarPV(?,?)}",
                                                  "{call ConsultaActualizar(?)}",
                                                  "{call InfoDB(?)}",
                                                  "{call ConsultarNotificaciones(?)}",
                                                  "{call ConsultaVistaActualizar(?)}",
                                                  "{call RegistarActualizacion(?,?)}",
                                                  "{call RegistrarItem_Tema(?)}",//20/04/2017
                                                  "{call ModificarLista(?)}",//23/04/2017
                                                  "{call ConsultarReporte(?)}",
                                                  "{call ConsultarGrafica(?)}",
                                                  "{call ConsultaVistaSubirPV(?)}",
                                                  "{call ModificarContraseña(?)}",
                                                  "{call Login(?)}",
                                                  "{call RegistrarRankin(?)}",
                                                  "{call Tema_Procedure(?)}",//23
                                                  "{call Programa_Procedure(?)}",
                                                  "{call Area_Procedure(?)}",
                                                  "{call Centro_Procedure(?)}",
                                                  "{call Formato_Procedure(?)}",
                                                  "{call TipoFormato_Procedure(?)}",
                                                  "{call Asignar_Rol(?)}",
                                                  "{call MisProductos(?)}"
                                                  };    
                                                  
            public boolean listo = false;
            protected String json;

        public M_Procedure(){
            super();
        }
        
        protected  ResultSet saraCrud(String sentencia,String tabla,String contenido1, String contenido2){
            ResultSet rs1 = null;
            Connection co = null;
            try {
                 co = this.obtenerConn();
                 CallableStatement cst1 = co.prepareCall(procedure[0]);
                 cst1.setString(1, sentencia);
                 cst1.setString(2, tabla);
                 cst1.setString(3, contenido1);
                 cst1.setString(4, contenido2);  
                cst1.execute();
                rs1 = cst1.getResultSet();
                return rs1;
            } catch (Exception s) {
                System.out.println("No se ejecuto los procedimientos "+s.getMessage());
                Logger.getLogger(M_Procedure.class.getName()).log(Level.SEVERE,null,s);
                
                return null;
            }
            
        }  
        protected String RegistarReturn(String todo,int val){
            try {
                Connection co = this.obtenerConn();
                CallableStatement cst2 = co.prepareCall(procedure[val]);
                cst2.setString(1,todo);
                cst2.registerOutParameter(2, java.sql.Types.VARCHAR);
                cst2.execute();
                System.out.println(cst2.getString(2));
                return cst2.getString(2);
            } catch (Exception e) {
                e.printStackTrace();
                return "null";
            }
        }
        
        protected Object Registar(String todo,int val){
            try {
                Connection co = this.obtenerConn();
                CallableStatement cst3 = co.prepareCall(procedure[val]);
                cst3.setString(1,todo);
                cst3.execute();
                if(val == 4 || val == 10 || val == 11 || val == 12 || val == 13 
                   || val == 15 || val == 17 || val == 18 || val == 19 || val == 21
                   || val == 23 || val == 24 || val == 25 || val == 26 || val == 27
                   || val == 28 || val == 29 || val == 30) {//20/04/2017
                    return cst3.getResultSet();
                }
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