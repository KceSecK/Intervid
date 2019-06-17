/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import Config.Conexion;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import entidades.*;
import java.sql.ResultSet;
import java.sql.SQLException;
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
import org.springframework.jdbc.core.RowMapper;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.fasterxml.jackson.core.*;
import com.fasterxml.jackson.databind.*;
import java.util.Arrays;
import javax.swing.JOptionPane;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 *
 * @author Saitam
 */
@Controller
@SessionAttributes({"Session"})
public class CtrlPostulante {

          Conexion con = new Conexion();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Conectar());
ModelAndView mav = new ModelAndView();
   

    @RequestMapping(value = "registro.htm", method = RequestMethod.GET)
    public ModelAndView Agregar() {
        mav.addObject(new Usuario());
        mav.addObject(new UsuarioPostulante());
        mav.setViewName("registro");
        return mav;
    }
    
  

 @RequestMapping(value = "loginPostulante.htm", method = RequestMethod.GET)

    public ModelAndView loginUsuarioPostulante(@RequestParam(value="error", required = false)String error,
            HttpServletRequest request, Usuario u) throws Exception {
       
  
	  ModelAndView model = new ModelAndView();
        

        if (error != null) {

        model.addObject("error",true);

        } 
          model.setViewName("loginPostulante");

	  return model;
    }

    @RequestMapping(value = "registro.htm", method = RequestMethod.POST)
    public ModelAndView Agregar(Usuario u) {
         ModelAndView model = new ModelAndView();
       
            String password = u.getClave();
            PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            String hashedPassword = passwordEncoder.encode(password);
            System.out.println(hashedPassword);
            u.setClave(hashedPassword);
            System.out.println(u.getCorreo()+u.getClave()+u.getNombre()+u.getApellido());
            this.jdbcTemplate.update("call creacion_UsuarioPostulante(?,?,?,?)", u.getCorreo(), u.getClave(), u.getNombre(), u.getApellido());
            
                      model.setViewName("index");
                      return model;

    }
       
     
     @RequestMapping(value = "indexp.htm", method = RequestMethod.GET)
    public ModelAndView indexPostulante() {
        mav.setViewName("indexp");
        return mav;
    }


    @RequestMapping(value = "cvPostulante.htm", method = RequestMethod.GET)

    public ModelAndView cvPostulante(HttpServletRequest request) {
        mav.addObject(new UsuarioPostulante());
        mav.addObject(new Usuario());
        mav.addObject(new Licencia());
        int idUsuario = Integer.parseInt(request.getParameter("ID"));
        int idUsuarioPostulante = Integer.parseInt(request.getParameter("IdPostulante"));
        System.out.println(idUsuario + " " + idUsuarioPostulante);

        String sql = "SELECT * FROM usuario \n"
                + "LEFT JOIN usuariopostulante \n"
                + "	ON usuariopostulante.PostulanteUsuarioFK = usuario.UsuarioID \n"
                + "LEFT JOIN contactopostulante \n"
                + "	ON contactopostulante.ContactoPostulanteFK = usuariopostulante.UsuarioPostulanteID\n"
                + "LEFT JOIN idiomapostulante\n"
                + "	ON idiomapostulante.PostulanteIdiomaFK = usuariopostulante.UsuarioPostulanteID\n"
                + "LEFT JOIN licencia\n"
                + "	ON licencia.LicenciaPostulanteFK = usuariopostulante.UsuarioPostulanteID\n"
                + "LEFT JOIN educacionpostulante\n"
                + "	ON educacionpostulante.EducacionPostulanteFK = usuariopostulante.UsuarioPostulanteID\n"
                + "LEFT JOIN expectativalaboral\n"
                + "	ON expectativalaboral.ExpectativaPostulanteFK = usuariopostulante.UsuarioPostulanteID\n"
                + "LEFT JOIN experienciaprofesional\n"
                + "	ON experienciaprofesional.ExperienciaPostulanteFK = usuariopostulante.UsuarioPostulanteID\n"
                + "LEFT JOIN numerocontacto\n"
                + "	ON numerocontacto.NumeroUsuarioFK = usuario.UsuarioID\n"
                + "LEFT JOIN otrosconocimientos\n"
                + "	ON otrosconocimientos.ConocimientoPostulante = usuariopostulante.UsuarioPostulanteID"
                + " LEFT JOIN comuna\n"
                + "ON comuna.ComunaID=contactopostulante.ComunaResidencia\n"
                + "LEFT JOIN region\n"
                + "ON region.RegionID=comuna.ComunaRegionFK\n"
                + "LEFT JOIN pais\n"
                + "ON pais.PaisID=region.RegionPaisFK \n"
                + "WHERE usuario.UsuarioID= " + idUsuario + "";
        String sql2 = "select * from Pais";
        String sql3 = "select * from Region";
        String sql4 = "select * from Comuna";
        String sql5 = "SELECT * FROM `educacionpostulante` WHERE EducacionPostulanteFK =" + idUsuarioPostulante;
        List datos = this.jdbcTemplate.queryForList(sql);
        List pais = this.jdbcTemplate.queryForList(sql2);
        List region = this.jdbcTemplate.queryForList(sql3);
        List comuna = this.jdbcTemplate.queryForList(sql4);
        List educacion = this.jdbcTemplate.queryForList(sql5);
//        model.addAttribute("pais",pais);
//        model.addAttribute("region",region);
//        model.addAttribute("comuna",comuna);
//        model.addAttribute("lista", datos);
        mav.addObject("lista", datos);
        mav.addObject("pais", pais);
        mav.addObject("region", region);
        mav.addObject("comuna", comuna);
        mav.addObject("edu", educacion);
        mav.setViewName("cvPostulante");
      
        return mav;
    }

    @RequestMapping(value = "cvPostulante.htm", method = RequestMethod.POST)
    public ModelAndView cvPostulante(HttpServletRequest request, Usuario u, UsuarioPostulante up, Licencia l,
            ContactoPostulante cp, NumeroContacto nc, EducacionPostulante ep) {
        int form = Integer.parseInt(request.getParameter("Cuadro"));

        System.out.println("WASFASG: " + form);
        if (form == 1) {
            this.jdbcTemplate.update("call editar_UsuarioPostulante(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
                     u.getUsuarioID(),
                     u.getNombre(),
                     u.getApellido(),
                     up.getId_usuarioPostulante(),
                     up.getGenero(),
                     up.getNacionalidad(),
                     up.getNumDocumento(),
                     up.getDocumento(),
                     up.getFechaNacimiento(),
                     up.getEstadoCivil(),
                     up.getVehiculoUsuario(),
                     up.getDiscapacidadUsuario(),
                     l.getLicenciaTipoA1(),
                     l.getLicenciaTipoA2(),
                     l.getLicenciaTipoA3(),
                     l.getLicenciaTipoA4(),
                     l.getLicenciaTipoA5(),
                     l.getLicenciaTipoB(),
                     l.getLicenciaTipoC(),
                     l.getLicenciaTipoD(),
                     l.getLicenciaTipoE(),
                     l.getLicenciaTipoF(),
                     l.getNoLicencia()
            );

            return new ModelAndView("redirect:/cvPostulante.htm?ID=" +u.getUsuarioID() +"&IdPostulante="+up.getId_usuarioPostulante());
        } else if (form == 2) {

//               this.jdbcTemplate.update("call ingresar_DatosContactoPostulante(?,?,?,?,?,?,?)",
//            up.getId_usuarioPostulante()
//            ,cp.getComunaResidencia()
//            ,cp.getDireccionResidencia()
//            ,cp.getCorreoContacto()
//            ,u.getUsuarioID()
//            ,nc.getContactoTipo()
//            ,nc.getNumeroTelefonico());

            this.jdbcTemplate.update("call edit_datosContactoPostulante(?,?,?,?,?,?,?)",
                     up.getId_usuarioPostulante(),
                     cp.getComunaResidencia(),
                     cp.getDireccionResidencia(),
                     cp.getCorreoContacto(),
                     u.getUsuarioID(),
                     nc.getContactoTipo(),
                     nc.getNumeroTelefonico()
            );

            return new ModelAndView("redirect:/cvPostulante.htm?idUS=" + up.getId_usuarioPostulante());
        } else if (form == 3) {

            this.jdbcTemplate.update("CALL creacion_educacionPostulante(?,?,?,?,?,?,?)",
                    up.getId_usuarioPostulante(),
                     ep.getInstitucion(),
                     ep.getNivelEstudio(),
                     ep.getEstadoEstudio(),
                     ep.getPeriodoInicio(),
                     ep.getPeriodoFin(),
                     ep.getPeriodoActual()
            );

            return new ModelAndView("redirect:/cvPostulante.htm?idUS=" + up.getId_usuarioPostulante());

        } else {
            return new ModelAndView("redirect:/cvPostulante.htm?idUS=" + up.getId_usuarioPostulante());
        }

    }

//    Rellenar modal para editar educacionPostulante
    @RequestMapping(value = "editEstudioPostulante.htm", method = RequestMethod.POST)
    public @ResponseBody
    String ObtenerEducacionPostulante(HttpServletRequest request) throws JsonProcessingException {
        String sql = "SELECT * FROM `educacionpostulante` WHERE "
                + "EducacionPostulanteID= " + request.getParameter("id2");
        List estudio = jdbcTemplate.queryForList(sql);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(estudio);
        System.out.println(json);
        return json;
    }

    @RequestMapping(value = "ofertasLaboralesPostulante.htm", method = RequestMethod.GET)
    public ModelAndView vistaOfertasLaborales() {
        mav.addObject(new UsuarioPostulante());
        mav.setViewName("ofertasLaboralesPostulante");
        return mav;
    }





}
