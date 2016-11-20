package M_Controller;

import M_Util.Elomac;
import java.sql.SQLException;
import org.json.JSONArray;
import org.json.JSONObject;

public class Peticiones implements Runnable {

    private Thread hilo;
    private String nombreHilo;
    private Elomac elo;
    private JSONObject jDato;
    private int tabla = 0;
    private int tipoElo = 0;
    private int option = 0;
    private String delimitador;
    private String[] datos = null;
    private String actualizar = "";
    private int optionSelect = 0;
    private int id = 0;
    private String data;
    private String resp;

    public Peticiones(int nombre, String datas) {
        nombreHilo = "hilo" + nombre;
        data = datas;
    }
    @Override
    public void run() {
        try {
            /*Menu - Crud_Controller
            1. Añadir Registro.
            2. Actualizar datos.
            3. Obtener datos - Solo para tablas
            4. Eliminar
            5. Obtener datos - Solo para vistas*/
            System.out.println(data);
            jDato = new JSONArray(data).getJSONObject(0);
            tipoElo = 1;
            option = jDato.getInt("opcion");
            tabla = jDato.getInt("tabla");
            datos = (String[]) Elomac.M_toArray(jDato.getString("datos"));
            delimitador = jDato.getString("delimitador");
            //actualizar = request.getParameter("actualizar");
            id = jDato.getInt("id");
            optionSelect = jDato.getInt("opSelect");
            elo = new Elomac(tabla, tipoElo, datos);
            switch (option) {
                case 1:
                    if (elo.Insert()) {
                        ManejoDatos();
                    }
                    break;
                case 2:
                    elo = new Elomac(tabla, tipoElo);
//                    if (elo.Update(elo.Select(Integer.parseInt(request.getParameter("id"))), request.getParameter("actualizar"))) {
//                        resp = "actualizado";
//                    } else {
//                        resp = "no actualizado";
//                    }
                    break;
                case 3:
                    ManejoDatos();
                    break;
                case 4:
                    break;
                case 5:
                    tipoElo = 2;
                    ManejoDatos();
                    break;
            }
        } catch (Exception falla) {
            resp = "Falla: " + falla.getMessage();
        } finally {
            try {
                elo.cerrarConexiones();
            } catch (SQLException ex) {
                resp = "Falla: " + ex.getMessage();
            }
        }
        setResp(resp);
    }

    private void ManejoDatos() throws Exception {
        Elomac elo1 = new Elomac(tabla, tipoElo);
        String[] elegir = (String[]) Elomac.M_toArray(jDato.getString("elegir"));
        try {
            switch (optionSelect) {
                case 1:
                    resp = elo1.Select();
                    break;
                case 2:
                    resp = elo1.Select(id);
                    break;
                case 3:
                    resp = elo1.Select(delimitador);
                    break;
                case 4:
                    resp = elo1.Select(elegir);
                    break;
                case 5:
                    resp = elo1.Select(elegir, id);
                    break;
                case 6:
                    resp = elo1.Select(elegir, delimitador);
                    break;
                default:
                    resp = "Default";
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp = e.getMessage();
        }
        setResp(resp);
    }

    public void start() {
        if (hilo == null) {
            hilo = new Thread(this, nombreHilo);
            hilo.start();
        }
    }

    public String getResp() {
        return resp;
    }

    public void setResp(String resp) {
        this.resp = resp;
    }
}
