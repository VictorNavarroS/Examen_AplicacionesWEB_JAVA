package cl.aiep.examen;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author TinTO
 */
public class Carrito {

    private int num_boleta;
    private String nombreCliente;
    private String rutCliente;
    private String serieProducto;
    private String nombreProducto;
    private int cantidad;
    private int valorUnitario;
    private boolean estado;

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public int getNum_boleta() {
        return num_boleta;
    }

    public void setNum_boleta(int num_boleta) {
        this.num_boleta = num_boleta;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getRutCliente() {
        return rutCliente;
    }

    public void setRutCliente(String rutCliente) {
        this.rutCliente = rutCliente;
    }

    public String getSerieProducto() {
        return serieProducto;
    }

    public void setSerieProducto(String serieProducto) {
        this.serieProducto = serieProducto;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getValorUnitario() {
        return valorUnitario;
    }

    public void setValorUnitario(int valorUnitario) {
        this.valorUnitario = valorUnitario;
    }

    public boolean ingresoCompra() {
        boolean resultado = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String strCon = "jdbc:mysql://localhost/examen";
            Connection con = DriverManager.getConnection(strCon, "root", "tinto666");
            String sql = "insert into compra (numero_compra,nombreCliente,rutCliente,serieProducto,nombreProducto,cantidad,valorUnitario,estado) values (?,?,?,?,?,?,?,?);";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, num_boleta);
            smt.setString(2, nombreCliente);
            smt.setString(3, rutCliente);
            smt.setString(4, serieProducto);
            smt.setString(5, nombreProducto);
            smt.setInt(6, cantidad);
            smt.setInt(7, valorUnitario);
            smt.setBoolean(8, true);
            resultado = smt.executeUpdate() > 0;
            smt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return resultado;
    }

    public ArrayList<Carrito> getListaCarrito(String where) {
        ArrayList<Carrito> lista = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String strCon = "jdbc:mysql://localhost/Examen";
            Connection con = DriverManager.getConnection(strCon, "root", "tinto666");
            String sql = "select * from Compra" + where;
            PreparedStatement smt = con.prepareStatement(sql);
            ResultSet res = smt.executeQuery(sql);
            while (res.next()) {
                Carrito ob = new Carrito();
                ob.setNum_boleta(res.getInt("numero_compra"));
                ob.setNombreCliente(res.getString("nombreCliente"));
                ob.setRutCliente(res.getString("rutCliente"));
                ob.setSerieProducto(res.getString("serieProducto"));
                ob.setNombreProducto(res.getString("nombreProducto"));
                ob.setCantidad(res.getInt("cantidad"));
                ob.setValorUnitario(res.getInt("valorUnitario"));
                ob.setEstado(res.getBoolean("estado"));
                lista.add(ob);
            }
            res.close();
            smt.close();
            con.close();

        } catch (Exception ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return lista;
    }
}
