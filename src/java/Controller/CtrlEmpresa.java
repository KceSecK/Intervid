
package Controller;

import entidades.NumeroContacto;
import Config.Conexion;
import entidades.OfertaLaboral;
import entidades.Usuario;
import entidades.UsuarioEmpresa;
import entidades.UsuarioReclutador;
import java.sql.ResultSet;
import java.sql.SQLException;
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
     
        public String Agregar(Usuario u, UsuarioEmpresa ue, NumeroContacto nc){
  
        this.jdbcTemplate.update("call creacion_UsuarioEmpresa(?,?,?,?,?,?,?,?)",u.getCorreo(),
                u.getClave(),u.getNombre(),u.getApellido(),ue.getRazonSocial()
        ,ue.getRutEmpresa(),ue.getNombreEmpresa(),nc.getNumeroTelefonico());
        
         return "/index";

      }
        
   
   @RequestMapping(value="loginEmpresa.htm",method=RequestMethod.GET)
   public ModelAndView login(){
        mav.addObject(new Usuario());
        mav.setViewName("loginEmpresa");         
          return mav;   
      }
   
           @RequestMapping(value = "crearOfertaLaboral.htm",method = RequestMethod.POST)
     
        public ModelAndView AgregarOferta(Usuario u, UsuarioEmpresa ue, NumeroContacto nc,OfertaLaboral of){
               try {
                   this.jdbcTemplate.update("insert into OfertaLaboral (NombreOferta,"
                + "CreadorOferta,EmpresaOferta,LugarTrabajo,TipoEntrevista,"
                + "PlanOferta,DescripcionCargo,FechaPublicacionOferta,"
                + "FechaFinalizacionOferta,RequisitosOferta,BeneficiosOferta,"
                + "HorarioEntrevista,TipoCargo,TipoContrato,JornadaTrabajo,SueldoOfrecido) "
                + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
                ,of.getNombreOferta(),u.getUsuarioID(),ue.getUsuarioEmpresaID(),of.getLugarTrabajo(),
                of.getTipoEntrevista(),of.getPlanOferta(),of.getDescripcionCargo(),
                of.getFechaPublicacionOferta(),of.getFechaFinalizacionOferta(),
                of.getRequisitosOferta(),of.getBeneficiosOferta(),of.getHorarioEntrevista(),
                of.getTipoCargo(),of.getTipoContrato(),of.getJornadaTrabajo(),
                of.getSueldoOfrecido());
        
         return new ModelAndView("redirect:/ofertasLaboralesEmpresa.htm");

               } catch (DataIntegrityViolationException e) {
                   return new ModelAndView("redirect:/crearOfertaLaboral.htm?err=1");
               }
        
      }
        
          @RequestMapping(value = "registroReclutador.htm",method = RequestMethod.POST)
     
        public String AgregarReclutador(Usuario u, UsuarioEmpresa ue,UsuarioReclutador ur){
  
        this.jdbcTemplate.update("call creacion_UsuarioReclutador(?,?,?,?,?,?,?)",u.getCorreo(),
                u.getClave(),u.getNombre(),u.getApellido(),ue.getUsuarioEmpresaID()
        ,ur.getReclutadorCargo(),ur.getReclutadorGenero());
        
         return "/index?idExt=1";

      }
}
