
package entidades;

/**
 *
 * @author SaitaM
 */
public class UsuarioReclutador{
  private int UsuarioReclutadorID;
  private int EmpresaAsociadaFK;
  private int CuentaReclutador;
  private String ReclutadorCargo;
  private String ReclutadorGenero;

    public int getUsuarioReclutadorID() {
        return UsuarioReclutadorID;
    }

    public void setUsuarioReclutadorID(int UsuarioReclutadorID) {
        this.UsuarioReclutadorID = UsuarioReclutadorID;
    }

    public int getEmpresaAsociadaFK() {
        return EmpresaAsociadaFK;
    }

    public void setEmpresaAsociadaFK(int EmpresaAsociadaFK) {
        this.EmpresaAsociadaFK = EmpresaAsociadaFK;
    }

    public int getCuentaReclutador() {
        return CuentaReclutador;
    }

    public void setCuentaReclutador(int CuentaReclutador) {
        this.CuentaReclutador = CuentaReclutador;
    }

    public String getReclutadorCargo() {
        return ReclutadorCargo;
    }

    public void setReclutadorCargo(String ReclutadorCargo) {
        this.ReclutadorCargo = ReclutadorCargo;
    }

    public String getReclutadorGenero() {
        return ReclutadorGenero;
    }

    public void setReclutadorGenero(String ReclutadorGenero) {
        this.ReclutadorGenero = ReclutadorGenero;
    }
  
  
    
}
