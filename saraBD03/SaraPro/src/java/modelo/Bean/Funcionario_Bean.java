
package modelo.Bean;

public class Funcionario_Bean {
    
    private int Id_Funcionario;
    private double Num_Documento;
    private String Nom_Funcionario;
    private String Apellidos;
    private String Correo;
    private String Cargo;
    private String Ip_Sena;
    private String Contraseña;
    private int Id_Estado;
    private int Id_Area_Centro;
    
    public Funcionario_Bean(){}
    
    public Funcionario_Bean(int id_Funcionario,double num_Documento,String nom_Funcionario, String apellidos,
                            String correo, String cargo, String ip_Sena, String contraseña, int id_Estado, int id_Area_Centro){
        
        
        this.Id_Funcionario = id_Funcionario;
        this.Num_Documento = num_Documento;
        this.Nom_Funcionario = nom_Funcionario;
        this.Apellidos = apellidos;
        this.Correo  = correo;
        this.Cargo = cargo;
        this.Ip_Sena = ip_Sena;
        this.Contraseña = contraseña;
        this.Id_Estado = id_Estado;
        this.Id_Area_Centro = id_Area_Centro;
        
    }

    public int getId_Funcionario() {
        return Id_Funcionario;
    }

    public void setId_Funcionario(int Id_Funcionario) {
        this.Id_Funcionario = Id_Funcionario;
    }

    public double getNum_Documento() {
        return Num_Documento;
    }

    public void setNum_Documento(double Num_Documento) {
        this.Num_Documento = Num_Documento;
    }

    public String getNom_Funcionario() {
        return Nom_Funcionario;
    }

    public void setNom_Funcionario(String Nom_Funcionario) {
        this.Nom_Funcionario = Nom_Funcionario;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String Apellidos) {
        this.Apellidos = Apellidos;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getCargo() {
        return Cargo;
    }

    public void setCargo(String Cargo) {
        this.Cargo = Cargo;
    }

    public String getIp_Sena() {
        return Ip_Sena;
    }

    public void setIp_Sena(String Ip_Sena) {
        this.Ip_Sena = Ip_Sena;
    }

    public String getContraseña() {
        return Contraseña;
    }

    public void setContraseña(String Contraseña) {
        this.Contraseña = Contraseña;
    }

    public int getId_Estado() {
        return Id_Estado;
    }

    public void setId_Estado(int Id_Estado) {
        this.Id_Estado = Id_Estado;
    }

    public int getId_Area_Centro() {
        return Id_Area_Centro;
    }

    public void setId_Area_Centro(int Id_Area_Centro) {
        this.Id_Area_Centro = Id_Area_Centro;
    }
    
    
    
}
