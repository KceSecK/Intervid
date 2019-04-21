
package entidades;

import java.util.Date;

public class UsuarioPostulante {
    
    int id_usuarioPostulante;
    String nomUsPos;
    String apeUsPos;
    String genero;
    String nacionalidad;
    String documento;
    String numDocumento;
    Date fechaNacimiento;
    String estadoCivil;
    int vehiculoUsuario;
    int discapacidadUsuario;

    public int getId_usuarioPostulante() {
        return id_usuarioPostulante;
    }

    public void setId_usuarioPostulante(int id_usuarioPostulante) {
        this.id_usuarioPostulante = id_usuarioPostulante;
    }

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

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getNumDocumento() {
        return numDocumento;
    }

    public void setNumDocumento(String numDocumento) {
        this.numDocumento = numDocumento;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(String estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public int getVehiculoUsuario() {
        return vehiculoUsuario;
    }

    public void setVehiculoUsuario(int vehiculoUsuario) {
        this.vehiculoUsuario = vehiculoUsuario;
    }

    public int getDiscapacidadUsuario() {
        return discapacidadUsuario;
    }

    public void setDiscapacidadUsuario(int discapacidadUsuario) {
        this.discapacidadUsuario = discapacidadUsuario;
    }
    
    
    
}
