package Controller;
import java.util.Random;
public class vasos {

    private String vaso;

    public vasos() {
    }

    public String getVaso() {
        return vaso;
    }

    public void setVaso(String vaso) {
        this.vaso = vaso;
    }
    public void AVasos() {
        String cadenaAleatoria = "";
        long milis = new java.util.GregorianCalendar().getTimeInMillis();
        Random r = new Random(milis);
        int i = 0;
        while (i < 15) {
            char c = (char) r.nextInt(255);
            if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '!' && c <= '@')) {
                cadenaAleatoria += c;
                i++;
            }
            this.vaso = cadenaAleatoria;
        }
    }
}
