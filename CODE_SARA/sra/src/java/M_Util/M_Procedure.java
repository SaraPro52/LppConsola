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
                                                  "{call Registrar_OA(?)}",
                                                  "{call MACC(?)}"};            
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
                System.out.println("No SARA08");
                Logger.getLogger(M_Procedure.class.getName()).log(Level.SEVERE,null,s);
            }
            return rs;
        }  
        
        protected Object Registar(String todo,int val){
            String p = "";
            switch(val){
                case 1 : p = procedure[1];break;
                case 2 : p = procedure[2];break;
                case 3 : p = procedure[3];break;
                case 4 : p = procedure[4];break;
            }
            try {
            cst = this.obtenerConn().prepareCall(p);
            cst.setString(1,todo);
            cst.execute();
            if(val == 4)return cst.getResultSet();
            listo = true;
            } catch (Exception p2) {
                Logger.getLogger(M_Procedure.class.getName()).log(Level.SEVERE,null,p2);
            }
            return listo;
        }
        
        protected String Group(Object[] array ,char delimitardor){
            String group = "";
            for(int i= 0; i < array.length; i++){
                if(i == 0)group += array[i];
                else group += ""+delimitardor+""+array[i];
            }
            return group;
        }
}    
        

        
       





