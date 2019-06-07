package Controller;

import Config.Conexion;
import entidades.Usuario;
import entidades.UsuarioPostulante;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author sdasd
 */
@Controller
public class CtrlConexion {

    Conexion con = new Conexion();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Conectar());
    ModelAndView mav = new ModelAndView();

    @RequestMapping("index.htm")
    public ModelAndView Listar() {
        String sql = "select * from usuario";
        List datos = this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista", datos);
        mav.setViewName("index");
        return mav;
    }

    @RequestMapping(value = "registro.htm", method = RequestMethod.GET)
    public ModelAndView Agregar() {
        mav.addObject(new Usuario());
        mav.addObject(new UsuarioPostulante());
        mav.setViewName("registro");
        return mav;
    }

    @RequestMapping(value = "registro.htm", method = RequestMethod.POST)
    public ModelAndView Agregar(Usuario u, UsuarioPostulante uP) {
        String sql = "insert into usuario (correoUsuario,Contraseña,TipoCuenta,NombreUsuario,ApellidoUsuario)values(?,?,?,?,?)";
        u.setTipoCuenta("Postulante");
        this.jdbcTemplate.update(sql, u.getCorreo(), u.getClave(), u.getTipoCuenta(), u.getNomUsPos(), u.getApeUsPos());
        return new ModelAndView("redirect:/index.htm");
    }

    @RequestMapping(value = "registroEmpresa.htm", method = RequestMethod.GET)
    public ModelAndView AgregarEmpresa() {
        mav.addObject(new Usuario());
        mav.addObject(new UsuarioPostulante());
        mav.setViewName("registroEmpresa");
        return mav;
    }

    @RequestMapping(value = "loginEmpresa.htm", method = RequestMethod.GET)
    public ModelAndView login() {
        mav.addObject(new Usuario());
        mav.setViewName("loginEmpresa");
        return mav;
    }

    @RequestMapping(value = "loginPostulante.htm", method = RequestMethod.GET)
    public ModelAndView loginPostulante() {
        mav.addObject(new Usuario());
        mav.setViewName("loginPostulante");
        return mav;
    }

    @RequestMapping(value = "loginPostulante.htm", method = RequestMethod.POST)
    public ModelAndView VerificarUsuario(Usuario u) {

        String sql = "SELECT count(*) FROM Usuario WHERE CorreoUsuario=? AND Contraseña=aes_decrypt('?','llave')";
//        Object asdf = false;
//        int cont = this.jdbcTemplate.queryForObject(
//                sql, new Object[]{asdf}, Integer.class);
//                
        return new ModelAndView("redirect:/index.htm");
    }

    @RequestMapping(value = "cvPostulante.htm", method = RequestMethod.GET)
    public ModelAndView cvPostulante() {
        mav.addObject(new UsuarioPostulante());
        mav.setViewName("cvPostulante");
        return mav;
    }

    @RequestMapping(value = "ofertasLaboralesPostulante.htm", method = RequestMethod.GET)
    public ModelAndView vistaOfertasLaborales() {
        mav.addObject(new UsuarioPostulante());
        mav.setViewName("ofertasLaboralesPostulante");
        return mav;
    }
}
