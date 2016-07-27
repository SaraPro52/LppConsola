package util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;


public abstract class InterfaceCrud extends ClaseConn{
    
    
            protected Connection conn = null;
            protected Statement  st    = null;
            protected CallableStatement cst = null;
            protected ResultSet rs    = null;
            private String procedure = "";
            public boolean encontrado = false;
            public boolean listo = false;


            
        public InterfaceCrud(){
            super();
            try {
                conn = this.obtenerConn();
                st = conn.createStatement();

            } catch (SQLException a2) {
                Logger.getLogger(InterfaceCrud.class.getName()).log(Level.SEVERE,null,a2);
            }

        }
            
            public boolean AgregarRegistroProce(
                   
                int num_Colums,         String tabla,
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
                String nom_Colum11 ,    String cont_colum11 ,
                String nom_Colum12 ,    String cont_colum12) {

                try {
                  
                    procedure = "{call insertar(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
                 
                    cst = conn.prepareCall(procedure);

                    cst.setInt(1, num_Colums);       cst.setString(2, tabla);
                    cst.setString(3, nom_Colum1);    cst.setString(4, cont_colum1);
                    cst.setString(5, nom_Colum2);    cst.setString(6, cont_colum2);
                    cst.setString(7, nom_Colum3);    cst.setString(8, cont_colum3);
                    cst.setString(9, nom_Colum4);    cst.setString(10, cont_colum4);
                    cst.setString(11, nom_Colum5);   cst.setString(12, cont_colum5);
                    cst.setString(13, nom_Colum6);   cst.setString(14, cont_colum6);
                    cst.setString(15, nom_Colum7);   cst.setString(16, cont_colum7);
                    cst.setString(17, nom_Colum8);   cst.setString(18, cont_colum8);
                    cst.setString(19, nom_Colum9);   cst.setString(20, cont_colum9);
                    cst.setString(21, nom_Colum10);  cst.setString(22, cont_colum10);
                    cst.setString(23, nom_Colum11);  cst.setString(24, cont_colum11);
                    cst.setString(25, nom_Colum12);  cst.setString(26, cont_colum12);

                    cst.execute();
                    
                    listo = true;
                } catch (Exception a4) {
                    System.out.println("no listo");
                     Logger.getLogger(InterfaceCrud.class.getName()).log(Level.SEVERE,null,a4);
                }
                return listo;
            }
            
            
            public boolean ActualizarRegistroProce(
                int num_Colums,         String tabla,
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
                String nom_Colum11 ,    String cont_colum11 ,
                String nom_Colum12 ,    String cont_colum12)
            
            {
                try {
                    
                    procedure = "{call actualizar(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
                 
                    cst = conn.prepareCall(procedure);

                    cst.setInt(1, num_Colums);       cst.setString(2, tabla);
                    cst.setString(3,nom_ColumId);    cst.setInt(4,id_colum);   
                    cst.setString(5, nom_Colum1);    cst.setString(6, cont_colum1);
                    cst.setString(7, nom_Colum2);    cst.setString(8, cont_colum2);
                    cst.setString(9, nom_Colum3);    cst.setString(10, cont_colum3);
                    cst.setString(11, nom_Colum4);   cst.setString(12, cont_colum4);
                    cst.setString(13, nom_Colum5);   cst.setString(14, cont_colum5);
                    cst.setString(15, nom_Colum6);   cst.setString(16, cont_colum6);
                    cst.setString(17, nom_Colum7);   cst.setString(18, cont_colum7);
                    cst.setString(19, nom_Colum8);   cst.setString(20, cont_colum8);
                    cst.setString(21, nom_Colum9);   cst.setString(22, cont_colum9);
                    cst.setString(23, nom_Colum10);  cst.setString(24, cont_colum10);
                    cst.setString(25, nom_Colum11);  cst.setString(26, cont_colum11);
                    cst.setString(27, nom_Colum12);  cst.setString(28, cont_colum12);

                    cst.execute();
                    
                    listo = true;
                } catch (Exception a5) {
                    System.out.println("no listo");
                     Logger.getLogger(InterfaceCrud.class.getName()).log(Level.SEVERE,null,a5);
                }
                return listo;
            }
    
             public abstract boolean AgregarRegistro();
             public abstract boolean ActualizarRegistro();
}




