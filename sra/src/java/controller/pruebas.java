package controller;

import java.io.File;
import java.sql.Timestamp;
import modelo.Bean.Area_Bean;
import modelo.Bean.Detalles_Lista_Bean;
import modelo.Bean.Funcionario_Bean;
import modelo.Bean.Item_Lista_Bean;
import modelo.Bean.Lista_Chequeo_Bean;
import modelo.Bean.Producto_Virtual_Bean;
import modelo.Bean.Programa_Bean;
import modelo.Bean.Version_Bean;
import modelo.Dao.Area_Dao;
import modelo.Dao.Detalles_Lista_Dao;
import modelo.Dao.Funcionario_Dao;
import modelo.Dao.Item_Lista_Dao;
import modelo.Dao.Lista_Chequeo_Dao;
import modelo.Dao.Producto_Virtual_Dao;
import modelo.Dao.Programa_Dao;
import modelo.Dao.Version_Dao;

public class pruebas {

    public static void main(String[] args) {

        int tipo = Integer.parseInt("1");
        Funcionario_Bean fBean = new Funcionario_Bean();
        fBean.setNom_Funcionario("CNombre");
        fBean.setId_Tipo_Documento(1);
        fBean.setApellidos((("CApellido")));
        fBean.setNum_Documento(12345);
        fBean.setCorreo(("CEmail"));
        fBean.setCargo(("SCargo"));
        fBean.setIp_Sena(("CSena"));
        vasos contra = new vasos();
        contra.AVasos();
        fBean.setContraseña(contra.getVaso());
        fBean.setId_Estado(Integer.parseInt("1"));
        fBean.setId_Area_Centro(Integer.parseInt("1"));
        Funcionario_Dao fDao = new Funcionario_Dao(fBean);
        
        System.out.println(fDao.OperacionRegistro("INSERT", "", tipo));
        

//        ArchivosController intento = new ArchivosController();
//        
//        
//        
//        Programa_Bean Pbean3 = new Programa_Bean();
//        Programa_Dao Pdao3 = new Programa_Dao(Pbean3);
//        System.out.println(Pdao3.OperacionRegistro("SELECT", "-", 0));
//        Producto_Virtual_Bean oaBEan = new Producto_Virtual_Bean();
//        Producto_Virtual_Dao oaDao = new Producto_Virtual_Dao(oaBEan);
//        System.out.println(oaDao.OperacionRegistro("SELECT", "-", 0));
//
//        Detalles_Lista_Bean DetallesBen = new Detalles_Lista_Bean();
//        Detalles_Lista_Dao DetallesDao = new Detalles_Lista_Dao(DetallesBen);
//
//        System.out.println(DetallesDao.OperacionRegistro("SELECT", "-", 0));
//         Programa_Bean  Pbean3 = new Programa_Bean();
//         Programa_Dao  Pdao3 = new Programa_Dao(Pbean3);
//         System.out.println(Pdao3.OperacionRegistro("SELECT", 1, 0));
//        Funcionario_Dao fDao4 = new Funcionario_Dao();
//        Funcionario_Bean fBean4 = (Funcionario_Bean) fDao4.OperacionRegistro("SELECT", 2,5);
//        fBean4.setId_Estado(3);
//        fDao4 = new Funcionario_Dao(fBean4);
//        fDao4.OperacionRegistro("UPDATE", 0, 0);
//        Area_Bean abean = new Area_Bean();
//        Area_Dao adao = new Area_Dao(abean);
//        System.out.println(adao.OperacionRegistro("SELECT", 1, 0));
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
//        String array = ("1,2,3");
//        char j = ' ';
//        char[] acarc = array.toCharArray();
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
