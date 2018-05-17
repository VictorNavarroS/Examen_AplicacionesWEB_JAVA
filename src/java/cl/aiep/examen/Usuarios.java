package cl.aiep.examen;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Usuarios {

    private int id;
    private String rut;
    private String nombre;
    private String apellidos;
    private String correo;
    private String clave;
    private int tipo;
    private boolean estado;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public boolean logueo(String user, String pass) {
        boolean resultado = false;
        try {
            String dato;
            if (user.contains("@")) {
                dato = "correo";
            } else {
                dato = "rut";
            }
            Class.forName("com.mysql.jdbc.Driver");
            String strCon = "jdbc:mysql://localhost/examen";
            Connection con = DriverManager.getConnection(strCon, "root", "tinto666");
            String sql = "select * from usuarios where " + dato + " =? and clave = ? ";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, user);
            smt.setString(2, pass);
            ResultSet res = smt.executeQuery();
            if (res.next()) {
                resultado = true;
                this.id = res.getInt("id");
                this.rut = res.getString("rut");
                this.nombre = res.getString("nombre");
                this.apellidos = res.getString("apellidos");
                this.correo = res.getString("correo");
                this.tipo = res.getInt("tipo");
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
    
      public ArrayList<Usuarios> getUsuarios(String where) {
        ArrayList<Usuarios> lista = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String strCon = "jdbc:mysql://localhost/Examen";
            Connection con = DriverManager.getConnection(strCon, "root", "tinto666");
            String sql = "select * from Usuarios "+where;
            PreparedStatement smt = con.prepareStatement(sql);
            ResultSet res = smt.executeQuery(sql);
            while (res.next()) {
                Usuarios user = new Usuarios();
                user.setId(res.getInt("id"));
                user.setRut(res.getString("rut"));
                user.setNombre(res.getString("nombre"));
                user.setApellidos(res.getString("apellidos"));
                user.setCorreo(res.getString("correo"));
                user.setClave(res.getString("clave"));
                user.setTipo(res.getInt("tipo"));
                user.setEstado(res.getBoolean("estado"));
                lista.add(user);
            }
            res.close();
            smt.close();
            con.close();

        } catch (Exception ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return lista;
    }
    

    public boolean ingresoUsuario() {
        boolean resultado = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String strCon = "jdbc:mysql://localhost/examen";
            Connection con = DriverManager.getConnection(strCon, "root", "tinto666");
            String sql = "insert into usuarios (rut,nombre,apellidos,correo,clave,tipo,estado)values(?,?,?,?,?,?,?);";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, rut);
            smt.setString(2, nombre);
            smt.setString(3, apellidos);
            smt.setString(4, correo);
            smt.setString(5, clave);
            smt.setInt(6, tipo);
            smt.setBoolean(7, estado);
            resultado = smt.executeUpdate() > 0;
            smt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return resultado;
    }

    public boolean modUsuario() {
        boolean resultado = false;        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String strCon = "jdbc:mysql://localhost/examen";
            Connection con = DriverManager.getConnection(strCon, "root", "tinto666");
            String sql = "update usuarios set rut= ?, "
                    + " nombre=?,"
                    + "	apellidos=?,"
                    + " correo =?,"
                    + " clave=?,"
                    + " tipo=?,"
                    + " estado=? "
                    + "	where id =?;";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, rut);
            smt.setString(2, nombre);
            smt.setString(3, apellidos);
            smt.setString(4, correo);
            smt.setString(5, clave);            
            smt.setInt(6, tipo);
            smt.setBoolean(7, estado);
            smt.setInt(8, id);  
            resultado = smt.executeUpdate() > 0;
            smt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return resultado;
    }

    public boolean desactivaUsuario() {
        boolean resultado = false;
        Usuarios ob = new Usuarios();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String strCon = "jdbc:mysql://localhost/examen";
            Connection con = DriverManager.getConnection(strCon, "root", "tinto666");
            String sql = "update usuarios set estado=0 where id =?;";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, id); 
            resultado = smt.executeUpdate() > 0;

            smt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return resultado;
    }

}
