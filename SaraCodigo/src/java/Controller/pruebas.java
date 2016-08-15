package Controller;

import modelo.Bean.Centro_Bean;
import modelo.Bean.Funcionario_Bean;
import modelo.Dao.Centro_Dao;
import modelo.Dao.Funcionario_Dao;

public class pruebas {

    public static void main(String[] args) {
        
        int documento=(12346);
        String nombre=("CNombre");
        String apellido=("CApellido");
        String correo=("jalopez173@misena.edu.co");
        String cargo=("SCargo");
        String sena=("CSena");
        vasos contra = new vasos();
        contra.AVasos();
        String contr=(contra.getVaso());
        int estado=(1);
        int area =(1);
        
        Funcionario_Bean fBean = new Funcionario_Bean(documento,nombre,apellido,correo,cargo,sena,contr,estado,area);
        Funcionario_Dao fDao = new Funcionario_Dao(fBean);
        if (fDao.AgregarFuncionario(4)) {
            Correo c = new Correo();
            String destino = fBean.getCorreo();
            String asunto = "crear funcionario";
            String descripcion = "Hola:  Este es un correo con un usuario y contraseña temporales son Usuario" + fBean.getNum_Documento() + " contraseña: " + fBean.getContraseña();
            c.setMensaje(descripcion);
            c.setAsunto(asunto);
            c.setDestino(destino);
            CorreoController ce = new CorreoController();
            if (ce.enviarCorreo(c)) {
                System.out.println("Envio correcto, mira tu correo ;)");
            } else {
                System.out.println("Error");
            }

        }
        /*Centro_Bean cBean = new Centro_Bean();
        Centro_Dao cDao = new Centro_Dao(cBean);
        try {
            System.out.println("Lista" + cDao.listar());

        } catch (Exception e) {
        }*/
 /*vasos c = new vasos();
        c.AVasos();
        System.out.println("Nuevo vaso? " + c.getVaso());*/
 /*Correo c = new Correo();
        String pass= "12345";    
        String destino ="jalopez173@misena.edu.co";
        String asunto ="¿Funciona?";
        String descripcion ="Hola mundo de envio de correos realmente jajaj  funciona essto  Feliz dia ;) y tu pass es "+pass;

        c.setMensaje(descripcion);
        c.setAsunto(asunto);
        c.setDestino(destino);
        
       CorreoController ce = new CorreoController();
        if (ce.enviarCorreo(c)) {
            System.out.println("Envio correcto, mira tu correo ;)");
        }else{
            System.out.println("Error");
        }*/
    }
}
