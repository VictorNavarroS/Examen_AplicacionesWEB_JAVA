/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
public class Productos {

    private int id_producto;
    private String serie;  
    private String nombre_producto;
    private String descripcion;
    private String cod_imagen;
    private int valor;
    private boolean estado;

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

     public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }
    public String getNombre_producto() {
        return nombre_producto;
    }

    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getCod_imagen() {
        return cod_imagen;
    }

    public void setCod_imagen(String cod_imagen) {
        this.cod_imagen = cod_imagen;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

     public boolean buscar(int id) {
        boolean resultado = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String strCon = "jdbc:mysql://localhost/examen";
            Connection con = DriverManager.getConnection(strCon, "root", "tinto666");
            String sql = "select * from productos where id_producto="+id+" ;";
            PreparedStatement smt = con.prepareStatement(sql);
            ResultSet res = smt.executeQuery();
            if (res.next()) {
                resultado = true;
                this.id_producto = res.getInt("id_producto");
                this.serie = res.getString("serie");
                this.nombre_producto = res.getString("nombre_producto");
                this.descripcion = res.getString("descripcion");
                this.cod_imagen = res.getString("cod_imagen");
                this.valor = res.getInt("valor");
                this.estado = res.getBoolean("estado");
            }
            res.close();
            smt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return resultado;
    }
    
    public ArrayList<Productos> getLista(String where) {
        ArrayList<Productos> lista = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String strCon = "jdbc:mysql://localhost/Examen";
            Connection con = DriverManager.getConnection(strCon, "root", "tinto666");
            String sql = "select * from Productos"+where;
            PreparedStatement smt = con.prepareStatement(sql);
            ResultSet res = smt.executeQuery(sql);
            while (res.next()) {
                Productos ob = new Productos();
                ob.setId_producto(res.getInt("id_producto"));
                ob.setSerie(res.getString("serie"));     
                ob.setNombre_producto(res.getString("nombre_producto"));
                ob.setDescripcion(res.getString("descripcion"));
                ob.setCod_imagen(res.getString("cod_imagen"));
                ob.setValor(res.getInt("valor"));
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
 public boolean ingresoProducto() {
        boolean resultado = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String strCon = "jdbc:mysql://localhost/examen";
            Connection con = DriverManager.getConnection(strCon, "root", "tinto666");
            String sql = "insert into Productos (serie,nombre_producto,descripcion,cod_imagen,valor,estado) values (?,?,?,?,?,?);";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, serie);
            smt.setString(2, nombre_producto);
            smt.setString(3, descripcion);
            smt.setString(4, cod_imagen);
            smt.setInt(5, valor);         
            smt.setBoolean(6, estado);
            resultado = smt.executeUpdate() > 0;
            smt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return resultado;
    }

    public boolean modProducto() {
        boolean resultado = false;        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String strCon = "jdbc:mysql://localhost/examen";
            Connection con = DriverManager.getConnection(strCon, "root", "tinto666");
            String sql = "update Productos set serie= ?, "
                    + " nombre_producto=?,"
                    + "	descripcion=?,"
                    + " cod_imagen =?,"
                    + " valor=?,"
                    + " estado=?,"                    
                    + "	where id_producto =?;";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, serie);
            smt.setString(2, nombre_producto);
            smt.setString(3, descripcion);
            smt.setString(4, cod_imagen);
            smt.setInt(5, valor);         
            smt.setBoolean(6, estado);
            smt.setInt(7, id_producto);
            resultado = smt.executeUpdate() > 0;
            smt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return resultado;
    }

    public boolean desactivaProducto() {
        boolean resultado = false;
        Usuarios ob = new Usuarios();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String strCon = "jdbc:mysql://localhost/examen";
            Connection con = DriverManager.getConnection(strCon, "root", "tinto666");
            String sql = "update Productos set estado=0 where id_producto =?;";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, id_producto); 
            resultado = smt.executeUpdate() > 0;

            smt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return resultado;
    }

}
