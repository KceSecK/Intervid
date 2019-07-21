package Controller;

import Config.Conexion;
import java.sql.PreparedStatement;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
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
        String sql="Select * from ofertalaboral where ofertalaboralID=3";
        String sql2="SELECT * FROM candidatooferta left join usuariopostulante on candidatooferta.CandidatoID = usuariopostulante.UsuarioPostulanteID\n" +
"left join usuario on usuario.UsuarioID = usuariopostulante.PostulanteUsuarioFK where OfertaID=3;";
        List oferta= this.jdbcTemplate.queryForList(sql);
        List postulantes = this.jdbcTemplate.queryForList(sql2);
        mav.addObject("oferta",oferta);
        mav.addObject("postu",postulantes);
        mav.setViewName("videollamada");
        return mav;
    }
    @RequestMapping(value = "notificacionPostulante.htm", method = RequestMethod.POST)
    public String enviarNotificacionPostulante(HttpServletRequest request) {
       
        String room = request.getParameter("idRoom");
        int idPostulante = Integer.parseInt(request.getParameter("idPost"));
        String link ="http://inter-vid.com/videollamada.htm#"+room ;
        System.out.println("IDPOST "+idPostulante);
        System.out.println("LINK "+link);
        String sql="insert into notificaciones (UsuarioDestino,DetalleNotificacion,EstadoNotificacion,NotificacionLink)"
                + " VALUES (?,?,?,?)";
        this.jdbcTemplate.update(sql, (PreparedStatement ps) -> {
            ps.setInt(1, idPostulante);
            ps.setString(2, "Video entrevista lista, haga click aqui para ser dirigido a la entrevista");
            ps.setInt(3, 1);
            ps.setString(4, link);
            
        });
       String mensaje ="fuciona";
        return mensaje;
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

            System.out.println("asdf: "+buscar);
            System.out.println("idreg: "+idreg);
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
