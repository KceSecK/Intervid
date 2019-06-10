
package entidades;

public class Comuna {
  private int ComunaID;  
  private int ComunaRegionFK;
  private String ComunaNombre;  

    public int getComunaID() {
        return ComunaID;
    }

    public void setComunaID(int ComunaID) {
        this.ComunaID = ComunaID;
    }

    public int getComunaRegionFK() {
        return ComunaRegionFK;
    }

    public void setComunaRegionFK(int ComunaRegionFK) {
        this.ComunaRegionFK = ComunaRegionFK;
    }

    public String getComunaNombre() {
        return ComunaNombre;
    }

    public void setComunaNombre(String ComunaNombre) {
        this.ComunaNombre = ComunaNombre;
    }
  
  
}
