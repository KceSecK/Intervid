package Controller;

import Config.Conexion;
import entidades.Usuario;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
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
    public ModelAndView Listar(){
        String sql = "select * from usuario";
        List datos =this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista",datos);
        mav.setViewName("index");
        return mav;
    }
      @RequestMapping(value = "registro.htm",method = RequestMethod.GET)
      public ModelAndView Agregar(){
        mav.addObject(new Usuario());
        mav.setViewName("registro");         
          return mav;   
      }
         @RequestMapping(value = "registro.htm",method = RequestMethod.POST)
      public ModelAndView Agregar(Usuario u){
        String sql ="insert into usuario (CorreoUsuario,Contraseña,"
                + "TipoCuenta,CuentaActiva) values (?,?,?,?)";
        this.jdbcTemplate.update(sql,u.getCorreo(),u.getClave(),u.getTipoCuenta());
          return new ModelAndView("redirect:/index.htm");   
      }
  
}
