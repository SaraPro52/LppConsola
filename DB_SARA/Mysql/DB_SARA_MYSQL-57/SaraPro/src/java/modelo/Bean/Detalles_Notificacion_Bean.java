
package modelo.Bean;

public class Detalles_Notificacion_Bean {
    
    private int Id_Detalles_Notificacion;
    private int Id_Notificacion;
    private int Id_Funcionario;
    
    public Detalles_Notificacion_Bean(){}
    
    public Detalles_Notificacion_Bean(int idNotif,int idFun){
    
        this.Id_Notificacion = idNotif;
        this.Id_Funcionario = idFun;
    }

    public int getId_Detalles_Notificacion() {
        return Id_Detalles_Notificacion;
    }

    public void setId_Detalles_Notificacion(int Id_Detalles_Notificacion) {
        this.Id_Detalles_Notificacion = Id_Detalles_Notificacion;
    }

    public int getId_Notificacion() {
        return Id_Notificacion;
    }

    public void setId_Notificacion(int Id_Notificacion) {
        this.Id_Notificacion = Id_Notificacion;
    }

    public int getId_Funcionario() {
        return Id_Funcionario;
    }

    public void setId_Funcionario(int Id_Funcionario) {
        this.Id_Funcionario = Id_Funcionario;
    }
    
}
