package Controller;

import Config.Conexion;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
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
        String sql = "SELECT * FROM v_regionofertas WHERE RegionPaisFK =38";
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

    @RequestMapping("login.htm")
    public ModelAndView Login() {
        mav.setViewName("login");
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

    @RequestMapping("videollamada.htm")
    public ModelAndView VideoLlamada() {
        mav.setViewName("videollamada");
        return mav;
    }

    @RequestMapping(value = "videollamada.htm", method = RequestMethod.GET)
    public ModelAndView VideoLlamada(HttpServletRequest request) {
        try {
            String oferta = request.getParameter("oferta");
            String sql = "SELECT OfertaLaboralID,NombreOferta,FechaPublicacionOferta,FechaFinalizacionOferta, NombreEmpresa, regionNombre,regionID, ComunaNombre, LogoEmpresa "
                    + "FROM ofertalaboral ol "
                    + "LEFT JOIN usuarioempresa e ON ol.EmpresaOferta = e.UsuarioEmpresaID "
                    + "LEFT JOIN comuna c ON c.ComunaID = ol.LugarTrabajo "
                    + "LEFT JOIN region r ON r.RegionID=c.ComunaRegionFK "
                    + "WHERE OfertaLaboralID = ? ";
            List detalleoferta = jdbcTemplate.queryForList(sql, new Object[]{oferta});
            mav.addObject("oferta", detalleoferta);
            mav.setViewName("videollamada");
            return mav;
        } catch (DataAccessException e) {
            mav.setViewName("redirect:/videollamada.htm?error=999");
            return mav;
        }
    }

    @RequestMapping(value = "ofertalaboral.htm", method = RequestMethod.GET)
    public ModelAndView ofertaLaboral(HttpServletRequest request) {
        try {
            String oferta = request.getParameter("oferta");
            String sql = "SELECT OfertaLaboralID,UsuarioEmpresaID, NombreOferta, NombreEmpresa,LugarTrabajo,RegionNombre, ComunaNombre,DescripcionCargo,FechaPublicacionOferta,FechaFinalizacionOferta,RequisitosOferta, "
                    + "BeneficiosOferta,time_format(HorarioEntrevistaInicio,'%H:%i') AS inicio,time_format(HorarioEntrevistaFin,'%H:%i') AS fin,TipoCargo,TipoContrato,JornadaTrabajo,SueldoOfrecido,LogoEmpresa "
                    + "FROM ofertalaboral ol "
                    + "LEFT JOIN usuarioempresa e ON ol.EmpresaOferta = e.UsuarioEmpresaID "
                    + "LEFT JOIN comuna c ON c.ComunaID = ol.LugarTrabajo "
                    + "LEFT JOIN region r ON r.RegionID=c.ComunaRegionFK "
                    + "WHERE OfertaLaboralID = ?";
            List detalleoferta = jdbcTemplate.queryForList(sql, new Object[]{oferta});
            mav.addObject("oferta", detalleoferta);
            mav.setViewName("ofertalaboral");
            return mav;
        } catch (DataAccessException e) {
            mav.setViewName("redirect:/ofertalaboral.htm?error=999");
            return mav;
        }
    }

    @RequestMapping(value = "trabajos.htm", method = RequestMethod.GET)
    public ModelAndView listarOfertas(HttpServletRequest request) {

        String sqlr = "SELECT * FROM v_regionofertas WHERE RegionPaisFK =38";
        List region = this.jdbcTemplate.queryForList(sqlr);
        mav.addObject("reg", region);

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
            String bres = "%" + busqueda + "%";

            List ofertas = jdbcTemplate.queryForList(sql, new Object[]{idregion, bres, bres, bres});
            System.out.println("lll: " + ofertas);
            mav.addObject("ofertas", ofertas);
            mav.setViewName("trabajos");
            return mav;
        }
        mav.setViewName("trabajos");
        return mav;
    }

    @RequestMapping(value = "trabajos.htm", method = RequestMethod.POST)
    public ModelAndView listar(HttpServletRequest request) {
        int form = Integer.parseInt(request.getParameter("form"));

        if (form == 1) {
            String buscar = request.getParameter("buscar");
            String idreg = request.getParameter("region");

            System.out.println("asdf: " + buscar);
            System.out.println("idreg: " + idreg);
            if (!"".equals(buscar) && idreg != null) {
                String sql = "SELECT ol.*, NombreEmpresa, regionNombre,regionID, ComunaNombre, LogoEmpresa "
                        + "FROM ofertalaboral ol "
                        + "LEFT JOIN usuarioempresa e ON ol.EmpresaOferta = e.UsuarioEmpresaID "
                        + "LEFT JOIN comuna c ON c.ComunaID = ol.LugarTrabajo "
                        + "LEFT JOIN region r ON r.RegionID=c.ComunaRegionFK "
                        + "WHERE regionID = ? "
                        + "AND (ol.TipoCargo LIKE ? OR ol.NombreOferta LIKE ? OR NombreEmpresa LIKE ?)";
                String bres = "%" + buscar + "%";

                List ofertas = jdbcTemplate.queryForList(sql, new Object[]{idreg, bres, bres, bres});
                System.out.println("lll: " + ofertas);
                mav.addObject("ofertas", ofertas);
                mav.setViewName("trabajos");
                return mav;
            }
        }

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
            String bres = "%" + busqueda + "%";

            List ofertas = jdbcTemplate.queryForList(sql, new Object[]{idregion, bres, bres, bres});
            System.out.println("lll: " + ofertas);
            mav.addObject("ofertas", ofertas);
            mav.setViewName("trabajos");
            return mav;
        }

        mav.setViewName("trabajos");
        return mav;
    }

}
