package entidades;

import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

public class Usuario {

    String nomUsPos;
    String apeUsPos;
    String correo;
    String clave;
    String tipoCuenta;

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

}
