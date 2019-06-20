package entidades;





public class NumeroContacto {
    
 
 private int numeroContactoID;
 private int numeroUsuarioFK;
 private String contactoTipo;
 private String NumeroTelefonico;

    public int getNumeroContactoID() {
        return numeroContactoID;
    }

    public void setNumeroContactoID(int numeroContactoID) {
        this.numeroContactoID = numeroContactoID;
    }

    public int getNumeroUsuarioFK() {
        return numeroUsuarioFK;
    }

    public void setNumeroUsuarioFK(int numeroUsuarioFK) {
        this.numeroUsuarioFK = numeroUsuarioFK;
    }

    public String getContactoTipo() {
        return contactoTipo;
    }

    public void setContactoTipo(String contactoTipo) {
        this.contactoTipo = contactoTipo;
    }

    public String getNumeroTelefonico() {
        return NumeroTelefonico;
    }

    public void setNumeroTelefonico(String NumeroTelefonico) {
        this.NumeroTelefonico = NumeroTelefonico;
    }
 
 
}
