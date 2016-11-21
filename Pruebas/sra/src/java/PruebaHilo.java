
import java.util.ArrayList;
import static javax.swing.UIManager.get;

class Multihilo implements Runnable {
    private Thread hilo;
    private String nombreHilo;

    Multihilo(String nombre) {
        nombreHilo = nombre;
    }
    public void run() {
        try {
            for (int i = 12; i > 0; i--) {
                System.out.println("Hilo: " + nombreHilo + ", " + i);
                // vamos a dormir el hilo unos 50s
                Thread.sleep(50);
            }
        } catch (InterruptedException e) {
            System.out.println("Hilo " + nombreHilo + " interrumpido." +e.getMessage());
        }

        System.out.println("Hilo " + nombreHilo + " termino.");
    }   

    public void start() {
        System.out.println("Iniciando " + nombreHilo);
        if (hilo == null) {
            hilo = new Thread(this, nombreHilo);
            hilo.start();
        }
    }
}

public class PruebaHilo {

    public static void main(String args[]) {
        ArrayList<String> hilo = new ArrayList<String>();
        for (int i = 0; i < 5; i++) {
            hilo.add("Hilo" + i);
            Multihilo u = new Multihilo(hilo.get(i));
            u.start();
        }
    }
}
