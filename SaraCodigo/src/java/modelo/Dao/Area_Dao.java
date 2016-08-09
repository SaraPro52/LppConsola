package modelo.Dao;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import modelo.Bean.Area_Bean;
import util.ClaseConn;
import util.InterfaceCrud;

public class Area_Dao extends InterfaceCrud {

    public int Id_Area;
    public String Nom_Area;
    public String Lider_Area;

    public Area_Dao() {
    }

    public Area_Dao(Area_Bean areB) {

        this.Id_Area = areB.getId_Area();
        this.Nom_Area = areB.getNom_Area();
        this.Lider_Area = areB.getLider_Area();
    }

    public static Area_Bean consultarRegistro(int Id_Area) {

        Area_Bean area = null;

        try {
            ClaseConn c = new ClaseConn();
            Connection co = c.obtenerConn();
            Statement st = co.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM Estado WHERE Id_Area = '" + Id_Area + "'");

            while (rs.next()) {

                area = new Area_Bean(Id_Area, rs.getString(2), rs.getString(3));
            }
        } catch (Exception are1) {
            are1.printStackTrace();
        }
        return area;
    }

    public String getAreas() throws Exception {
        ClaseConn co = new ClaseConn();
        ArrayList<Area_Bean> listarAreas = new ArrayList<Area_Bean>();
        try {
            st = co.obtenerConn().createStatement();
            procedure = "{call seleccionar(?)}";
            cst = conn.prepareCall(procedure);
            cst.setString(1, "Area");
            cst.execute();
            rs = cst.getResultSet();
            while (rs.next()) {

                Id_Area = rs.getInt("Id_Area");
                Nom_Area = rs.getString("Id_");

                Area_Bean areB = new Area_Bean();
                areB.setId_Area(Id_Area);
                areB.setNom_Area(Nom_Area);
                listarAreas.add(areB);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new Gson().toJson(listarAreas);
    }

    @Override
    public boolean AgregarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean ActualizarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
