package entidades;

import java.sql.Time;
import java.util.Date;

/**
 *
 * @author SaitaM
 */
public class OfertaLaboral {

    private int ofertaid;
    private String titulo;
    private int creador;
    private int empresa;
    private int lugartrabajo;
    private int tipoentrevista;
    private int plan;
    private String descripcion;
    private Date fechapublicacion;
    private Date fechafinalizacion;
    private String requisitos;
    private String beneficios;
    private Time horarioinicio;
    private Time horariofin;
    private String cargo;
    private String contrato;
    private String jornada;
    private int sueldo;

    public int getOfertaid() {
        return ofertaid;
    }

    public void setOfertaid(int ofertaid) {
        this.ofertaid = ofertaid;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getCreador() {
        return creador;
    }

    public void setCreador(int creador) {
        this.creador = creador;
    }

    public int getEmpresa() {
        return empresa;
    }

    public void setEmpresa(int empresa) {
        this.empresa = empresa;
    }

    public int getLugartrabajo() {
        return lugartrabajo;
    }

    public void setLugartrabajo(int lugartrabajo) {
        this.lugartrabajo = lugartrabajo;
    }

    public int getTipoentrevista() {
        return tipoentrevista;
    }

    public void setTipoentrevista(int tipoentrevista) {
        this.tipoentrevista = tipoentrevista;
    }

    public int getPlan() {
        return plan;
    }

    public void setPlan(int plan) {
        this.plan = plan;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getFechapublicacion() {
        return fechapublicacion;
    }

    public void setFechapublicacion(Date fechapublicacion) {
        this.fechapublicacion = fechapublicacion;
    }

    public Date getFechafinalizacion() {
        return fechafinalizacion;
    }

    public void setFechafinalizacion(Date fechafinalizacion) {
        this.fechafinalizacion = fechafinalizacion;
    }

    public String getRequisitos() {
        return requisitos;
    }

    public void setRequisitos(String requisitos) {
        this.requisitos = requisitos;
    }

    public String getBeneficios() {
        return beneficios;
    }

    public void setBeneficios(String beneficios) {
        this.beneficios = beneficios;
    }

    public Time getHorarioinicio() {
        return horarioinicio;
    }

    public void setHorarioinicio(Time horarioinicio) {
        this.horarioinicio = horarioinicio;
    }

    public Time getHorariofin() {
        return horariofin;
    }

    public void setHorariofin(Time horariofin) {
        this.horariofin = horariofin;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getContrato() {
        return contrato;
    }

    public void setContrato(String contrato) {
        this.contrato = contrato;
    }

    public String getJornada() {
        return jornada;
    }

    public void setJornada(String jornada) {
        this.jornada = jornada;
    }

    public int getSueldo() {
        return sueldo;
    }

    public void setSueldo(int sueldo) {
        this.sueldo = sueldo;
    }

}
