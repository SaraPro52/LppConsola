package M_Controller;
import java.util.Random;
public class vasos {
    private String vaso;
    public vasos() {
        this.AVasos();
    }
    public String getVaso() {
        return vaso;
    }
    public void setVaso(String vaso) {
        this.vaso = vaso;
    }
    private void AVasos() {
        String vasos = "";
        long milis = new java.util.GregorianCalendar().getTimeInMillis();
        Random r = new Random(milis);
        int i = 0;
        while (i < 15) {
            char c = (char) r.nextInt(255);
            if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '!' && c <= '@')) {
                vasos += c;
                i++;
            }
            this.vaso = vasos;
        }
    }
}