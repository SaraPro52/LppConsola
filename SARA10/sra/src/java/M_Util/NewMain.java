package M_Util;
import M_Modelo.Categoria;
import M_Modelo.Version;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import org.json.JSONException;
import javax.script.ScriptException;

public class NewMain {

    public static void main(String[] args) throws ScriptException, InstantiationException, IllegalAccessException, JSONException {
        /*
          //p.ActualizarRegistroProce(2,"Area","Id_Area",3,"Nom_Area","HOLA QUE HACE","Lider_Area","MOVISTAR",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
          
          
          TipoEstado_Bean tebean1 = new TipoEstado_Bean(0,"Funciona");
          
          
          
          //tedao.AgregarRegistro(0, tabla, nom_Colum1, cont_colum1, nom_Colum2, cont_colum2, nom_Colum3, cont_colum3, nom_Colum4, cont_colum4, nom_Colum5, cont_colum5, nom_Colum6, cont_colum6, nom_Colum7, cont_colum7, nom_Colum8, cont_colum8, nom_Colum9, cont_colum9, nom_Colum10, cont_colum10, nom_Colum11, cont_colum11, nom_Colum12, cont_colum12);
          
          TipoEstado_Bean tebean = TipoEstado_Dao.consultarRegistro("claro");
          
          System.out.println(tebean.getId_Tipo_Estado());
          System.out.println(tebean.getNom_Tipo_Estado());
          
          TipoEstado_Dao tedao = new TipoEstado_Dao(tebean);
          
          tedao.Nom_Tipo_Estado = "claro1";
          tedao.ActualizarRegistro();
          
          //Estado_Bean estadoBean = new Estado_Bean(0, "Esper");
          
          
          //estadoDao.AgregarRegistro();
          
          Estado_Bean e1 = Estado_Dao.consultarRegistro(1);
          
          Estado_Dao estadoDao = new Estado_Dao();

          System.out.println(e1.getNom_Estado());
          System.out.println(e1.getId_Estado());
          
          
          ArrayList<Estado_Bean> listaE  = estadoDao.listar();
          
          Iterator<Estado_Bean> iteraE = listaE.iterator();
          
          while(iteraE.hasNext()){
              
              Estado_Bean estado = iteraE.next();
              
              System.out.println(estado.getId_Estado()+ " "+ estado.getNom_Estado());
              
          }
          
          //estadoDao.AgregarRegistro();
          
          //estadoDao.Nom_Estado = "mmm";
          //estadoDao.ActualizarRegistro();
       
          Area_Bean areB = Area_Dao.consultarRegistro(2);
          
          areB.setNom_Area("Mantenimiento");
          
          Area_Dao areaD = new Area_Dao(areB);
          
          areaD.ActualizarRegistro();
          
          
          ArrayList<Area_Bean>  listaA = areaD.listar();
          
          Iterator<Area_Bean> iteraA = listaA.iterator();
          
          while(iteraA.hasNext()){
              
              Area_Bean  are = iteraA.next();
              
              System.out.println(are.getId_Area() + " " + are.getNom_Area() + " " + are.getLider_Area());
          
              
          }
        Ciudad_Bean ciu = Ciudad_Dao.ConsultarRegistro(2);

        ciu.setNom_Ciudad("EEUU");

        Ciudad_Dao ciuD = new Ciudad_Dao(ciu);

        ciuD.ActualizarRegistro();

        ArrayList<Ciudad_Bean> listaC = ciuD.listar();
        Iterator<Ciudad_Bean> iteraC = listaC.iterator();

        while (iteraC.hasNext()) {

            Ciudad_Bean ci = iteraC.next();

            System.out.println(ci.getId_Ciudad() + " " + ci.getNom_Ciudad());

        }
        
 
        Rol_Bean r2 = Rol_Dao.consultarRegistro(6);
        
        r2.setNom_Rol("ado");
        
        System.out.println(r2.getId_Rol());
        
        Rol_Dao rd1 = new Rol_Dao(r2);
        
        rd1.ActualizarRegistro();
        
        ArrayList<Rol_Bean> listaR = rd1.listar();
        Iterator<Rol_Bean> iteraR = listaR.iterator();
        
        while(iteraR.hasNext()){
            
            Rol_Bean rol = iteraR.next();
            System.out.println(rol.getId_Rol() +" "+ rol.getNom_Rol()+" "+rol.getDes_Rol());
        }
        
        
        
        Centro_Bean cen = Centro_Dao.consultarRegistro(2);
        
        cen.setNom_Centro("adm");
        
        Centro_Dao cenD = new Centro_Dao(cen);
        
        cenD.ActualizarRegistro();
        
        ArrayList<Centro_Bean> listaC = cenD.listar();
        Iterator<Centro_Bean> interaC = listaC.iterator();
        
        while(interaC.hasNext()){
            
            Centro_Bean cent = interaC.next();
            
            System.out.println(cent.getId_Centro()+" "+cent.getNum_Centro()+" "+cent.getNom_Centro()+" "+cent.getDireccion()+" "+cent.getId_Ciudad());
            
            
        }
        
 
        
        Area_Centro_Bean acb = Area_Centro_Dao.consultarRegistro(1);
        
        acb.setId_Centro(2);
        
        Area_Centro_Dao acd = new Area_Centro_Dao(acb);
        
        acd.ActualizarRegistro();
        
        ArrayList<Area_Centro_Bean> listaC = acd.listar();
        Iterator<Area_Centro_Bean> interaC = listaC.iterator();
        
        while(interaC.hasNext()){
            
            Area_Centro_Bean acb1 = interaC.next();
            
            System.out.println(acb1.getId_Area_Centro()+" "+acb1.getId_Area()+" "+acb1.getId_Centro());
            
            
        }
        
 
        Rol_Funcionario_Bean rfb = Rol_Funcionario_Dao.consultarRegistro(8);
        
        rfb.setId_Funcionario(3);
        
        System.out.println(rfb.getId_Rol_Funcionario());
        System.out.println(rfb.getId_Rol());
        System.out.println(rfb.getId_Funcionario());
        
       Rol_Funcionario_Dao rfd = new Rol_Funcionario_Dao(rfb);
        
       rfd.ActualizarRegistro();
       
       ArrayList<Rol_Funcionario_Bean> listaC = rfd.listar();
        Iterator<Rol_Funcionario_Bean> interaC = listaC.iterator();
        
        while(interaC.hasNext()){
            
            Rol_Funcionario_Bean acb1 = interaC.next();
            
            System.out.println(acb1.getId_Rol_Funcionario()+" "+acb1.getId_Rol()+" "+acb1.getId_Funcionario());
            
            
        }
        
        
        Funcionario_Bean funB = Funcionario_Dao.consultarRegistro(7);
        
        
        funB.setNom_Funcionario("antonio");
        funB.setNum_Documento(188888);
        funB.setIp_Sena("3M3");
        funB.setCorreo("maro@hotmail");
        funB.setApellidos("Rodriguez");
        
        Funcionario_Dao funD = new Funcionario_Dao(funB);
        funD.AgregarFuncionario(4);
        
        
        ScriptEngineManager mam = new ScriptEngineManager();
        ScriptEngine in = mam.getEngineByName("js");
        
       
        String suma = "100 + 10";
        System.out.println();*/

//        Centro_Bean hola = (Centro_Dao.class.newInstance().consultarRegistro(5));
//        hola.setNum_Centro("255");
//       
//        Centro_Dao h = new Centro_Dao(hola);
//        
//        
//        h.OperacionRegistro("UPDATE");
//        System.out.println(hola.getId_Centro());
//
//           Centro_Dao cD = new Centro_Dao();
//
//           Centro_Bean c = (Centro_Bean) cD.OperacionRegistro("SELECT", 2, 5);
//           
//           System.out.println(c.getId_Centro());
//           c.setNom_Centro("jjHHH");
//           
//           Centro_Dao coo = new Centro_Dao(c);
//           
//           
//           coo.OperacionRegistro("UPDATE",0,0);
//           
//
//        ArrayList<Centro_Bean> listaC = (ArrayList<Centro_Bean>) cD.OperacionRegistro("SELECT", 1, 0);
//        Iterator<Centro_Bean> interaC = listaC.iterator();
//        
//        while(interaC.hasNext()){
//            
//            Centro_Bean cent = interaC.next();
//            
//            System.out.println(cent.getId_Centro()+" "+cent.getNum_Centro()+" "+cent.getNom_Centro()+" "+cent.getDireccion()+" "+cent.getId_Ciudad());
//            
//            
//        }
//        Area_Centro_Dao acb = new Area_Centro_Dao();
//        
//        Area_Centro_Bean are = (Area_Centro_Bean) acb.OperacionRegistro("SELECT",2, 2);
//        
//        System.out.println(are.getId_Area_Centro());
//        
//        are.setId_Centro(5);
//        Area_Centro_Dao a = new Area_Centro_Dao(are);
//        
//        
//        a.OperacionRegistro("UPDATE", 0, 0);
//        
//        ArrayList<Area_Centro_Bean> listaC = (ArrayList<Area_Centro_Bean>) a.OperacionRegistro("SELECT", 1, 0) ;
//        Iterator<Area_Centro_Bean> interaC = listaC.iterator();
//        
//        while(interaC.hasNext()){
//            
//            Area_Centro_Bean acb1 = interaC.next();
//            
//            System.out.println(acb1.getId_Area_Centro()+" "+acb1.getId_Area()+" "+acb1.getId_Centro());
//            
//            
//        }
//
//        Area_Dao aD = new Area_Dao();
//        
//        Area_Bean aB = new Area_Bean();
//        
//        aB.setNom_Area("Miguel");
//        aB.setLider_Area("OOO");
//        
//        Area_Dao a = new Area_Dao(aB);
//        
//        a.OperacionRegistro("INSERT", 0, 0);
//        ArrayList<Area_Bean>  listaA = (ArrayList<Area_Bean>) a.OperacionRegistro("SELECT", 1, 0);
//          
//          Iterator<Area_Bean> iteraA = listaA.iterator();
//          
//          while(iteraA.hasNext()){
//              
//              Area_Bean  are = iteraA.next();
//              
//              System.out.println(are.getId_Area() + " " + are.getNom_Area() + " " + are.getLider_Area());
//          
//              
//          }
//    
//          Ciudad_Dao cD1, cD2;
//          
//          cD1 = new Ciudad_Dao();
//          
//          Ciudad_Bean cB = (Ciudad_Bean) cD1.OperacionRegistro("SELECT", 2, 4);
//          
//          cB.setNom_Ciudad("M");
//          System.out.println(cB.getNom_Ciudad());
//          
//          cD2 = new Ciudad_Dao(cB);
//          
//          cD2.OperacionRegistro("UPDATE", 0, 0);
//          
//          
//        ArrayList<Ciudad_Bean> listaC = (ArrayList<Ciudad_Bean>) cD2.OperacionRegistro("SELECT", 1, 0);
//        Iterator<Ciudad_Bean> iteraC = listaC.iterator();
//        
//        while (iteraC.hasNext()) {
//
//            Ciudad_Bean ci = iteraC.next();
//
//            System.out.println(ci.getId_Ciudad() + " " + ci.getNom_Ciudad());
//
//        }
//        Estado_Dao eD1, eD2;
//        
//        eD1 = new Estado_Dao();
//        Estado_Bean eB = new Estado_Bean("POOO",2);
//  
//        System.out.println(eB.getNom_Estado());
//        
//        eD2 = new Estado_Dao(eB);
//        
//        
//            ArrayList<Estado_Bean> listaE  = (ArrayList<Estado_Bean>) eD2.OperacionRegistro("SELECT",1, 0);
//          
//          Iterator<Estado_Bean> iteraE = listaE.iterator();
//          
//          while(iteraE.hasNext()){
//              
//              Estado_Bean estado = iteraE.next();
//              
//              System.out.println(estado.getId_Estado()+ " "+ estado.getNom_Estado());
//              
//          }
//
//        
//        Funcionario_Dao f1,f2;
//        f1 = new Funcionario_Dao();
//        Funcionario_Bean funB = (Funcionario_Bean) f1.OperacionRegistro("SELECT", 2, 8);
//        
//        
//        funB.setNom_Funcionario("ant");
//        funB.setNum_Documento(18);
//        funB.setIp_Sena("3M");
//        funB.setCorreo("maro@hotl");
//        funB.setApellidos("Ro");
//        
//        //Funcionario_Dao funD = new Funcionario_Dao(funB);
//        //funD.AgregarFuncionario(4);
//        
//        f2 = new Funcionario_Dao(funB);
//        //f2.OperacionRegistro("INSERT", 0, 0);
//        
//        ArrayList<Funcionario_Bean> listaC = (ArrayList<Funcionario_Bean>) f2.OperacionRegistro("SELECT", 1, 0);
//        Iterator<Funcionario_Bean> interaC = listaC.iterator();
//        
//        while(interaC.hasNext()){
//            
//            Funcionario_Bean acb1 = interaC.next();
//            
//            System.out.println( acb1.getId_Funcionario() + " " + acb1.getNom_Funcionario());
//            
//            
//        }
//        
//        Rol_Dao r1, r2 ;
//        
//        r1 = new Rol_Dao();
//        
//        Rol_Bean rb = (Rol_Bean) r1.OperacionRegistro("SELECT", 2, 1);
//        
//        System.out.println(rb.getNom_Rol());
//        
//        rb.setNom_Rol("222");
//        rb.setDes_Rol("DDDD");
//        r2 = new Rol_Dao(rb);
//        
//        //r2.OperacionRegistro("INSERT", 0, 0);
//        
//        ArrayList<Rol_Bean> listaR = (ArrayList<Rol_Bean>) r2.OperacionRegistro("SELECT", 1, 0);
//        Iterator<Rol_Bean> iteraR = listaR.iterator();
//        
//        while(iteraR.hasNext()){
//            
//            Rol_Bean rol = iteraR.next();
//            System.out.println(rol.getId_Rol() +" "+ rol.getNom_Rol()+" "+rol.getDes_Rol());
//        }
//        Rol_Funcionario_Dao rf1, rf2;
//        
//        rf1 = new Rol_Funcionario_Dao();
//        
//        Rol_Funcionario_Bean r = (Rol_Funcionario_Bean) rf1.OperacionRegistro("SELECT", 2, 1);
//        
//        System.out.println(r.getId_Rol_Funcionario());
//        
//        r.setId_Rol(2);
//        r.setId_Funcionario(8);
//        
//        rf2 = new Rol_Funcionario_Dao(r);
//        
//        
//        
//        ArrayList<Rol_Funcionario_Bean> listaC = (ArrayList<Rol_Funcionario_Bean>) rf2.OperacionRegistro("SELECT", 1, 0);
//        Iterator<Rol_Funcionario_Bean> interaC = listaC.iterator();
//        
//        while(interaC.hasNext()){
//            
//            Rol_Funcionario_Bean acb1 = interaC.next();
//            
//            System.out.println(acb1.getId_Rol_Funcionario()+" "+acb1.getId_Rol()+" "+acb1.getId_Funcionario());
//            
//            
//        }
//
//          Tipo_Estado_Dao te1,te2;
//          
//          te1 = new Tipo_Estado_Dao();
//          
//          Tipo_Estado_Bean t = (Tipo_Estado_Bean) te1.OperacionRegistro("SELECT", 2, 3);
//          
//          t.setNom_Tipo_Estado("MMM");
//          te2 = new Tipo_Estado_Dao(t);
//          te2.OperacionRegistro("UPDATE", 0, 0);
//          
//          ArrayList<Tipo_Estado_Bean> t1 = (ArrayList<Tipo_Estado_Bean>) te2.OperacionRegistro("SELECT", 1, 0);
//          Iterator<Tipo_Estado_Bean> ite = t1.iterator();
//          
//          while(ite.hasNext()){
//              
//              Tipo_Estado_Bean tt = ite.next();
//              
//              System.out.println(tt.getId_Tipo_Estado() +" "+ tt.getNom_Tipo_Estado());
//          
//          }
//        Tipo_Documento_Dao td1, td2;
//        
//        td1 = new Tipo_Documento_Dao();
//        
//        Tipo_Documento_Bean t1 = (Tipo_Documento_Bean) td1.OperacionRegistro("SELECT", 2, 4);
//        
//        t1.setNom_Tipo_Documento("y");
//        
//        td2 = new Tipo_Documento_Dao(t1);
//        
//        td2.OperacionRegistro("UPDATE", 0, 0);
//        
//        ArrayList<Tipo_Documento_Bean> ta1 = (ArrayList<Tipo_Documento_Bean>) td2.OperacionRegistro("SELECT", 1, 0);
//        Iterator<Tipo_Documento_Bean> ite = ta1.iterator();
//          
//          while(ite.hasNext()){
//              
//              Tipo_Documento_Bean tt = ite.next();
//              
//              System.out.println(tt.getId_Tipo_Documento() +" "+ tt.getNom_Tipo_Documento());
//          
//          }
//            Item_Lista_Dao it1, it2;
//            
//            it1 = new Item_Lista_Dao();
//            
//            Item_Lista_Bean i = (Item_Lista_Bean) it1.OperacionRegistro("SELECT", 2, 10);
//            
//            
//            i.setTipo_Item("0");
//            System.out.println(i.getTipo_Item());
//            
//            it2 = new Item_Lista_Dao(i);
//            
//            it2.OperacionRegistro("UPDATE", 0, 0);
//            
//            System.out.println(it2.OperacionRegistro("SELECT", 1, 0));
//            ArrayList<Item_Lista_Bean> ta1 = (ArrayList<Item_Lista_Bean>) it2.OperacionRegistro("SELECT", 1, 0);
//            Iterator<Item_Lista_Bean> ite = ta1.iterator();
//
//              while(ite.hasNext()){
//
//                  Item_Lista_Bean tt = ite.next();
//
//                  System.out.println(tt.getId_Item_Lista()+" "+tt.getDes_Item_Lista() +" "+ tt.getTipo_Item());
//
//              }
//             Lista_Chequeo_Dao lc1,lc2;
//             
//             lc1 = new Lista_Chequeo_Dao();
//             
//             Lista_Chequeo_Bean l = (Lista_Chequeo_Bean) lc1.OperacionRegistro("SELECT", 2, 5);
//             
//             System.out.println(l.getNom_Lista_Chequeo());
//             
//             l.setNom_Lista_Chequeo("ho");
//             
//             lc2 = new Lista_Chequeo_Dao(l);
//             
//             lc2.OperacionRegistro("UPDATE", 0, 0);
//             
//             ArrayList<Lista_Chequeo_Bean> ta1 = (ArrayList<Lista_Chequeo_Bean>) lc2.OperacionRegistro("SELECT", 1, 0);
//               Iterator<Lista_Chequeo_Bean> ite = ta1.iterator();
//
//              while(ite.hasNext()){
//
//                  Lista_Chequeo_Bean tt = ite.next();
//
//                  System.out.println(tt.getId_Lista_Chequeo()+" "+tt.getNom_Lista_Chequeo() +" "+ tt.getFecha_Creacion());
//
//              }
//        Detalles_Lista_Dao dt1, dt2;
//        
//        dt1 = new Detalles_Lista_Dao();
//        
//        Detalles_Lista_Bean d = (Detalles_Lista_Bean) dt1.OperacionRegistro("SELECT", 2, 4);
//        
//        System.out.println(d.getId_Detalles_Lista());
//        d.setId_Item_Lista(2);
//        
//        dt2 = new Detalles_Lista_Dao(d);
//        
//        dt2.OperacionRegistro("UPDATE", 0, 0);
//        
//        ArrayList<Detalles_Lista_Bean> ta1 = (ArrayList<Detalles_Lista_Bean>) dt2.OperacionRegistro("SELECT", 1, 0);
//               Iterator<Detalles_Lista_Bean> ite = ta1.iterator();
//
//              while(ite.hasNext()){
//
//                  Detalles_Lista_Bean tt = ite.next();
//
//                  System.out.println(tt.getId_Detalles_Lista()+" "+tt.getId_Lista_Chequeo() +" "+ tt.getId_Item_Lista());
//
//              }
//        Programa_Dao pro1,pro2;
//        
//        pro1 = new Programa_Dao();
//        
//        Programa_Bean p = (Programa_Bean) pro1.OperacionRegistro("SELECT", 2, 2);
//        
//        System.out.println(p.getNom_Programa());
//        p.setNom_Programa("HOTO");
//        
//        pro2 = new Programa_Dao(p);
//        
//        pro2.OperacionRegistro("UPDATE", 0, 0);
//        
//        ArrayList<Programa_Bean> ta1 = (ArrayList<Programa_Bean>) pro2.OperacionRegistro("SELECT", 1, 0);
//               Iterator<Programa_Bean> ite = ta1.iterator();
//
//              while(ite.hasNext()){
//
//                  Programa_Bean tt = ite.next();
//
//                  System.out.println(tt.getId_Programa()+" "+tt.getNom_Programa() +" "+ tt.getNivel_Formacion());
//
//              }
//            Detalles_Area_Dao da1,da2;
//            
//            da1 = new Detalles_Area_Dao();
//            
//            Detalles_Area_Bean d = (Detalles_Area_Bean) da1.OperacionRegistro("SELECT", 2, 5);
//            
//            d.setId_Area(2);
//            
//            System.out.println(d.getId_Detalles_Area());
//            
//            da2 = new Detalles_Area_Dao(d);
//            
//            da2.OperacionRegistro("UPDATE", 0, 0);
//            ArrayList<Detalles_Area_Bean> ta1 = (ArrayList<Detalles_Area_Bean>) da2.OperacionRegistro("SELECT", 1, 0);
//               Iterator<Detalles_Area_Bean> ite = ta1.iterator();
//
//              while(ite.hasNext()){
//
//                  Detalles_Area_Bean tt = ite.next();
//
//                  System.out.println(tt.getId_Detalles_Area() +" "+ tt.getId_Programa()+" "+ tt.getId_Area());
//
//              }
//
//            Tema_Dao te1,te2;
//            
//            te1 = new Tema_Dao();
//            
//            Tema_Bean t = (Tema_Bean) te1.OperacionRegistro("SELECT", 2, 2);
//            
//            System.out.println(t.getNom_Tema());
//            
//            t.setNom_Tema("H");
//            t.setDes_Tema("i");
//            
//            te2 = new Tema_Dao(t);
//            
//            te2.OperacionRegistro("UPDATE", 0, 0);
//            
//            ArrayList<Tema_Bean> ta1 = (ArrayList<Tema_Bean>) te2.OperacionRegistro("SELECT", 1, 0);
//               Iterator<Tema_Bean> ite = ta1.iterator();
//
//              while(ite.hasNext()){
//
//                  Tema_Bean tt = ite.next();
//
//                  System.out.println(tt.getId_Tema() +" "+ tt.getNom_Tema()+" "+ tt.getDes_Tema());
//
//              }
//                Detalles_Programa_Dao dp1,dp2;
//                
//                dp1 = new Detalles_Programa_Dao();
//                
//                Detalles_Programa_Bean d = (Detalles_Programa_Bean) dp1.OperacionRegistro("SELECT", 2, 2);
//                
//                
//                System.out.println(d.getId_Detalles_Programa());
//                
//                d.setId_Tema(2);
//                
//                dp2 = new Detalles_Programa_Dao(d);
//                
//                dp2.OperacionRegistro("UPDATE", 0, 0);
//                
//                ArrayList<Detalles_Programa_Bean> ta1 = (ArrayList<Detalles_Programa_Bean>) dp2.OperacionRegistro("SELECT", 1, 0);
//               Iterator<Detalles_Programa_Bean> ite = ta1.iterator();
//
//              while(ite.hasNext()){
//
//                  Detalles_Programa_Bean tt = ite.next();
//
//                  System.out.println(tt.getId_Detalles_Programa() +" "+ tt.getId_Tema()+" "+ tt.getId_Programa());
//
//              }
//
//                Formato_Dao ft1,ft2;
//                
//                ft1 = new Formato_Dao();
//                
//                Formato_Bean f = (Formato_Bean) ft1.OperacionRegistro("SELECT", 2, 3);
//                
//                f.setNom_Formato("222");
//                f.setDes_Formato("jW");
//                
//                System.out.println(f.getNom_Formato());
//                
//                ft2 = new Formato_Dao(f);
//                
//                ft2.OperacionRegistro("UPDATE", 0, 0);
//                
//                ArrayList<Formato_Bean> ta1 = (ArrayList<Formato_Bean>) ft2.OperacionRegistro("SELECT", 1, 0);
//               Iterator<Formato_Bean> ite = ta1.iterator();
//
//              while(ite.hasNext()){
//
//                  Formato_Bean tt = ite.next();
//
//                  System.out.println(tt.getId_Formato() +" "+ tt.getNom_Formato()+" "+ tt.getDes_Formato());
//
//              }
//            Producto_Virtual_Dao pv1,pv2;
//            
//            pv1 = new Producto_Virtual_Dao();
//            
//            Producto_Virtual_Bean p = (Producto_Virtual_Bean) pv1.OperacionRegistro("SELECT", 2, 1);
//            
//            
//            System.out.println(p.getNom_P_Virtual());
//            
//            p.setNom_P_Virtual("hh");
//            p.setDes_P_Virtual("wwww");
//            p.setPalabras_Clave("sss");
//            
//            pv2 = new Producto_Virtual_Dao(p);
//            
//            pv2.OperacionRegistro("INSERT", 0, 0);
//            
//            ArrayList<Producto_Virtual_Bean> ta1 = (ArrayList<Producto_Virtual_Bean>) pv2.OperacionRegistro("SELECT", 1, 0);
//               Iterator<Producto_Virtual_Bean> ite = ta1.iterator();
//
//              while(ite.hasNext()){
//
//                  Producto_Virtual_Bean tt = ite.next();
//
//                  System.out.println(tt.getId_P_Virtual() +" "+ tt.getNom_P_Virtual()+" "+ tt.getPalabras_Clave());
//
//              }
//    
//            Detalles_Tema_Dao dt1,dt2;
//            
//            dt1 = new Detalles_Tema_Dao();
//            
//           Detalles_Tema_Bean d = (Detalles_Tema_Bean) dt1.OperacionRegistro("SELECT", 2, 1);
//           
//           System.out.println(d.getId_Detalles_Tema());
//           
//           dt2 = new Detalles_Tema_Dao(d);
//           
//           dt2.OperacionRegistro("INSERT", 0, 0);
//           
//           ArrayList<Detalles_Tema_Bean> ta1 = (ArrayList<Detalles_Tema_Bean>) dt2.OperacionRegistro("SELECT", 1, 0);
//               Iterator<Detalles_Tema_Bean> ite = ta1.iterator();
//
//              while(ite.hasNext()){
//
//                  Detalles_Tema_Bean tt = ite.next();
//
//                  System.out.println(tt.getId_Detalles_Tema() +" "+ tt.getId_Tema()+" "+ tt.getId_P_Virtual());
//
//              }
//
//            Tipo_Version_Dao tv1, tv2;
//            
//            tv1 = new Tipo_Version_Dao();
//            
//            Tipo_Version_Bean t = (Tipo_Version_Bean) tv1.OperacionRegistro("SELECT", 2, 3);
//            
//            
//            System.out.println(t.getNom_Tipo_Version());
//            
//            t.setNom_Tipo_Version("HO");
//            t.setDes_Version("dd");
//            tv2 = new Tipo_Version_Dao(t);
//            
//            tv2.OperacionRegistro("UPDATE", 0, 0);
//            
//            ArrayList<Tipo_Version_Bean> ta1 = (ArrayList<Tipo_Version_Bean>) tv2.OperacionRegistro("SELECT", 1, 0);
//               Iterator<Tipo_Version_Bean> ite = ta1.iterator();
//
//              while(ite.hasNext()){
//
//                  Tipo_Version_Bean tt = ite.next();
//
//                  System.out.println(tt.getId_Tipo_Version() +" "+ tt.getNom_Tipo_Version()+" "+ tt.getDes_Version());
//
//              }
//
//            Version_Dao v1, v2;
//            
//            v1 = new Version_Dao();
//            
//            Version_Bean v = (Version_Bean) v1.OperacionRegistro("SELECT", 2, 6);
//            
//            
//            System.out.println(v.getId_Version());
//            
//            v.setNum_Version(5);
//            
//            v2 = new Version_Dao(v);
//            
//            v2.OperacionRegistro("UPDATE", 0, 0);
//            
//            
//            ArrayList<Version_Bean> ta1 = (ArrayList<Version_Bean>) v2.OperacionRegistro("SELECT", 1, 0);
//               Iterator<Version_Bean> ite = ta1.iterator();
//
//              while(ite.hasNext()){
//
//                  Version_Bean tt = ite.next();
//
//                  System.out.println(tt.getId_Version()+" "+ tt.getNum_Version()+" "+ tt.getFecha_Envio()+" "+ tt.getFecha_Publicacion());
//
//              }
//              Rankin_Dao ra1,ra2;
//              
//              ra1 = new Rankin_Dao();
//              
//              Rankin_Bean r = (Rankin_Bean) ra1.OperacionRegistro("SELECT", 2, 4);
//              
//              r.setCant_5(1);
//              
//              ra2 = new Rankin_Dao(r);
//              
//              ra2.OperacionRegistro("UPDATE", 0, 0);
//              
//              ArrayList<Rankin_Bean> ta1 = (ArrayList<Rankin_Bean>) ra2.OperacionRegistro("SELECT", 1, 0);
//               Iterator<Rankin_Bean> ite = ta1.iterator();
//
//              while(ite.hasNext()){
//
//                  Rankin_Bean tt = ite.next();
//
//                  System.out.println(tt.getId_Version()+" "+ tt.getNum_Descargas()+" "+ tt.getCant_5()+" "+ tt.getId_Rankin());
//
//              }
//                Comentario_Dao co1,co2;
//                
//                co1 = new Comentario_Dao();
//                
//                Comentario_Bean c = (Comentario_Bean) co1.OperacionRegistro("SELECT", 2, 1);
//                
//                System.out.println(c.getComentario());
//                
//                c.setComentario("MIGUEL");
//                co2 = new Comentario_Dao(c);
//                
//                co2.OperacionRegistro("UPDATE",0, 0);
//                
//                System.out.println(co2.OperacionRegistro("SELECT", 1, 0));
//              ArrayList<Comentario_Bean> ta1 = (ArrayList<Comentario_Bean>) co2.OperacionRegistro("SELECT", 1, 0);
//               Iterator<Comentario_Bean> ite = ta1.iterator();
//
//              while(ite.hasNext()){
//
//                  Comentario_Bean tt = ite.next();
//
//                  System.out.println(tt.getId_Comentario()+" "+ tt.getComentario()+" "+ tt.getId_Funcionario()+" "+ tt.getId_Version());
//
//              }
//              Autor_Dao a1, a2;
//              
//              a1 = new Autor_Dao();
//              
//              Autor_Bean a = (Autor_Bean) a1.OperacionRegistro("SELECT", 2, 1);
//              a.setId_Version(2);
//              
//              a2 = new Autor_Dao(a);
//              
//              
//              a2.OperacionRegistro("UPDATE", 0, 0);
//              
//              System.out.println(a2.OperacionRegistro("SELECT", 1, 0));
//              
//              
//              Funcionario_Dao fun = new Funcionario_Dao();
//                Evaluacion_General_Dao eg1,eg2;
//                
//                eg1 = new Evaluacion_General_Dao();
//                
//                Evaluacion_General_Bean e = (Evaluacion_General_Bean) eg1.OperacionRegistro("SELECT", 2, 2);
//                
//                e.setObservacion("NO S");
//                e.setResultado("1");
//                
//                eg2 = new Evaluacion_General_Dao(e);
//                
//                eg2.OperacionRegistro("INSERT", 0, 0);
//                
//                System.out.println(eg2.OperacionRegistro("SELECT", 1, 0));
//                
//              Detalles_Evaluacion_Dao dt1, dt2;
//              
//              dt1 = new Detalles_Evaluacion_Dao();
//              
//              Detalles_Evaluacion_Bean d = (Detalles_Evaluacion_Bean) dt1.OperacionRegistro("SELECT", 2, 1);
//              
//              d.setObservacion("SIIIIIII");
//              
//              dt2 = new Detalles_Evaluacion_Dao(d);
//              
//              dt2.OperacionRegistro("UPDATE", 0, 0);
//              System.out.println(dt2.OperacionRegistro("SELECT", 1, 0));
//              
////        
////        if(loo == true)
////            System.out.println("sooooooo");
//        Funcionario_Dao f1,f2;
//        f1 = new Funcionario_Dao();
//        Funcionario_Bean funB = (Funcionario_Bean) f1.OperacionRegistro("SELECT", "", 2);
//        
//        
//        funB.setNom_Funcionario("aww");
//        funB.setNum_Documento(111);
//        funB.setIp_Sena("3ww");
//        funB.setCorreo("maro@howw");
//        funB.setApellidos("Rww");
//        
//        f2 = new Funcionario_Dao(funB);
//        boolean  loo = (boolean) f2.OperacionRegistro("INSERT", "", 1);
//        if(loo == true)
//           System.out.println("sooooooo");
//        Detalles_Lista_Dao dl1;
//        
//        dl1 = new Detalles_Lista_Dao();
//        
//        System.out.println(dl1.OperacionRegistro("SELECT","-", 1));
//        Area_Centro_Dao ac1,ac2;
//        
//        ac1 = new Area_Centro_Dao();
//        
//        Area_Centro_Bean a = (Area_Centro_Bean) ac1.OperacionRegistro("SELECT", "", "1");
//        
//        System.out.println(a.getId_Area_Centro());
//        
//        a.setId_Area(1);
//        
//        ac2 = new Area_Centro_Dao(a);
//        
//        //ac2.OperacionRegistro("UPDATE","","0");
//        
//        ac2.OperacionRegistro("INSERT","","0");
//        
//        System.out.println(ac1.OperacionRegistro("SELECT", "-", "0"));
//        Lista_Chequeo_Dao lc1,lc2;
//        lc1 = new Lista_Chequeo_Dao();
//        
//        
//        Lista_Chequeo_Bean l = (Lista_Chequeo_Bean) lc1.OperacionRegistro("SELECT", "", 1);
//        
//        System.out.println(l.getId_Lista_Chequeo() + " " + l.getNom_Lista_Chequeo());
//        
//        System.out.println(lc1.ope);
//        lc2 = new Lista_Chequeo_Dao(l);
//        lc2.OperacionRegistro("UPDATE", "", 0);   
//lc2 = new Lista_Chequeo_Dao();
//    s
//        System.out.println(lc2.OperacionRegistro("SELECT", "-", 0));
//        Item_Lista_Dao it = new Item_Lista_Dao();
//        
//        it.ope = ' ';
//
//        System.out.println(it.OperacionRegistro("SELECT","", 2));
//Detalles_Area_Dao d1 = new Detalles_Area_Dao();
//
//        System.out.println(d1.OperacionRegistro("SELECT", "-", 0));
//        
//        Detalles_Area_Bean b = (Detalles_Area_Bean) d1.OperacionRegistro("SELECT", "", 1);
//        
//        System.out.println(b.getId_Programa());
//        b.setId_Programa(2);
//        
//        d1 = new Detalles_Area_Dao(b);
//        
//        d1.OperacionRegistro("UPDATE", "", 0);
//        
//        System.out.println(d1.OperacionRegistro("SELECT", "-", 0));
//Detalles_Programa_Dao dp = new Detalles_Programa_Dao();
//
//        System.out.println(dp.OperacionRegistro("SELECT", "-", 0));
// LLAMO LOS PROGRAMAS QUE ESTEN REGISTRADOS EN EL AREA NUMERO 1
//        Programa_Dao pr = new Programa_Dao();
//        
//        System.out.println(pr.OperacionRegistro("SELECT", "", 1));//EL 1 ESPECIFICA EL ID DEL AREA
//
//Tema_Dao td = new Tema_Dao();
//    
//td.ope = 'S';
//
//        System.out.println(td.OperacionRegistro("SELECT", "", 1));
//        
//        Version_Dao ver =  new Version_Dao();
//        
//        int[] fun = {1,2,3};
//        int[] tem = {3,4,2};
//        
//        ver.RegistrarOA("Merooo","UN eCHrwooooooo" , "HOLAweroooo, QUE Hre",1,1,"CARPETAA/Dwerroooo","CATPETIIE/wreroooo","INICwreroooooo","FINALIrerwoooo","1,2",2,"2,3,4",3);
//---------------------------------------------------------------------------------------
//        Funcionario_Dao da1 = new Funcionario_Dao();
//        
//        String[] arr = {"1","1","43411","emmrrrryñññ1","Gonzarrrrlezñ1","emmy@hortmailññññ11","Apreizrrrñññ11ñ","E111ñ111","123","1","1","1"};
//        
//        da1.OperacionRegistro("INSERT","",arr);
// 
//        System.out.println(da1.OperacionRegistro("SELECT","-","0"));
//-----------------------------------------------------------------------------
//        Item_Lista_Dao lc1 = new Item_Lista_Dao();
//        String[] it = {"2"};
//        System.out.println(lc1.restoItems(it));
//        
//        String[] a = {"Nombre1","Descripcion1","2"};
//        String[] i = {"1","2","3"};
//      
//        lc1 = new Lista_Chequeo_Dao();
//        
//        lc1.RegistrarLista(a,i);
/////////////////////////////////////////////////////////////////////////////        
//Ciudad_Dao  c1 = new Ciudad_Dao();
//
//        System.out.println(c1.OperacionRegistro("SELECT", "-", "*"));
//        
        //String[] ar = {"Id_P_Virtual","Nom_P_Virtual~Generalidades","Des_P_Virtual~General","Palabras_Clave~Generalidad,Totalidad","Id_Formato~1"};
//        Ciudad_Dao ci = new Ciudad_Dao();
//        ci.Nom_Ciudad = "Medellin";
//        System.out.println(ci.Crud("SELECT", ""));
//////////////////////////////////////////////////////////////////////////////////////////
//
//        Funcionario_Dao fu = new Funcionario_Dao();
//        String[] f= {"1","1","1122","abGGG333rr","GGGGG3u","3uGGG333u","AGG333rr","33345","3355334","1","1","1"};
//        fu.RegistrarFuncionario(f);
//        System.out.println(fu.Crud("SELECT","",""));
///////////////////////////////////////////////////////////////////////////////////////////////////////////
//        Area_Centro_Dao a = new Area_Centro_Dao();
//
//        System.out.println(a.Crud("SELECT","0","Id_Area_Centro if null eiruoeru nor "));
//        Ciudad_Dao d = new Ciudad_Dao();
//        System.out.println(d.Crud("DELETE", "Nom_Ciudad = 'jeje'"));
//
//Version_Dao v = new Version_Dao();
//
//String[] ver = {"152222222","222222 C2222","H232222222,4453253244","1","1","C55522223223/2D22275122","C22142422/552427","I252423227","FI52532227222"};
//String[] fun = {"1"};
//String[] tema = {"2-1","2-0"};
//
//v.RegistrarOA(ver,fun,tema);
//        Funcionario_Dao fun = new Funcionario_Dao(new Funcionario_Dao().Select("1"));
//        int[] u = {1}; 
//        Funcionario_Dao ee = new Funcionario_Dao(u);
//        
//    
//        JSONObject d = new JSONObject(new Funcionario_Dao().Select("1"));
//     
//        System.out.println(d);
//        
//    JSONArray arr1 = new JSONArray((String) new Funcionario_Dao().Select("2"));
//////////////////        JSONObject J = new JSONArray((String) new Funcionario_Dao().Select("3")).getJSONObject(0);
//////////////////    
//////////////////        System.out.println(J.getString("Apellidos"));
//////////////////        for(int i = 0;i < J.names().length();i++){
//////////////////            System.out.println(J.getString((String)J.names().get(i)));
//////////////////        }
//////////////////        
//////////////////        
//        Funcionario_Dao funk = new Funcionario_Dao((String)(new Funcionario_Dao().Select("1")));
//        
//        System.out.println(new Funcionario_Dao().Crud("SELECT", "", ""));
//        funk.Apellidos = "TALVEXXX";
//        
//        System.out.println(funk.Id_Tipo_Documento);
//        System.out.println(funk.Nom_Funcionario);
//        System.out.println(funk.Apellidos);
//                
//       funk.Crud("UPDATE","","Id_Funcionario = 1");
//       
//        System.out.println(new Funcionario_Dao().Ola("DESCRIBE V_Detalles_Lista"));
//
//        Ciudad_Pru ci = new Ciudad_Pru();
//        
//        Funcionario_Pru fu = new Funcionario_Pru();
//        
//        System.out.println(fu.Select());
//        
//        System.out.println(ci.atributos.get("Nom_Ciudad"));
//        ci.atributos.replace("Id_Ciudad","8");
//        ci.atributos.replace("Nom_Ciudad","mppprryyyyrrp");
//        System.out.println(ci.atributos.get("Id_Ciudad")+"  "+ci.atributos.get("Nom_Ciudad"));
//        ci.Update();
//                
//        System.out.println(ci.Select());
        ///////////////////////////////////////////////////////////////////////////////////
        //////////////////////////////////////////////////////////////////////////////////
//        Area a = new Area();
//        a.load(new Area().Select(1));
//        
//        System.out.println(a.atributos.get("Id_Area"));
//        System.out.println(a.atributos.get("Nom_Area"));
//        System.out.println(a.atributos.get("Lider_Area"));
//        
//        a.atributos.replace("Id_Area",4);
//        a.atributos.replace("Nom_Area", "delee");
//        a.atributos.replace("Lider_Area","teeee");
//        a.Insert();
//        
//        a.Delete("Id_Area", "=", "3");
//        a.Delete(3);
//        System.out.println(a.Select());
//        Funcionario fun = new Funcionario();
//        String[] f= {"1","1","1122","abGGG333rr","GGGGG3u","3uGGG333u","AGG333rr","33345","3355334","1","1","1"};
//        System.out.println(fun.RegistrarFuncionario(f));
//        new Rol_Funcionario().Delete(10);
//        new Funcionario().Delete(10);
//        System.out.println(fun.Select());
//        Lista_Chequeo li = new Lista_Chequeo();
//        
//        String[] a1 = {"PRU11","EVA11","2"};
//        String[] a2 = {"1","2","3"};
//        li.RegistrarLista(a1,a2);
//        
//        System.out.println(li.Select());
//        Version v = new Version();
//        String[] ver = {"152222222","222222 C2222","H232222222,4453253244","1","1","C55522223223/2D22275122","C22142422/552427","I252423227","FI52532227222"};
//        String[] fun = {"1"};
//        String[] tema = {"2-1","2-0"};
//        v.RegistrarOA(ver, fun, tema);
//        
//        System.out.println(v.Select());
//        Ciudad ci = new Ciudad();
//        System.out.println(ci.Select());
//        Area_Centro1 a = new Area_Centro1();
//        System.out.println(a.Select());
//        String[] json = {"2","NOMBRE22992","jeje29922"};
//        int tabla = 0;
//        
//        String[][] datos = new String[2][2];
//        
//        
//        datos[0][0] = "1";datos[0][1] = "eJUAN";
//        datos[1][0] = "2";datos[1][1] = "cliJUAN";
//        
//        
//        Elomac elo = new Elomac("Area");
//        Elomac elo1 = new Elomac(17,1);
//        System.out.println(elo1.Select());
//
////        elo.Insert();
//        
//        elo1.Update(elo1.Select(1), "[{'9':'2'}]");
//        System.out.println(elo1.Select());
//        System.out.println(elo.Select(6));
//        Elomac elo1 = new Elomac("Ciudad");
//        System.out.println(elo1.Select(6));
//////////////////////////////////// EVALUACION
//        String[] s1 = {"observacionral","0","1","1","2"};
//        String[] s2 = {"0¤no cumple con el item¤1","1¤si cumple con el item¤2"};
//        
//        Evaluacion_General eva = new Evaluacion_General();
//        eva.RegistrarEvaluacion(s1, s2);
//        System.out.println(new Eloview(2).Select());
//        
//        int[] num = {1};
//        Eloview e = new Eloview(2);
//        System.out.println(e.Select(num));
        //e.Update();
//        String[] num = {"1"};
//        Elomac el = new Elomac(2,2);
//        System.out.println(el.Select(num,2));
//        el = new Elomac(2,2);
//        System.out.println(el.Select(num,"Id_Area","=","2"));
//
//        String[] num1 = {"1"};
//        V_Area v  = new V_Area();
//        System.out.println(v.Select(num1));
//
////Ciudad c = new Ciudad();
////c.atributos.replace("Nom_Ciudad", "Prueba");
////c.Insert();
////Ciudad c1 = new Ciudad();
////c1.atributos.replace("Nom_Ciudad", "Prueb2");
////c1.Insert(); 
//
//        System.out.println(c1.Select());
//
//        String j = "[{colum:0,operador:6,valor1:'1,2',valor2:0,añadir:1},"
//                + "{colum:1,operador:9,valor1:'\"Armenia\"',valor2:0}]";
//        
//        System.out.println(new Elomac("Ciudad",1).Select(j));
//        
//
//        Elomac e2 = new Elomac(1,2);
//        System.out.println(e2.Select());
//        String basePath = "D:/dev/workspace/MyProject/WebContent";
//        String absolutePath = "D:/dev/workspace/MyProject/WebContent/stats/stats.csv";
////
////        String relativePath = new File(basePath).toURI().
////                relativize(new File(absolutePath).toURI()).getPath();
////
////        System.out.println(relativePath);   // stats/stats.csv
////        String[] ca = {"Prueba Juan","Descripcion Juan","2"};
////        Categoria c = new Categoria();
////        
////        System.out.println(c.RegistrarCategoria(ca, "1,2"));
////        System.out.println(c.Select());
////        Elomac e = new Elomac(10, 2);
////        System.out.println(e.Select());
//
////          Version v = new Version();
////          String[] info = {"1","JAVAURL/1","JAVAURL/2","INTRUCCION JAVA 1","REQUISITOS JAVA 1"};
////          String[] func = {"1","5"};
////          v.RegistrarVersion(info, func);
//
////Version v = new Version();
////
////String[] correccion = {"1","8","Prueba desde java/ si"};
////v.CorreccionVersion(correccion);
//
//    Version v = new Version();
//    String[] publicar = {"4","5"}; 
//    v.AprobarPV(publicar);

    }
}
