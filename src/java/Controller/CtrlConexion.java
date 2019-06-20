package Controller;

import Config.Conexion;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author sdasd
 */
@Controller
@SessionAttributes("tipoCuenta")

public class CtrlConexion {

    Conexion con = new Conexion();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Conectar());
    ModelAndView mav = new ModelAndView();

    @RequestMapping("index.htm")
    public ModelAndView Listar() {
        mav.setViewName("index");
        return mav;
    }

    @RequestMapping("trabajos.htm")
    public ModelAndView Trabajos() {
        mav.setViewName("trabajos");
        return mav;
    }

    @RequestMapping(value = "trabajos.htm", method = RequestMethod.GET)
    public ModelAndView OfertaLaboral(HttpServletRequest request) {
        HttpSession session = request.getSession();
        SecurityContext ctx = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
        Authentication auth = ctx.getAuthentication();
        System.out.println("Nombre de usuario: " + auth.getName());

        String sql = "SELECT * FROM OfertaLaboral WHERE TipoCargo LIKE '% ? %'";
        String validar = (String) jdbcTemplate.queryForObject(sql, new Object[]{}, String.class);

        List prc = this.jdbcTemplate.queryForList(sql);

        mav.addObject("prc", prc);
        mav.setViewName("postulante/cvPostulante");
        return mav;
    }

}
