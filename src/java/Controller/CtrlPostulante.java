/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;
import Config.Conexion;
import entidades.Usuario;
import entidades.UsuarioPostulante;
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
@Controller
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
      public ModelAndView Agregar(Usuario u){
       try{
        this.jdbcTemplate.update("call creacion_UsuarioPostulante(?,?,?,?)",u.getCorreo(),u.getClave(),u.getNomUsPos(),u.getApeUsPos());
         return new ModelAndView("redirect:/index.htm?idExt=1");
       }
       catch(DataIntegrityViolationException e){
                   return new ModelAndView("redirect:/index.htm?idErr=1");

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
        mav.setViewName("cvPostulante");
        int idPostulante= Integer.parseInt(request.getParameter("id"));
        String sql="select * from usuariopostulante up INNER JOIN usuario u \n" +
"WHERE up.PostulanteUsuarioFK=u.UsuarioID and u.UsuarioID = "+idPostulante+"";
        List datos = this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista",datos);
          return mav;   
      }
   
      @RequestMapping(value="ofertasLaboralesPostulante.htm",method=RequestMethod.GET)
   public ModelAndView vistaOfertasLaborales(){
        mav.addObject(new UsuarioPostulante());
        mav.setViewName("ofertasLaboralesPostulante");         
          return mav;   
      }
    
}
