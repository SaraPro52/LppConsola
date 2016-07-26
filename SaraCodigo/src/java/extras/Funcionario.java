package extras;
public class Funcionario {
    private double numDocumeto;
    private String nomFuncionario;
    private String tipoDocumento;
    private String apelllidos;
    private String correo;
    private String cargo;
    private String ipSena;
    private String anagrama;

    public Funcionario() {
    }    
    public void registrofuncionario (Double NunDocumento,String NomFuncionario, String TipoDocumento,String Apellido){
     this.numDocumeto= NunDocumento;
     this.nomFuncionario= NomFuncionario;
     this.tipoDocumento = TipoDocumento;
     this.apelllidos= Apellido;
    }
    public void registrofuncionario1 (String Correo,String Cargo,String IpSena,String Anagrama){
     this.correo = correo;
     this.cargo = Cargo;
     this.ipSena=IpSena;
     this.anagrama=Anagrama;
    }

    public double getNumDocumeto() {
        return numDocumeto;
    }

    public void setNumDocumeto(double numDocumeto) {
        this.numDocumeto = numDocumeto;
    }

    public String getNomFuncionario() {
        return nomFuncionario;
    }

    public void setNomFuncionario(String nomFuncionario) {
        this.nomFuncionario = nomFuncionario;
    }

    public String getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(String tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    public String getApelllidos() {
        return apelllidos;
    }

    public void setApelllidos(String apelllidos) {
        this.apelllidos = apelllidos;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getIpSena() {
        return ipSena;
    }

    public void setIpSena(String ipSena) {
        this.ipSena = ipSena;
    }

    public String getCooreo() {
        return anagrama;
    }
    public void setCooreo(String Anagrama) {
        this.anagrama = Anagrama;
    }
}
