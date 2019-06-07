/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;
import Config.Conexion;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
        this.jdbcTemplate.update("call creacion_UsuarioPostulante(?,?,?,?)",u.getCorreo(),u.getClave(),u.getNomUsPos(),u.getApeUsPos());
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
   public String cvPostulante(HttpServletRequest request, ModelMap model){
        mav.addObject(new UsuarioPostulante());
        mav.setViewName("cvPostulante");
        int idUsuarioPostulante= Integer.parseInt(request.getParameter("id"));
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
"	ON numerocontacto.NumeroUsuarioFK = usuariopostulante.UsuarioPostulanteID\n" +
"LEFT JOIN otrosconocimientos\n" +
"	ON otrosconocimientos.ConocimientoPostulante = usuariopostulante.UsuarioPostulanteID \n" +
"WHERE usuariopostulante.UsuarioPostulanteID= "+idUsuarioPostulante+"";
        String sql2 = "select * from Pais";
        String sql3 = "select * from Region";
        List datos = this.jdbcTemplate.queryForList(sql);
        List pais = this.jdbcTemplate.queryForList(sql2);
        List region = this.jdbcTemplate.queryForList(sql3);
        model.addAttribute("pais",pais);
        model.addAttribute("region",region);
        model.addAttribute("lista", datos);
          return "/cvPostulante";   
      }
   
    @RequestMapping(value="cvPostulante.htm",method=RequestMethod.POST)
    public String editarPrimerCuadro(Usuario u, UsuarioPostulante up,NumeroContacto nc
    ,Licencia l){
         String sql ="";
        return "/cvPostulante";
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




    

