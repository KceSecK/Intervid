package entidades;
import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

public class Usuario {
   private int UsuarioID;
   private String correo;
   private String clave;
   private String tipoCuenta;
   private String nomUsPos;
   private String apeUsPos;
   private int CuentaActiva;
   private Date fechaRegistro;

    public String getNomUsPos() {
        return nomUsPos;
    }

    public void setNomUsPos(String nomUsPos) {
        this.nomUsPos = nomUsPos;
    }

    public String getApeUsPos() {
        return apeUsPos;
    }

    public void setApeUsPos(String apeUsPos) {
        this.apeUsPos = apeUsPos;
    }

   

    
    public int getUsuarioID() {
        return UsuarioID;
    }

    public void setUsuarioID(int UsuarioID) {
        this.UsuarioID = UsuarioID;
    }

    public int getCuentaActiva() {
        return CuentaActiva;
    }

    public void setCuentaActiva(int CuentaActiva) {
        this.CuentaActiva = CuentaActiva;
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

    public String getTipoCuenta() {
        return tipoCuenta;
    }

    public void setTipoCuenta(String tipoCuenta) {
        this.tipoCuenta = tipoCuenta;
    }

    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }
    

}
