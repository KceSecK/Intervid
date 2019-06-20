package entidades;
public class UsuarioEmpresa {
   private int UsuarioEmpresaID;
   private int EmpresaUsuarioFK;
   private int EmpresaComuna;
   private String SectorEmpresarial;
   private String NombreEmpresa;
   private String RazonSocial;
   private String RutEmpresa;
   private String EmpresaDireccion;
   private String LogoEmpresa;
   private String PaginaEmpresa;
   private String DescripcionEmpresa;

    public int getUsuarioEmpresaID() {
        return UsuarioEmpresaID;
    }

    public void setUsuarioEmpresaID(int UsuarioEmpresaID) {
        this.UsuarioEmpresaID = UsuarioEmpresaID;
    }

    public int getEmpresaUsuarioFK() {
        return EmpresaUsuarioFK;
    }

    public void setEmpresaUsuarioFK(int EmpresaUsuarioFK) {
        this.EmpresaUsuarioFK = EmpresaUsuarioFK;
    }

    public int getEmpresaComuna() {
        return EmpresaComuna;
    }

    public void setEmpresaComuna(int EmpresaComuna) {
        this.EmpresaComuna = EmpresaComuna;
    }

    public String getSectorEmpresarial() {
        return SectorEmpresarial;
    }

    public void setSectorEmpresarial(String SectorEmpresarial) {
        this.SectorEmpresarial = SectorEmpresarial;
    }

    public String getNombreEmpresa() {
        return NombreEmpresa;
    }

    public void setNombreEmpresa(String NombreEmpresa) {
        this.NombreEmpresa = NombreEmpresa;
    }

    public String getRazonSocial() {
        return RazonSocial;
    }

    public void setRazonSocial(String RazonSocial) {
        this.RazonSocial = RazonSocial;
    }

    public String getRutEmpresa() {
        return RutEmpresa;
    }

    public void setRutEmpresa(String RutEmpresa) {
        this.RutEmpresa = RutEmpresa;
    }

    public String getEmpresaDireccion() {
        return EmpresaDireccion;
    }

    public void setEmpresaDireccion(String EmpresaDireccion) {
        this.EmpresaDireccion = EmpresaDireccion;
    }

    public String getLogoEmpresa() {
        return LogoEmpresa;
    }

    public void setLogoEmpresa(String LogoEmpresa) {
        this.LogoEmpresa = LogoEmpresa;
    }

    public String getPaginaEmpresa() {
        return PaginaEmpresa;
    }

    public void setPaginaEmpresa(String PaginaEmpresa) {
        this.PaginaEmpresa = PaginaEmpresa;
    }

    public String getDescripcionEmpresa() {
        return DescripcionEmpresa;
    }

    public void setDescripcionEmpresa(String DescripcionEmpresa) {
        this.DescripcionEmpresa = DescripcionEmpresa;
    }
}
