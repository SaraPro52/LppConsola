
package modelo.Bean;

public class Rankin_Bean {
    
    private int Id_Rankin;
    private int Puesto;
    private int Num_Visitas;
    private int Num_Descargas;
    private int Cant_5;
    private int Cant_4;
    private int Cant_3;
    private int Cant_2;
    private int Cant_1;
    private int Numero_Votos;
    private int Id_Version;
    
    public Rankin_Bean(){}
    
    public Rankin_Bean(int puesto,int numV, int numD,int c5,int c4,int c3,int c2,int c1,int numVotos,int idVer){
        
        this.Puesto = puesto;
        this.Num_Visitas = numV;
        this.Num_Descargas = numD;
        this.Cant_5 = c5;
        this.Cant_4 = c4;
        this.Cant_3 = c3;
        this.Cant_2 = c2;
        this.Cant_1 = c1;
        this.Numero_Votos = numVotos;
        this.Id_Version = idVer;
    }

    public int getId_Rankin() {
        return Id_Rankin;
    }

    public void setId_Rankin(int Id_Rankin) {
        this.Id_Rankin = Id_Rankin;
    }

    public int getNum_Visitas() {
        return Num_Visitas;
    }

    public void setNum_Visitas(int Num_Visitas) {
        this.Num_Visitas = Num_Visitas;
    }

    public int getNum_Descargas() {
        return Num_Descargas;
    }

    public void setNum_Descargas(int Num_Descargas) {
        this.Num_Descargas = Num_Descargas;
    }

    public int getCant_5() {
        return Cant_5;
    }

    public void setCant_5(int Cant_5) {
        this.Cant_5 = Cant_5;
    }

    public int getCant_4() {
        return Cant_4;
    }

    public void setCant_4(int Cant_4) {
        this.Cant_4 = Cant_4;
    }

    public int getCant_3() {
        return Cant_3;
    }

    public void setCant_3(int Cant_3) {
        this.Cant_3 = Cant_3;
    }

    public int getCant_2() {
        return Cant_2;
    }

    public void setCant_2(int Cant_2) {
        this.Cant_2 = Cant_2;
    }

    public int getCant_1() {
        return Cant_1;
    }

    public void setCant_1(int Cant_1) {
        this.Cant_1 = Cant_1;
    }

    public int getNumero_Votos() {
        return Numero_Votos;
    }

    public void setNumero_Votos(int Numero_Votos) {
        this.Numero_Votos = Numero_Votos;
    }

    public int getId_Version() {
        return Id_Version;
    }

    public void setId_Version(int Id_Version) {
        this.Id_Version = Id_Version;
    }

    public int getPuesto() {
        return Puesto;
    }

    public void setPuesto(int Puesto) {
        this.Puesto = Puesto;
    }
    
    
}
