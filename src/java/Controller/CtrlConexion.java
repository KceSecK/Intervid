package Controller;

import Config.Conexion;
import entidades.OfertaLaboral;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
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
    public ModelAndView Index() {
        mav.setViewName("index");
        return mav;
    }

    @RequestMapping(value = "index.htm", method = RequestMethod.GET)
    public ModelAndView Listar() {
        String sql = "SELECT * FROM REGION";
        List region = this.jdbcTemplate.queryForList(sql);
        mav.addObject("reg", region);
        mav.setViewName("index");
        return mav;
    }

    @RequestMapping(value = "index.htm", method = RequestMethod.POST)
    public ModelAndView Buscar(HttpServletRequest request) {
        String busqueda = request.getParameter("buscar");
        String idregion = request.getParameter("region");

        if (!"".equals(busqueda) && idregion != null) {
            mav.setViewName("redirect:/trabajos.htm?buscar=" + busqueda + "&reg=" + idregion);
            return mav;
        }

        mav.setViewName("redirect:/index.htm");
        return mav;
    }

    @RequestMapping("redirect.htm")
    public ModelAndView Redirect() {
        mav.setViewName("redirect");
        return mav;
    }

    @RequestMapping("trabajos.htm")
    public ModelAndView Trabajos() {
        mav.setViewName("trabajos");
        return mav;
    }

    @RequestMapping("accesodenegado.htm")
    public ModelAndView Acceso() {
        mav.setViewName("accesodenegado");
        return mav;
    }

    @RequestMapping(value = "trabajos.htm", method = RequestMethod.GET)
    public ModelAndView listarOfertas(HttpServletRequest request) {
        String busqueda = request.getParameter("buscar");
        String idregion = request.getParameter("reg");

        System.out.println("busqueda: " + busqueda);
        System.out.println("idreg: " + idregion);

        if (!"".equals(busqueda) && idregion != null) {
            String sql = "SELECT ol.*, NombreEmpresa, regionNombre,regionID, ComunaNombre, LogoEmpresa "
                    + "FROM ofertalaboral ol "
                    + "LEFT JOIN usuarioempresa e ON ol.EmpresaOferta = e.UsuarioEmpresaID "
                    + "LEFT JOIN comuna c ON c.ComunaID = ol.LugarTrabajo "
                    + "LEFT JOIN region r ON r.RegionID=c.ComunaRegionFK "
                    + "WHERE regionID = ? "
                    + "AND (ol.TipoCargo LIKE ? OR ol.NombreOferta LIKE ? OR NombreEmpresa LIKE ?)";
            String bres = "%"+busqueda+"%";
            
            List ofertas = jdbcTemplate.queryForList(sql, new Object[]{idregion, bres, bres, bres});
            System.out.println("lll: "+ofertas);
            mav.addObject("ofertas", ofertas);
            mav.setViewName("trabajos");
            return mav;
        }

        mav.setViewName("trabajos");
        return mav;
    }

}
