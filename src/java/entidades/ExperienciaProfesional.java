package entidades;

import java.sql.Date;

public class ExperienciaProfesional {

private Long ExperienciaProfesionalID;
private Long ExperienciaPostulanteFK;
private String EmpresaExperiencia;    
private String CargoDesempeño;
private String InicioPeriodo;
private String FinPeriodo;
private String FuncionesLogros;

    public Long getExperienciaProfesionalID() {
        return ExperienciaProfesionalID;
    }

    public void setExperienciaProfesionalID(Long ExperienciaProfesionalID) {
        this.ExperienciaProfesionalID = ExperienciaProfesionalID;
    }

    public Long getExperienciaPostulanteFK() {
        return ExperienciaPostulanteFK;
    }

    public void setExperienciaPostulanteFK(Long ExperienciaPostulanteFK) {
        this.ExperienciaPostulanteFK = ExperienciaPostulanteFK;
    }

    public String getEmpresaExperiencia() {
        return EmpresaExperiencia;
    }

    public void setEmpresaExperiencia(String EmpresaExperiencia) {
        this.EmpresaExperiencia = EmpresaExperiencia;
    }

    public String getCargoDesempeño() {
        return CargoDesempeño;
    }

    public void setCargoDesempeño(String CargoDesempeño) {
        this.CargoDesempeño = CargoDesempeño;
    }

    public String getInicioPeriodo() {
        return InicioPeriodo;
    }

    public void setInicioPeriodo(String InicioPeriodo) {
        this.InicioPeriodo = InicioPeriodo;
    }

    public String getFinPeriodo() {
        return FinPeriodo;
    }

    public void setFinPeriodo(String FinPeriodo) {
        this.FinPeriodo = FinPeriodo;
    }

    public String getFuncionesLogros() {
        return FuncionesLogros;
    }

    public void setFuncionesLogros(String FuncionesLogros) {
        this.FuncionesLogros = FuncionesLogros;
    }


}
