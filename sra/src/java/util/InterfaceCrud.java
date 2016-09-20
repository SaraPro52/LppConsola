package util;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;


public abstract class InterfaceCrud extends ClaseConn{
    
            protected CallableStatement cst = null;
            protected ResultSet rs    = null;
            private   final String p = "{Call Sara(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            public boolean listo = false;
            protected String json;

        public InterfaceCrud(){
            super();
        }
        
        public abstract Object OperacionRegistro(String val, String operador, Object objeto);
        
        public  ResultSet saraCrud(
                String sentencia,
                String num_Colums,         String tabla,
                String nom_ColumId,     int id_colum,     
                String nom_Colum1,      String cont_colum1 , 
                String nom_Colum2 ,     String cont_colum2,
                String nom_Colum3 ,	String cont_colum3 ,
                String nom_Colum4 ,	String cont_colum4 ,
                String nom_Colum5 ,     String cont_colum5,
                String nom_Colum6 ,	String cont_colum6,
                String nom_Colum7 ,	String cont_colum7,
                String nom_Colum8 ,	String cont_colum8 ,
                String nom_Colum9 ,	String cont_colum9 ,
                String nom_Colum10 ,    String cont_colum10 ,
                String nom_Colum11 ,    String cont_colum11){
            
            try {

                            cst = this.obtenerConn().prepareCall(p);
                            cst.setString(1, sentencia);
                            cst.setString(2, num_Colums);       cst.setString(3, tabla);
                            cst.setString(4,nom_ColumId);    cst.setInt(5,id_colum);   
                            cst.setString(6, nom_Colum1);    cst.setString(7, cont_colum1);
                            cst.setString(8, nom_Colum2);    cst.setString(9, cont_colum2);
                            cst.setString(10, nom_Colum3);   cst.setString(11, cont_colum3);
                            cst.setString(12, nom_Colum4);   cst.setString(13, cont_colum4);
                            cst.setString(14, nom_Colum5);   cst.setString(15, cont_colum5);
                            cst.setString(16, nom_Colum6);   cst.setString(17, cont_colum6);
                            cst.setString(18, nom_Colum7);   cst.setString(19, cont_colum7);
                            cst.setString(20, nom_Colum8);   cst.setString(21, cont_colum8);
                            cst.setString(22, nom_Colum9);   cst.setString(23, cont_colum9);
                            cst.setString(24, nom_Colum10);  cst.setString(25, cont_colum10);
                            cst.setString(26, nom_Colum11);  cst.setString(27, cont_colum11);
                      
                cst.execute();
                
                rs = cst.getResultSet();
                
            } catch (Exception s) {
                System.out.println("No sara");
                Logger.getLogger(InterfaceCrud.class.getName()).log(Level.SEVERE,null,s);
            }
            return rs;
        }    
}    
        

        
       





