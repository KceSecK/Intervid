/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Config.Conexion;
import entidades.ContactoPostulante;
import entidades.EducacionPostulante;
import entidades.Licencia;
import entidades.NumeroContacto;
import entidades.Usuario;
import entidades.UsuarioPostulante;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.fasterxml.jackson.core.*;
import com.fasterxml.jackson.databind.*;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpSession;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Saitam
 */
@Controller
@SessionAttributes({"tipoCuenta", "CorreoUsuario", "NombreUsuario", "CuentaActiva", "ID"})

public class CtrlPostulante {

    Conexion con = new Conexion();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Conectar());
    ModelAndView mav = new ModelAndView();

    @RequestMapping(value = "registro.htm", method = RequestMethod.GET)
    public ModelAndView Agregar() {
        mav.addObject(new Usuario());
        mav.addObject(new UsuarioPostulante());
        mav.setViewName("registro");
        return mav;
    }

    @RequestMapping(value = "registro.htm", method = RequestMethod.POST)
    public ModelAndView Agregar(Usuario u) {
        ModelAndView model = new ModelAndView();

        String password = u.getClave();
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedPassword = passwordEncoder.encode(password);
        u.setClave(hashedPassword);
        this.jdbcTemplate.update("call creacion_UsuarioPostulante(?,?,?,?)", u.getCorreo(), u.getClave(), u.getNombre(), u.getApellido());

        model.setViewName("index");
        return model;

    }

    @RequestMapping(value = "indexp.htm", method = RequestMethod.GET)
    public ModelAndView indexPostulante() {
        mav.setViewName("postulante/indexp");
        return mav;
    }

    @RequestMapping(value = "indexp.htm", method = RequestMethod.POST)
    public ModelAndView validarCambioCorreo(HttpServletRequest request) {
        int form = Integer.parseInt(request.getParameter("formulario"));
        String password = request.getParameter("pass");
        String correo = request.getParameter("correo");

        String npass1 = request.getParameter("npass1");
        String npass2 = request.getParameter("npass2");

        HttpSession session = request.getSession();
        SecurityContext ctx = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
        Authentication auth = ctx.getAuthentication();
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        if (form == 1) {
            String sqlexiste = "SELECT COUNT(CorreoUsuario) FROM Usuario WHERE CorreoUsuario = ?";
            String existe = (String) jdbcTemplate.queryForObject(sqlexiste, new Object[]{correo}, String.class);

            if (existe.equals("0")) {
                String sql = "SELECT contraseña FROM Usuario WHERE CorreoUsuario = ?";
                String validar = (String) jdbcTemplate.queryForObject(sql, new Object[]{auth.getName()}, String.class);

                boolean match = passwordEncoder.matches(password, validar);
                if (match == true) {
                    String sql2 = "UPDATE Usuario SET CorreoUsuario = ? WHERE CorreoUsuario = ?";
                    this.jdbcTemplate.update(sql2, (PreparedStatement ps) -> {
                        ps.setString(1, correo);
                        ps.setString(2, auth.getName());
                    });
                    mav.setViewName("redirect:/logout");
                    return mav;
                } else {
                    mav.setViewName("redirect:/indexp.htm?error=2");
                    return mav;
                }
            } else {
                mav.setViewName("redirect:/indexp.htm?error=3");
                return mav;
            }
        } else if (form == 2) {
            String sql = "SELECT contraseña FROM Usuario WHERE CorreoUsuario = ?";
            String validar = (String) jdbcTemplate.queryForObject(sql, new Object[]{auth.getName()}, String.class);
            boolean match = passwordEncoder.matches(password, validar);
            if (match == true) {
                String sql2 = "UPDATE Usuario SET CorreoUsuario = ? WHERE CorreoUsuario = ?";
                this.jdbcTemplate.update(sql2, (PreparedStatement ps) -> {
                    ps.setString(1, correo);
                    ps.setString(2, auth.getName());
                });
                mav.setViewName("redirect:/logout");
                return mav;
            } else {
                mav.setViewName("redirect:/indexp.htm?error=4");
                return mav;
            }

        } else {
            mav.setViewName("redirect:/indexp.htm?error=999");
            return mav;
        }
    }

    @RequestMapping(value = "loginPostulante.htm", method = RequestMethod.GET)
    public ModelAndView loginUsuarioPostulante(@RequestParam(value = "error", required = false) String error,
            HttpServletRequest request, Usuario u) throws Exception {

        ModelAndView model = new ModelAndView();

        if (error != null) {

            model.addObject("error", true);

        }
        model.setViewName("loginPostulante");

        return model;
    }

    @RequestMapping(value = "cvPostulante.htm", method = RequestMethod.GET)

    public ModelAndView cvPostulante(HttpServletRequest request) {
        HttpSession session = request.getSession();
        SecurityContext ctx = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
        Authentication auth = ctx.getAuthentication();
        System.out.println("Nombre de usuario: " + auth.getName());

//        mav.addObject(new UsuarioPostulante());
//        mav.addObject(new Usuario());
//        mav.addObject(new Licencia());
//        int idUsuario = Integer.parseInt(request.getParameter("ID"));
//        int idUsuarioPostulante = Integer.parseInt(request.getParameter("IdPostulante"));
//
        String sql = "SELECT * FROM usuario \n"
                + "LEFT JOIN usuariopostulante \n"
                + "	ON usuariopostulante.PostulanteUsuarioFK = usuario.UsuarioID \n"
                + "LEFT JOIN contactopostulante \n"
                + "	ON contactopostulante.ContactoPostulanteFK = usuariopostulante.UsuarioPostulanteID\n"
                + "LEFT JOIN idiomapostulante\n"
                + "	ON idiomapostulante.PostulanteIdiomaFK = usuariopostulante.UsuarioPostulanteID\n"
                + "LEFT JOIN licencia\n"
                + "	ON licencia.LicenciaPostulanteFK = usuariopostulante.UsuarioPostulanteID\n"
                + "LEFT JOIN educacionpostulante\n"
                + "	ON educacionpostulante.EducacionPostulanteFK = usuariopostulante.UsuarioPostulanteID\n"
                + "LEFT JOIN expectativalaboral\n"
                + "	ON expectativalaboral.ExpectativaPostulanteFK = usuariopostulante.UsuarioPostulanteID\n"
                + "LEFT JOIN experienciaprofesional\n"
                + "	ON experienciaprofesional.ExperienciaPostulanteFK = usuariopostulante.UsuarioPostulanteID\n"
                + "LEFT JOIN numerocontacto\n"
                + "	ON numerocontacto.NumeroUsuarioFK = usuario.UsuarioID\n"
                + "LEFT JOIN otrosconocimientos\n"
                + "	ON otrosconocimientos.ConocimientoPostulante = usuariopostulante.UsuarioPostulanteID"
                + " LEFT JOIN comuna\n"
                + "ON comuna.ComunaID=contactopostulante.ComunaResidencia\n"
                + "LEFT JOIN region\n"
                + "ON region.RegionID=comuna.ComunaRegionFK\n"
                + "LEFT JOIN pais\n"
                + "ON pais.PaisID=region.RegionPaisFK \n"
                + "WHERE usuario.CorreoUsuario= '" + auth.getName() + "'";
        String sql2 = "select * from Pais";
        String sql3 = "select * from Region";
        String sql4 = "select * from Comuna";
        String sql5 = "SELECT * FROM educacionpostulante, usuario WHERE EducacionPostulanteFK = UsuarioID AND CorreoUsuario = '" + auth.getName() + "'";
        String sql6 = "SELECT * FROM NumeroContacto, usuario WHERE NumeroUsuarioFK = UsuarioID AND CorreoUsuario = '" + auth.getName() + "'";
        String sql7 = "SELECT * FROM pais, comuna, region WHERE paisID = RegionPaisFK AND ComunaRegionFK = RegionID";
        List datos = this.jdbcTemplate.queryForList(sql);
        List pais = this.jdbcTemplate.queryForList(sql2);
        List region = this.jdbcTemplate.queryForList(sql3);
        List comuna = this.jdbcTemplate.queryForList(sql4);
        List educacion = this.jdbcTemplate.queryForList(sql5);
        List numero = this.jdbcTemplate.queryForList(sql6);
        List prc = this.jdbcTemplate.queryForList(sql7);

//        model.addAttribute("pais",pais);
//        model.addAttribute("region",region);
//        model.addAttribute("comuna",comuna);
//        model.addAttribute("lista", datos);
        mav.addObject("lista", datos);
        mav.addObject("pais", pais);
        mav.addObject("region", region);
        mav.addObject("comuna", comuna);
        mav.addObject("edu", educacion);
        mav.addObject("num", numero);
        mav.addObject("prc", prc);
        mav.setViewName("postulante/cvPostulante");
        return mav;
    }

    @RequestMapping(value = "cvPostulante.htm", method = RequestMethod.POST)
    public ModelAndView cvPostulante(HttpServletRequest request, Usuario u, UsuarioPostulante up, Licencia l,
            ContactoPostulante cp, NumeroContacto nc, EducacionPostulante ep) {
        int form = Integer.parseInt(request.getParameter("Cuadro"));

        System.out.println("Formulario: " + form);
        if (form == 1) {
            this.jdbcTemplate.update("call editar_UsuarioPostulante(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
                    u.getUsuarioID(),
                    u.getNombre(),
                    u.getApellido(),
                    up.getId_usuarioPostulante(),
                    up.getGenero(),
                    up.getNacionalidad(),
                    up.getNumDocumento(),
                    up.getDocumento(),
                    up.getFechaNacimiento(),
                    up.getEstadoCivil(),
                    up.getVehiculoUsuario(),
                    up.getDiscapacidadUsuario(),
                    l.getLicenciaTipoA1(),
                    l.getLicenciaTipoA2(),
                    l.getLicenciaTipoA3(),
                    l.getLicenciaTipoA4(),
                    l.getLicenciaTipoA5(),
                    l.getLicenciaTipoB(),
                    l.getLicenciaTipoC(),
                    l.getLicenciaTipoD(),
                    l.getLicenciaTipoE(),
                    l.getLicenciaTipoF(),
                    l.getNoLicencia()
            );
            System.out.println(u.getUsuarioID());
            System.out.println(u.getNombre());
            System.out.println(u.getApellido());
            System.out.println(up.getId_usuarioPostulante());
            System.out.println(up.getGenero());
            System.out.println(up.getNacionalidad());
            System.out.println(up.getNumDocumento());
            System.out.println(up.getDocumento());
            System.out.println(up.getFechaNacimiento());
            System.out.println(up.getEstadoCivil());
            System.out.println(up.getVehiculoUsuario());
            System.out.println(up.getDiscapacidadUsuario());
            System.out.println(l.getLicenciaTipoA1());
            System.out.println(l.getLicenciaTipoA2());
            System.out.println(l.getLicenciaTipoA3());
            System.out.println(l.getLicenciaTipoA4());
            System.out.println(l.getLicenciaTipoA5());
            System.out.println(l.getLicenciaTipoB());
            System.out.println(l.getLicenciaTipoC());
            System.out.println(l.getLicenciaTipoD());
            System.out.println(l.getLicenciaTipoE());
            System.out.println(l.getLicenciaTipoF());
            System.out.println(l.getNoLicencia());

            return new ModelAndView("redirect:/cvPostulante.htm?ID=" + u.getUsuarioID() + "&IdPostulante=" + up.getId_usuarioPostulante());
        } else if (form == 2) {

            this.jdbcTemplate.update("call edit_datosContactoPostulante(?,?,?,?)",
                    up.getId_usuarioPostulante(),
                    cp.getComunaResidencia(),
                    cp.getDireccionResidencia(),
                    cp.getCorreoContacto()
            );

            return new ModelAndView("redirect:/cvPostulante.htm?ID=" + u.getUsuarioID() + "&IdPostulante=" + up.getId_usuarioPostulante());
        } else if (form == 3) {

            this.jdbcTemplate.update("CALL creacion_educacionPostulante(?,?,?,?,?,?,?)",
                    up.getId_usuarioPostulante(),
                    ep.getInstitucion(),
                    ep.getEstadoEstudio(),
                    ep.getNivelEstudio(),
                    ep.getPeriodoInicio(),
                    ep.getPeriodoFin(),
                    ep.getPeriodoActual()
            );

            return new ModelAndView("redirect:/cvPostulante.htm?idUS=" + up.getId_usuarioPostulante());

        } else {

            return new ModelAndView("redirect:/cvPostulante.htm?idUS=" + up.getId_usuarioPostulante());
        }

    }

