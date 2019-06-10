package entidades;

public class ContactoPostulante {
    
    private int ContactoPostulanteID;
    private int ContactoPostulanteFK;
    private int ComunaResidencia;
    private String DireccionResidencia;
    private String CorreoContacto;

    public int getContactoPostulanteID() {
        return ContactoPostulanteID;
    }

    public void setContactoPostulanteID(int ContactoPostulanteID) {
        this.ContactoPostulanteID = ContactoPostulanteID;
    }

    public int getContactoPostulanteFK() {
        return ContactoPostulanteFK;
    }

    public void setContactoPostulanteFK(int ContactoPostulanteFK) {
        this.ContactoPostulanteFK = ContactoPostulanteFK;
    }

    public int getComunaResidencia() {
        return ComunaResidencia;
    }

    public void setComunaResidencia(int ComunaResidencia) {
        this.ComunaResidencia = ComunaResidencia;
    }

    public String getDireccionResidencia() {
        return DireccionResidencia;
    }

    public void setDireccionResidencia(String DireccionResidencia) {
        this.DireccionResidencia = DireccionResidencia;
    }

    public String getCorreoContacto() {
        return CorreoContacto;
    }

    public void setCorreoContacto(String CorreoContacto) {
        this.CorreoContacto = CorreoContacto;
    }
    
     
}
