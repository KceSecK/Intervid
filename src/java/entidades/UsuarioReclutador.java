
package entidades;

/**
 *
 * @author SaitaM
 */
public class UsuarioReclutador{
  private int reclutadorid;
  private int rempresa;
  private int rcuenta;
  private String rcargo;
  private String rgenero;

    public int getReclutadorid() {
        return reclutadorid;
    }

    public void setReclutadorid(int reclutadorid) {
        this.reclutadorid = reclutadorid;
    }

    public int getRempresa() {
        return rempresa;
    }

    public void setRempresa(int rempresa) {
        this.rempresa = rempresa;
    }

    public int getRcuenta() {
        return rcuenta;
    }

    public void setRcuenta(int rcuenta) {
        this.rcuenta = rcuenta;
    }

    public String getRcargo() {
        return rcargo;
    }

    public void setRcargo(String rcargo) {
        this.rcargo = rcargo;
    }

    public String getRgenero() {
        return rgenero;
    }

    public void setRgenero(String rgenero) {
        this.rgenero = rgenero;
    }
}