//    Rellenar modal para editar educacionPostulante
    @RequestMapping(value = "editEstudioPostulante.htm", method = RequestMethod.POST)
    public @ResponseBody
    String ObtenerEducacionPostulante(HttpServletRequest request) throws JsonProcessingException {
        String sql = "SELECT * FROM `educacionpostulante` WHERE "
                + "EducacionPostulanteID= " + request.getParameter("id2");
        List estudio = jdbcTemplate.queryForList(sql);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(estudio);
        System.out.println(json);
        return json;
    }

    @RequestMapping(value = "ofertasLaboralesPostulante.htm", method = RequestMethod.GET)
    public ModelAndView vistaOfertasLaborales() {
        mav.addObject(new UsuarioPostulante());
        mav.setViewName("ofertasLaboralesPostulante");
        return mav;
    }

//    @RequestMapping(value = "loginPostulante.htm", method = RequestMethod.POST)
//    public String loginUsuarioPostulante(HttpServletRequest request, ModelMap model) {
//        String cor = request.getParameter("correo");
//        String cla = request.getParameter("clave");
//        String sql = "select usuarioID,CorreoUsuario,TipoCuenta,"
//                + "nombreUsuario,ApellidoUsuario from usuario where correoUsuario='" + cor + "' and Contraseña=AES_ENCRYPT('" + cla + "','userpass')";
//        List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql);
//
//        if (rows.size() > 0) {
//
//            for (Map row : rows) {
//                model.put("tipoCuenta", (String) row.get("TipoCuenta").toString());
//                model.put("CorreoUsuario", (String) row.get("CorreoUsuario").toString());
//                model.put("NombreUsuario", (String) row.get("NombreUsuario").toString());
//                model.put("CuentaActiva", (Integer) row.get("CuentaActiva"));
//                model.put("ID", (Integer) row.get("usuarioID"));
//            }
//
//            return "/index";
//
//        } else {
//            return "/loginPostulante";
//        }
//    }
}
