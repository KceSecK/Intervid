/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;
import Config.Conexion;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import entidades.Comuna;
import entidades.ContactoPostulante;
import entidades.Licencia;
import entidades.NumeroContacto;
import entidades.Usuario;
import entidades.UsuarioPostulante;
import java.sql.ResultSet;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;
import java.util.Map;
import static javafx.scene.input.KeyCode.T;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCallback;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Controller;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.request;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Saitam
 */
@Controller
@SessionAttributes({"tipoCuenta","CorreoUsuario","NombreUsuario","CuentaActiva","ID"})

public class CtrlPostulante {
    
        Conexion con = new Conexion();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Conectar());
    ModelAndView mav = new ModelAndView();
    
      @RequestMapping(value = "registro.htm",method = RequestMethod.GET)
      public ModelAndView Agregar(){
        mav.addObject(new Usuario());
        mav.addObject(new UsuarioPostulante());
        mav.setViewName("registro");         
          return mav;   
      }
         @RequestMapping(value = "registro.htm",method = RequestMethod.POST)
      public String Agregar(Usuario u){
       try{
        this.jdbcTemplate.update("call creacion_UsuarioPostulante(?,?,?,?)",u.getCorreo(),u.getClave(),u.getNombre(),u.getApellido());
         return "/index";
       }
       catch(DataIntegrityViolationException e){
                   return "/index.htm?idErr=1";

       }          
      }
      
       @RequestMapping(value="loginPostulante.htm",method=RequestMethod.GET)
   public ModelAndView loginPostulante(){
        mav.addObject(new Usuario());
        mav.setViewName("loginPostulante");         
          return mav;   
      }
   
   
   
      @RequestMapping(value="cvPostulante.htm",method=RequestMethod.GET)
   public ModelAndView cvPostulante(HttpServletRequest request){
        mav.addObject(new UsuarioPostulante());
        mav.addObject(new Usuario());
        mav.addObject(new Licencia());
       
        int idUsuarioPostulante= Integer.parseInt(request.getParameter("idUS"));
         
        String sql="SELECT * FROM usuario \n" +
"LEFT JOIN usuariopostulante \n" +
"	ON usuariopostulante.PostulanteUsuarioFK = usuario.UsuarioID \n" +
"LEFT JOIN contactopostulante \n" +
"	ON contactopostulante.ContactoPostulanteFK = usuariopostulante.UsuarioPostulanteID\n" +
"LEFT JOIN idiomapostulante\n" +
"	ON idiomapostulante.PostulanteIdiomaFK = usuariopostulante.UsuarioPostulanteID\n" +
"LEFT JOIN licencia\n" +
"	ON licencia.LicenciaPostulanteFK = usuariopostulante.UsuarioPostulanteID\n" +
"LEFT JOIN educacionpostulante\n" +
"	ON educacionpostulante.EducacionPostulanteFK = usuariopostulante.UsuarioPostulanteID\n" +
"LEFT JOIN expectativalaboral\n" +
"	ON expectativalaboral.ExpectativaPostulanteFK = usuariopostulante.UsuarioPostulanteID\n" +
"LEFT JOIN experienciaprofesional\n" +
"	ON experienciaprofesional.ExperienciaPostulanteFK = usuariopostulante.UsuarioPostulanteID\n" +
"LEFT JOIN numerocontacto\n" +
"	ON numerocontacto.NumeroUsuarioFK = usuario.UsuarioID\n" +
"LEFT JOIN otrosconocimientos\n" +
"	ON otrosconocimientos.ConocimientoPostulante = usuariopostulante.UsuarioPostulanteID"
                + " LEFT JOIN comuna\n" +
"ON comuna.ComunaID=contactopostulante.ComunaResidencia\n" +
"LEFT JOIN region\n" +
"ON region.RegionID=comuna.ComunaRegionFK\n" +
"LEFT JOIN pais\n" +
"ON pais.PaisID=region.RegionPaisFK \n" +
"WHERE usuariopostulante.UsuarioPostulanteID= "+idUsuarioPostulante+"";
        String sql2 = "select * from Pais";
        String sql3 = "select * from Region";
        String sql4 = "select * from Comuna";
        String sql5 = "SELECT * FROM `educacionpostulante` WHERE EducacionPostulanteFK ="+idUsuarioPostulante;
        List datos = this.jdbcTemplate.queryForList(sql);
        List pais = this.jdbcTemplate.queryForList(sql2);
        List region = this.jdbcTemplate.queryForList(sql3);
        List comuna = this.jdbcTemplate.queryForList(sql4);
        List educacion = this.jdbcTemplate.queryForList(sql5);
//        model.addAttribute("pais",pais);
//        model.addAttribute("region",region);
//        model.addAttribute("comuna",comuna);
//        model.addAttribute("lista", datos);
        mav.addObject("lista",datos);
        mav.addObject("pais",pais);
        mav.addObject("region",region);
        mav.addObject("comuna",comuna); 
        mav.addObject("edu",educacion); 
         mav.setViewName("cvPostulante");
          return mav;   
      }
   
    @RequestMapping(value= "cvPostulante.htm" , method=RequestMethod.POST)
    public ModelAndView cvPostulante( HttpServletRequest request, Usuario u, UsuarioPostulante up,Licencia l,
            ContactoPostulante cp, NumeroContacto nc){ 
        int form= Integer.parseInt(request.getParameter("Cuadro"));
        System.out.println("WAAAAAAAAAAAAAAAAAAA: "+form);
        if (form==1) {
               this.jdbcTemplate.update("call editar_UsuarioPostulante(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
          ,u.getUsuarioID()
          ,u.getNombre()
          ,u.getApellido()
          ,up.getId_usuarioPostulante()
          ,up.getGenero()
          ,up.getNacionalidad()
          ,up.getNumDocumento()
          ,up.getDocumento()
          ,up.getFechaNacimiento()
          ,up.getEstadoCivil()
          ,up.getVehiculoUsuario()
          ,up.getDiscapacidadUsuario()
          ,l.getLicenciaTipoA1()
          ,l.getLicenciaTipoA2()
          ,l.getLicenciaTipoA3()
          ,l.getLicenciaTipoA4()
          ,l.getLicenciaTipoA5()
          ,l.getLicenciaTipoB()
          ,l.getLicenciaTipoC()
          ,l.getLicenciaTipoD()
          ,l.getLicenciaTipoE()
          ,l.getLicenciaTipoF()
          ,l.getNoLicencia()
          );
                      
        return new ModelAndView ("redirect:/cvPostulante.htm?idUS="+up.getId_usuarioPostulante()); 
        }
        else if (form==2){
            
//               this.jdbcTemplate.update("call ingresar_DatosContactoPostulante(?,?,?,?,?,?,?)",
//            up.getId_usuarioPostulante()
//            ,cp.getComunaResidencia()
//            ,cp.getDireccionResidencia()
//            ,cp.getCorreoContacto()
//            ,u.getUsuarioID()
//            ,nc.getContactoTipo()
//            ,nc.getNumeroTelefonico());
               
              this.jdbcTemplate.update("call edit_datosContactoPostulante(?,?,?,?,?,?,?)"
            ,up.getId_usuarioPostulante()
            ,cp.getComunaResidencia()
            ,cp.getDireccionResidencia()
            ,cp.getCorreoContacto()
            ,u.getUsuarioID()
            ,nc.getContactoTipo()
            ,nc.getNumeroTelefonico()
            
          );
                      
        return new ModelAndView ("redirect:/cvPostulante.htm?idUS="+up.getId_usuarioPostulante()+"&WA="+u.getUsuarioID()); 
        }
        else if (form==3) {
            
            
            return new ModelAndView ("redirect:/cvPostulante.htm?idUS="+up.getId_usuarioPostulante()+"&WA="+u.getUsuarioID()); 

        }
        else
             return new ModelAndView ("redirect:/cvPostulante.htm?idUS="+up.getId_usuarioPostulante()+"&WEEEE="+u.getUsuarioID());
    
}

      @RequestMapping(value="ofertasLaboralesPostulante.htm",method=RequestMethod.GET)
   public ModelAndView vistaOfertasLaborales(){
        mav.addObject(new UsuarioPostulante());
        mav.setViewName("ofertasLaboralesPostulante");         
          return mav;   
      }
   
 
@RequestMapping(value="loginPostulante.htm",method=RequestMethod.POST)    
public String loginUsuarioPostulante(HttpServletRequest request, ModelMap model) {        
            String cor=request.getParameter("correo");
            String cla=request.getParameter("clave");
  String sql = "select usuarioID,CorreoUsuario,TipoCuenta,"
          + "nombreUsuario,ApellidoUsuario from usuario where correoUsuario='"+cor+"' and Contraseña=AES_ENCRYPT('"+cla+"','userpass')";
  List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql);
	
  if(rows.size() > 0){
      
	for (Map row : rows) {
                model.put("tipoCuenta", (String) row.get("TipoCuenta").toString());
                model.put("CorreoUsuario", (String) row.get("CorreoUsuario").toString());
                model.put("NombreUsuario", (String) row.get("NombreUsuario").toString());
                model.put("CuentaActiva", (Integer) row.get("CuentaActiva"));
                model.put("ID", (Integer) row.get("usuarioID"));
	}
        
   
      return "/index";

  }
  
else
  {
       return "/loginPostulante";
  }
}
}




    

