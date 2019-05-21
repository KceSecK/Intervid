package Controller;

import Config.Conexion;
import entidades.NumeroContacto;
import entidades.Usuario;
import entidades.UsuarioEmpresa;
import entidades.UsuarioPostulante;
import java.util.List;
import static javafx.scene.input.KeyCode.T;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
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
        mav.addObject(new UsuarioPostulante());
        mav.setViewName("registro");         
          return mav;   
      }
         @RequestMapping(value = "registro.htm",method = RequestMethod.POST)
      public ModelAndView Agregar(Usuario u,UsuarioPostulante uP){
        String sql ="insert into usuario (correoUsuario,Contraseña,nombreUsuario,apellidoUsuario,tipoCuenta)values(?,?,?,?,?)";
        this.jdbcTemplate.update(sql,u.getCorreo(),u.getClave(),u.getNomUsPos(),u.getApeUsPos(),"postulante");
       String sql2="select max(UsuarioID) from Usuario";
       int idUsuario= jdbcTemplate.queryForInt(sql2);
       String sql3="insert into usuarioPostulante (PostulanteUsuarioFK,Nacionalidad)"
               + "values (?,?)";
       
       this.jdbcTemplate.update(sql3,idUsuario,"del espacio");
//        String sql2= "select maxvalue (UsuarioID) from Usuario";
//        ResultSetExtractor<T> rse;
//        this.jdbcTemplate.query(sql2, rse);

        return new ModelAndView("redirect:/index.htm");   
      }
  @RequestMapping(value="registroEmpresa.htm",method=RequestMethod.GET)
   public ModelAndView AgregarEmpresa(){
        mav.addObject(new Usuario());
        mav.addObject(new UsuarioPostulante());
        mav.setViewName("registroEmpresa");    
          return mav;   
      }
        @RequestMapping(value = "registroEmpresa.htm",method = RequestMethod.POST)
      public ModelAndView Agregar(Usuario u, UsuarioEmpresa ue, NumeroContacto nc){
        
       String sql ="insert into usuario (correoUsuario,Contraseña,nombreUsuario,apellidoUsuario,tipoCuenta)values(?,?,?,?,?)";
       this.jdbcTemplate.update(sql,u.getCorreo(),u.getClave(),u.getNomUsPos(),u.getApeUsPos(),"Empresa");
       String sql2="select max(UsuarioID) from Usuario";
       int idUsuario= jdbcTemplate.queryForInt(sql2);
       String sql3="insert into usuarioEmpresa (EmpresaUsuarioFK,NombreEmpresa,RazonSocial"
               + ",RutEmpresa,EmpresaComuna)"
               + "values (?,?,?,?,?)"; 
       this.jdbcTemplate.update(sql3,idUsuario,ue.getNombreEmpresa(),ue.getRazonSocial(),ue.getRutEmpresa(),0);
       
       String sql4="select max(UsuarioEmpresaID) from UsuarioEmpresa";
       int idUsuarioEmpresa= jdbcTemplate.queryForInt(sql4);
       String sql5= "insert into numeroContacto (NumeroUsuarioFK,NumeroTelefonico)"
               + "values (?,?)" ;
       this.jdbcTemplate.update(sql5,idUsuarioEmpresa,nc.getNumeroTelefonico());

      


        return new ModelAndView("redirect:/index.htm");   
      }
   
   @RequestMapping(value="loginEmpresa.htm",method=RequestMethod.GET)
   public ModelAndView login(){
        mav.addObject(new Usuario());
        mav.setViewName("loginEmpresa");         
          return mav;   
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
