/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.Bean.FuncionarioBean;

public class Funcionario_Bean {

    protected int Id_Funcionario;
    protected double Num_Documento;
    protected String Nom_Funcionario;
    protected String Apellidos;
    protected String Correo;
    protected String Cargo;
    protected String Ip_Sena;
    protected String Contraseña;
    protected int Id_Area_Centro;
    protected int Id_Rol;

    public Funcionario_Bean(int Id_Funcionario, double Num_Documento, String Nom_Funcionario, String Apellidos, String Correo, String Cargo, String Ip_Sena, String Contraseña, int Id_Area_Centro, int Id_Rol) {

        this.Id_Funcionario = Id_Funcionario;
        this.Num_Documento = Num_Documento;
        this.Nom_Funcionario = Nom_Funcionario;
        this.Apellidos = Apellidos;
        this.Correo = Correo;
        this.Cargo = Cargo;
        this.Ip_Sena = Ip_Sena;
        this.Contraseña = Contraseña;
        this.Id_Area_Centro = Id_Area_Centro;
        this.Id_Rol = Id_Rol;

    }

    public Funcionario_Bean(double Num_Documento, String Nom_Funcionario, String Apellidos, String Correo, String Cargo, String Ip_Sena, String Contraseña, int Id_Area_Centro, int Id_Rol) {
        this.Num_Documento = Num_Documento;
        this.Nom_Funcionario = Nom_Funcionario;
        this.Apellidos = Apellidos;
        this.Correo = Correo;
        this.Cargo = Cargo;
        this.Ip_Sena = Ip_Sena;
        this.Contraseña = Contraseña;
        this.Id_Area_Centro = Id_Area_Centro;
        this.Id_Rol = Id_Rol;

    }

    public int getId_Rol() {
        return Id_Rol;
    }

    public void setId_Rol(int Id_Rol) {
        this.Id_Rol = Id_Rol;
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

    public int getId_Area_Centro() {
        return Id_Area_Centro;
    }

    public void setId_Area_Centro(int Id_Area_Centro) {
        this.Id_Area_Centro = Id_Area_Centro;
    }

}
