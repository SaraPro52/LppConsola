package util;

import java.util.ArrayList;
import java.util.Iterator;
import modelo.Bean.Estado_Bean;
import modelo.Dao.Estado_Dao;

public class NewMain {

    public static void main(String[] args) {
        /*
          //p.ActualizarRegistroProce(2,"Area","Id_Area",3,"Nom_Area","HOLA QUE HACE","Lider_Area","MOVISTAR",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
          
          
          TipoEstado_Bean tebean1 = new TipoEstado_Bean(0,"Funciona");
          
          
          
          //tedao.AgregarRegistro(0, tabla, nom_Colum1, cont_colum1, nom_Colum2, cont_colum2, nom_Colum3, cont_colum3, nom_Colum4, cont_colum4, nom_Colum5, cont_colum5, nom_Colum6, cont_colum6, nom_Colum7, cont_colum7, nom_Colum8, cont_colum8, nom_Colum9, cont_colum9, nom_Colum10, cont_colum10, nom_Colum11, cont_colum11, nom_Colum12, cont_colum12);
          
          TipoEstado_Bean tebean = TipoEstado_Dao.consultarRegistro("claro");
          
          System.out.println(tebean.getId_Tipo_Estado());
          System.out.println(tebean.getNom_Tipo_Estado());
          
          TipoEstado_Dao tedao = new TipoEstado_Dao(tebean);
          
          tedao.Nom_Tipo_Estado = "claro1";
          tedao.ActualizarRegistro();*/
 /*
        Estado_Bean estadoBean = new Estado_Bean(0, "Esper");

        //estadoDao.AgregarRegistro();
        Estado_Bean e1 = Estado_Dao.consultarRegistro("mmm");

        Estado_Dao estadoDao = new Estado_Dao();

        System.out.println(e1.getNom_Estado());
        System.out.println(e1.getId_Estado());
         */
        int id = 25;
        String estado = ("Segundo");
        Estado_Bean eb = new Estado_Bean(estado);
        Estado_Dao ed = new Estado_Dao(eb);
        ed.AgregarRegistro();
        System.out.println("estado " + ed);
        /*
          ArrayList<Estado_Bean> listaE  = estadoDao.listar();
          
          Iterator<Estado_Bean> iteraE = listaE.iterator();
          
          while(iteraE.hasNext()){
              
              Estado_Bean estado = iteraE.next();
              
              System.out.println(estado.getId_Estado()+ " "+ estado.getNom_Estado());
              
          }*/
        //estadoDao.AgregarRegistro();
        //estadoDao.Nom_Estado = "mmm";
        //estadoDao.ActualizarRegistro();
    }
}
