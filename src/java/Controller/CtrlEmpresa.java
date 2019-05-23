
package Controller;

import entidades.NumeroContacto;
import Config.Conexion;
import entidades.Usuario;
import entidades.UsuarioEmpresa;
import java.sql.ResultSet;
import java.util.List;
import static javafx.scene.input.KeyCode.T;
import javax.servlet.http.HttpServletRequest;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
/**
 *
 * @author Saitam
 */
public class CtrlEmpresa {
    
      Conexion con = new Conexion();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Conectar());
    ModelAndView mav = new ModelAndView();
    
      @RequestMapping(value="registroEmpresa.htm",method=RequestMethod.GET)
   public ModelAndView AgregarEmpresa(){
        mav.addObject(new Usuario());
        mav.setViewName("registroEmpresa");    
          return mav;   
      }
        @RequestMapping(value = "registroEmpresa.htm",method = RequestMethod.POST)
     
        public ModelAndView Agregar(Usuario u, UsuarioEmpresa ue, NumeroContacto nc){
  
        this.jdbcTemplate.update("call creacion_UsuarioEmpresa(?,?,?,?,?,?,?,?)",u.getCorreo(),
                u.getClave(),u.getNomUsPos(),u.getApeUsPos(),ue.getRazonSocial()
        ,ue.getRutEmpresa(),ue.getNombreEmpresa(),nc.getNumeroTelefonico());
        
         return new ModelAndView("redirect:/index.htm");

      }
   
   @RequestMapping(value="loginEmpresa.htm",method=RequestMethod.GET)
   public ModelAndView login(){
        mav.addObject(new Usuario());
        mav.setViewName("loginEmpresa");         
          return mav;   
      }
}
