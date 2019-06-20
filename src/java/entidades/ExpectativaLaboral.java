
package entidades;


public class ExpectativaLaboral {

private Long ExpectativaLaboralID;    
private Long ExpectativaPostulanteFK;    
private Long RegionPreferente;    
private int ExpectativaRenta;
private String TipoMoneda;
private String JornadaPreferente;
private int DisponibilidadViaje;
private int CambioResidencia;

    public Long getExpectativaLaboralID() {
        return ExpectativaLaboralID;
    }

    public void setExpectativaLaboralID(Long ExpectativaLaboralID) {
        this.ExpectativaLaboralID = ExpectativaLaboralID;
    }

    public Long getExpectativaPostulanteFK() {
        return ExpectativaPostulanteFK;
    }

    public void setExpectativaPostulanteFK(Long ExpectativaPostulanteFK) {
        this.ExpectativaPostulanteFK = ExpectativaPostulanteFK;
    }

    public Long getRegionPreferente() {
        return RegionPreferente;
    }

    public void setRegionPreferente(Long RegionPreferente) {
        this.RegionPreferente = RegionPreferente;
    }

    public int getExpectativaRenta() {
        return ExpectativaRenta;
    }

    public void setExpectativaRenta(int ExpectativaRenta) {
        this.ExpectativaRenta = ExpectativaRenta;
    }

    public String getTipoMoneda() {
        return TipoMoneda;
    }

    public void setTipoMoneda(String TipoMoneda) {
        this.TipoMoneda = TipoMoneda;
    }

    public String getJornadaPreferente() {
        return JornadaPreferente;
    }

    public void setJornadaPreferente(String JornadaPreferente) {
        this.JornadaPreferente = JornadaPreferente;
    }

    public int getDisponibilidadViaje() {
        return DisponibilidadViaje;
    }

    public void setDisponibilidadViaje(int DisponibilidadViaje) {
        this.DisponibilidadViaje = DisponibilidadViaje;
    }

    public int getCambioResidencia() {
        return CambioResidencia;
    }

    public void setCambioResidencia(int CambioResidencia) {
        this.CambioResidencia = CambioResidencia;
    }


}
