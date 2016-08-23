package controller;

import java.io.File;
import java.sql.Timestamp;
import modelo.Bean.Area_Bean;
import modelo.Bean.Item_Lista_Bean;
import modelo.Bean.Lista_Chequeo_Bean;
import modelo.Dao.Area_Dao;
import modelo.Dao.Item_Lista_Dao;
import modelo.Dao.Lista_Chequeo_Dao;

public class pruebas {

    public static void main(String[] args) {

        Area_Bean abean = new Area_Bean();
        Area_Dao adao = new Area_Dao(abean);
        System.out.println(adao.OperacionRegistro("SELECT", 1, 0));
        //System.out.println(new File ("Archivos\\").getAbsolutePath());
//        
//        Archivos a = new Archivos();       
//        a.setRuta("Teleinformatica", "ADSI", "JAVA");
//        System.out.println(a.getBase()); 
//        System.out.println(a.getRuta());
////        System.out.println(a.rutas
//        Lista_Chequeo_Bean lBean = new Lista_Chequeo_Bean();
//        lBean.setNom_Lista_Chequeo(("PorqueNOfunciona?"));
//        lBean.setId_Lista_Chequeo((1));
//        lBean.setDes_Lista_Chequeo(("Descripcion"));
        String array = ("1,2,3");
        char j = ' ';
        char[] acarc = array.toCharArray();

//        lBean.setId_Funcionario(2);
//        Lista_Chequeo_Dao lDao = new Lista_Chequeo_Dao(lBean);      
////        System.out.println("a" + lDao.OperacionRegistro("INSERT", 1, array));
//        System.out.println("Registro"+lDao.OperacionRegistro("SELECT", 1, 0));
        /*        
            Item_Lista_Bean itemBean = new Item_Lista_Bean("JUanito", 1);
            
            itemBean.setDes_Item_Lista(("nosss"));
            itemBean.setTipo_Item(1);
            Item_Lista_Dao itemDao = new Item_Lista_Dao(itemBean);
                    
    
            System.out.println(itemDao.OperacionRegistro("SELECT", 1, 0));
         */
    }

}
