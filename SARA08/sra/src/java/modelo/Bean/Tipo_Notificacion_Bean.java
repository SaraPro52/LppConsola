
package modelo.Bean;



public class Tipo_Notificacion_Bean {
    
    private int Id_Tipo_Notificacion;
    private String Nom_Tipo_Notif;
    private String Des_Tipo_Notif;
    
    public Tipo_Notificacion_Bean(){}
    
    public Tipo_Notificacion_Bean(String nomNotif,String desNotif){
        
        this.Nom_Tipo_Notif = nomNotif;
        this.Des_Tipo_Notif = desNotif;
    
    }

    public int getId_Tipo_Notificacion() {
        return Id_Tipo_Notificacion;
    }

    public void setId_Tipo_Notificacion(int Id_Tipo_Notificacion) {
        this.Id_Tipo_Notificacion = Id_Tipo_Notificacion;
    }

    public String getNom_Tipo_Notif() {
        return Nom_Tipo_Notif;
    }

    public void setNom_Tipo_Notif(String Nom_Tipo_Notif) {
        this.Nom_Tipo_Notif = Nom_Tipo_Notif;
    }

    public String getDes_Tipo_Notif() {
        return Des_Tipo_Notif;
    }

    public void setDes_Tipo_Notif(String Des_Tipo_Notif) {
        this.Des_Tipo_Notif = Des_Tipo_Notif;
    }
    
    
}
