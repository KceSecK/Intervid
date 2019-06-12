
package entidades;


public class EducacionPostulante {
    
    private int EducacionPostulanteID;
    private int EducacionPostulanteFK;
    private String Institucion;
    private String NivelEstudio;
    private String EstadoEstudio;
    private String PeriodoInicio;
    private String PeriodoFin;
    private int PeriodoActual;

    public String getPeriodoInicio() {
        return PeriodoInicio;
    }

    public void setPeriodoInicio(String PeriodoInicio) {
        this.PeriodoInicio = PeriodoInicio;
    }

    public String getPeriodoFin() {
        return PeriodoFin;
    }

    public void setPeriodoFin(String PeriodoFin) {
        this.PeriodoFin = PeriodoFin;
    }

 

    public int getPeriodoActual() {
        return PeriodoActual;
    }

    public void setPeriodoActual(int PeriodoActual) {
        this.PeriodoActual = PeriodoActual;
    }
    
    

    public int getEducacionPostulanteID() {
        return EducacionPostulanteID;
    }

    public void setEducacionPostulanteID(int EducacionPostulanteID) {
        this.EducacionPostulanteID = EducacionPostulanteID;
    }

    public int getEducacionPostulanteFK() {
        return EducacionPostulanteFK;
    }

    public void setEducacionPostulanteFK(int EducacionPostulanteFK) {
        this.EducacionPostulanteFK = EducacionPostulanteFK;
    }

    public String getInstitucion() {
        return Institucion;
    }

    public void setInstitucion(String Institucion) {
        this.Institucion = Institucion;
    }

    public String getNivelEstudio() {
        return NivelEstudio;
    }

    public void setNivelEstudio(String NivelEstudio) {
        this.NivelEstudio = NivelEstudio;
    }

    public String getEstadoEstudio() {
        return EstadoEstudio;
    }

    public void setEstadoEstudio(String EstadoEstudio) {
        this.EstadoEstudio = EstadoEstudio;
    }
    
    
}
