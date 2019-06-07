
package entidades;

/**
 *
 * @author SaitaM
 */
public class Licencia {

private int LicenciaID;
private int LicenciaPostulanteFK;
private String LicenciaTipo;

    public int getLicenciaID() {
        return LicenciaID;
    }

    public void setLicenciaID(int LicenciaID) {
        this.LicenciaID = LicenciaID;
    }

    public int getLicenciaPostulanteFK() {
        return LicenciaPostulanteFK;
    }

    public void setLicenciaPostulanteFK(int LicenciaPostulanteFK) {
        this.LicenciaPostulanteFK = LicenciaPostulanteFK;
    }

    public String getLicenciaTipo() {
        return LicenciaTipo;
    }

    public void setLicenciaTipo(String LicenciaTipo) {
        this.LicenciaTipo = LicenciaTipo;
    }


    
}
