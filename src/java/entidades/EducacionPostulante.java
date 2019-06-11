
package entidades;

public class EducacionPostulante {
    
    private int EducacionPostulanteID;
    private int EducacionPostulanteFK;
    private String Institucion;
    private String NivelEstudio;
    private String EstadoEstudio;

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
