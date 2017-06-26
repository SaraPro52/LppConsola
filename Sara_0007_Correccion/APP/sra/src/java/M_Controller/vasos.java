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
        while (i < 5) {
            int valorDado = (int) Math.floor(Math.random() * 9 + 1);
            vasos += valorDado;
            i++;
            this.vaso = vasos;
        }
    }
}
