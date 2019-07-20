/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Config.Conexion;
import entidades.*;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fasterxml.jackson.core.*;
import com.fasterxml.jackson.databind.*;
import entidades.ExpectativaLaboral;
import entidades.ExperienciaProfesional;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpSession;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Saitam
 */
@Controller
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
        String password = u.getClave();
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedPassword = passwordEncoder.encode(password);
        u.setClave(hashedPassword);

        String sql = "SELECT COUNT(CorreoUsuario) FROM Usuario WHERE CorreoUsuario = ?";
        String existe = (String) jdbcTemplate.queryForObject(sql, new Object[]{u.getCorreo()}, String.class);
        System.out.println("Existe: " + existe);
        if (existe.equals("1")) {
            System.out.println("redirect: error");
            mav.setViewName("redirect:/registro.htm?error=1");
            return mav;
        } else if (existe.equals("0")) {
            System.out.println("loginpostulante");
            this.jdbcTemplate.update("call creacion_UsuarioPostulante(?,?,?,?)", u.getCorreo(), u.getClave(), u.getNombre(), u.getApellido());
            mav.setViewName("redirect:/loginPostulante.htm?success=1");
            return mav;
        } else {
            System.out.println("Else");
            mav.setViewName("registro");
            return mav;
        }
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
            boolean match2 = npass1.equals(npass2);
            System.out.println("match1: " + match);
            System.out.println("match2: " + match2);
            if (match == true & match2 == true) {
                String hashedPassword = passwordEncoder.encode(npass1);
                String sql2 = "UPDATE Usuario SET Contraseña = ? WHERE CorreoUsuario = ?";
                this.jdbcTemplate.update(sql2, (PreparedStatement ps) -> {
                    ps.setString(1, hashedPassword);
                    ps.setString(2, auth.getName());
                });
                mav.setViewName("redirect:/indexp.htm?success=1");
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

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        if (!(auth instanceof AnonymousAuthenticationToken)) {
            System.out.println("rol: " + auth.getAuthorities());
            String rol = auth.getAuthorities().toString();
            System.out.println("asdfr: " + rol);
            if (rol.equals("[Postulante]")) {
                /* The user is logged in :) */
                System.out.println("if rol");
                model.setViewName("redirect:/trabajos.htm");
                return model;
            } else {
                System.out.println("else");
                model.setViewName("redirect:/index.htm");
            }
        }

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
        String sql5 = "SELECT CorreoUsuario,EducacionPostulanteID, EducacionPostulanteFK,Institucion,NivelEstudio, "
                + "EstadoEstudio,PeriodoInicio,PeriodoFin,PeriodoActual "
                + "FROM usuario LEFT JOIN usuariopostulante u on usuario.UsuarioID = u.PostulanteUsuarioFK "
                + "LEFT JOIN  educacionpostulante e on u.UsuarioPostulanteID = e.EducacionPostulanteFK WHERE CorreoUsuario='" + auth.getName() + "'";
        String sql6 = "SELECT * FROM NumeroContacto, usuario WHERE NumeroUsuarioFK = UsuarioID AND CorreoUsuario = '" + auth.getName() + "'";
        String sql7 = "SELECT * FROM pais, comuna, region WHERE paisID = RegionPaisFK AND ComunaRegionFK = RegionID";
        String sql8 = "SELECT CorreoUsuario,ExperienciaProfesionalID,ExperienciaPostulanteFK,EmpresaExperiencia, "
                + "CargoDesempeñado,InicioPeriodo,FinPeriodo,FuncionesLogros "
                + "FROM usuario LEFT JOIN usuariopostulante u on usuario.UsuarioID = u.PostulanteUsuarioFK "
                + "LEFT JOIN experienciaprofesional e on u.UsuarioPostulanteID = e.ExperienciaPostulanteFK "
                + "WHERE  CorreoUsuario= '" + auth.getName() + "'";
        String sql9 = "SELECT CorreoUsuario, IdiomaPostulanteID,PostulanteIdiomaFK,IdiomaFK,NivelEscrito,NivelHablado,NombreIdioma,IdiomaID "
                + "FROM usuario LEFT JOIN usuariopostulante u on usuario.UsuarioID = u.PostulanteUsuarioFK "
                + "LEFT JOIN idiomapostulante i on u.UsuarioPostulanteID = i.PostulanteIdiomaFK LEFT JOIN idioma i2 on i.IdiomaFK = i2.IdiomaID "
                + "WHERE CorreoUsuario='" + auth.getName() + "'";
        String sql10 = "select * from idioma";
        String sql11 = "select * from otrosConocimientos,usuario,usuariopostulante"
                + " WHERE ConocimientoPostulante=UsuarioPostulanteID AND CorreoUsuario='" + auth.getName() + "'";
        List datos = this.jdbcTemplate.queryForList(sql);
        List pais = this.jdbcTemplate.queryForList(sql2);
        List region = this.jdbcTemplate.queryForList(sql3);
        List comuna = this.jdbcTemplate.queryForList(sql4);
        List educacion = this.jdbcTemplate.queryForList(sql5);
        List numero = this.jdbcTemplate.queryForList(sql6);
        List prc = this.jdbcTemplate.queryForList(sql7);
        List exp = this.jdbcTemplate.queryForList(sql8);
        List idiomaPos = this.jdbcTemplate.queryForList(sql9);
        List idioma = this.jdbcTemplate.queryForList(sql10);
        List conocimiento = this.jdbcTemplate.queryForList(sql11);

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
        mav.addObject("exp", exp);
        mav.addObject("idiPos", idiomaPos);
        mav.addObject("idi", idioma);
        mav.addObject("con", conocimiento);
        System.out.println(conocimiento);
        mav.setViewName("postulante/cvPostulante");
        return mav;
    }

    @RequestMapping(value = "cvPostulante.htm", method = RequestMethod.POST)
    public ModelAndView cvPostulante(HttpServletRequest request, Usuario u, UsuarioPostulante up, Licencia l,
            ContactoPostulante cp, NumeroContacto nc, EducacionPostulante ep, ExpectativaLaboral el, ExperienciaProfesional exp) {
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

            return new ModelAndView("redirect:/cvPostulante.htm");
        } else if (form == 2) {

            this.jdbcTemplate.update("call edit_datosContactoPostulante(?,?,?,?)",
                    up.getId_usuarioPostulante(),
                    cp.getComunaResidencia(),
                    cp.getDireccionResidencia(),
                    cp.getCorreoContacto()
            );

            return new ModelAndView("redirect:/cvPostulante.htm#datoscontacto");
        } else if (form == 3) {

            String sql = "INSERT INTO `numerocontacto`( `NumeroUsuarioFK`, `ContactoTipo`, `NumeroTelefonico`) "
                    + "VALUES (?,?,?)";
            this.jdbcTemplate.update(sql, (PreparedStatement ps) -> {
                ps.setInt(1, u.getUsuarioID());
                ps.setString(2, nc.getContactoTipo());
                ps.setString(3, nc.getNumeroTelefonico());
            });

            return new ModelAndView("redirect:/cvPostulante.htm#datoscontacto");
        } else if (form == 4) {

            this.jdbcTemplate.update("CALL creacion_educacionPostulante(?,?,?,?,?,?,?)",
                    up.getId_usuarioPostulante(),
                    ep.getInstitucion(),
                    ep.getNivelEstudio(),
                    ep.getEstadoEstudio(),
                    ep.getPeriodoInicio(),
                    ep.getPeriodoFin(),
                    ep.getPeriodoActual()
            );

            return new ModelAndView("redirect:/cvPostulante.htm#educacion");

        } else if (form == 5) {
            String sql = "UPDATE `educacionpostulante` SET "
                    + "`Institucion`=? ,`NivelEstudio`=? ,`EstadoEstudio`=? ,"
                    + "`PeriodoInicio`=? ,`PeriodoFin`=? ,`PeriodoActual`=? WHERE "
                    + "EducacionPostulanteID=?";

            int periodoActual;
            if (request.getParameter("PeriodoActual") == null) {
                periodoActual = 0;
            } else {
                periodoActual = 1;
            }

            this.jdbcTemplate.update(sql, (PreparedStatement ps) -> {
                ps.setString(1, request.getParameter("Institucion"));
                ps.setString(2, request.getParameter("NivelEstudio"));
                ps.setString(3, request.getParameter("EstadoEstudio"));
                ps.setString(4, request.getParameter("PeriodoInicio"));
                ps.setString(5, request.getParameter("PeriodoFin"));
                ps.setInt(6, periodoActual);
                ps.setInt(7, Integer.parseInt(request.getParameter("id_educacion")));

            });
            return new ModelAndView("redirect:/cvPostulante.htm#educacion");
        } else if (form == 6) {
//            System.out.println(el.getRegionPreferente());
//            System.out.println(el.getExpectativaRenta());
//            System.out.println(el.getTipoMoneda());
//            System.out.println(el.getJornadaPreferente());
//            System.out.println(el.getDisponibilidadViaje());
//            System.out.println(el.getCambioResidencia());
            System.out.println(request.getParameter("id_usuarioPostulante"));
            String sql = "UPDATE `expectativalaboral` SET "
                    + "`RegionPreferente`=?,`ExpectativaRenta`=?,"
                    + "`TipoMoneda`=?,`JornadaPreferente`=?,"
                    + "`DisponibilidadViaje`=?,`CambioResidencia`=? "
                    + "WHERE ExpectativaPostulanteFK=?";
            this.jdbcTemplate.update(sql, (PreparedStatement ps) -> {
                ps.setLong(1, el.getRegionPreferente());
                ps.setInt(2, el.getExpectativaRenta());
                ps.setString(3, el.getTipoMoneda());
                ps.setString(4, el.getJornadaPreferente());
                ps.setInt(5, el.getDisponibilidadViaje());
                ps.setInt(6, el.getCambioResidencia());
                ps.setInt(7, Integer.parseInt(request.getParameter("id_usuarioPostulante")));

            });
            return new ModelAndView("redirect:/cvPostulante.htm#expectativaslaborales");
        } else if (form == 7) {
            String sql = "INSERT INTO `experienciaprofesional`(`ExperienciaPostulanteFK`, "
                    + "`EmpresaExperiencia`, `CargoDesempeñado`, `InicioPeriodo`, `FinPeriodo`, `FuncionesLogros`) "
                    + "VALUES (?,?,?,?,?,?)";
            this.jdbcTemplate.update(sql, (PreparedStatement ps) -> {
                ps.setInt(1, Integer.parseInt(request.getParameter("id_usuarioPostulante")));
                ps.setString(2, exp.getEmpresaExperiencia());
                ps.setString(3, exp.getCargoDesempeño());
                ps.setString(4, exp.getInicioPeriodo());
                ps.setString(5, exp.getFinPeriodo());
                ps.setString(6, exp.getFuncionesLogros());

            });
            return new ModelAndView("redirect:/cvPostulante.htm#experienciaprofesional");
        } else if (form == 8) {
            String sql = "UPDATE `numerocontacto` SET `ContactoTipo`=?,`NumeroTelefonico`=? WHERE `NumeroContactoID`= ? ";
            this.jdbcTemplate.update(sql, (PreparedStatement ps) -> {
                ps.setString(1, request.getParameter("contactoTipo"));
                ps.setString(2, request.getParameter("NumeroTelefonico"));
                ps.setInt(3, Integer.parseInt(request.getParameter("id_telefono")));

            });
            return new ModelAndView("redirect:/cvPostulante.htm#datoscontacto");
        } else if (form == 9) {

            //edit Experiencia laboral
            return new ModelAndView("redirect:/cvPostulante.htm#datoscontacto");
        } else if (form == 10) {
            String sql = "INSERT INTO `idiomapostulante`(`PostulanteIdiomaFK`, `IdiomaFK`, "
                    + "`NivelEscrito`, `NivelHablado`) VALUES (?,?,?,?)";
            this.jdbcTemplate.update(sql, (PreparedStatement ps) -> {
                ps.setInt(1, Integer.parseInt(request.getParameter("id_usuarioPostulante")));
                ps.setInt(2, Integer.parseInt(request.getParameter("idiomaPostulante")));
                ps.setString(3, request.getParameter("nivelEscrito"));
                ps.setString(4, request.getParameter("nivelHablado"));

            });
            return new ModelAndView("redirect:/cvPostulante.htm#idiomas");
        } else if (form == 11) {
            String sql = "UPDATE `idiomapostulante` SET `IdiomaFK`=?,`NivelEscrito`=?,`NivelHablado`=? "
                    + "WHERE `IdiomaPostulanteID`= ? ";
            this.jdbcTemplate.update(sql, (PreparedStatement ps) -> {
                ps.setInt(1, Integer.parseInt(request.getParameter("idiomaPostulante")));
                ps.setString(2, request.getParameter("nivelEscrito"));
                ps.setString(3, request.getParameter("nivelHablado"));
                ps.setInt(4, Integer.parseInt(request.getParameter("idiomaPosID")));

            });
            return new ModelAndView("redirect:/cvPostulante.htm#idiomas");
        } else if (form == 12) {
            String sql = "INSERT INTO `otrosconocimientos`( `ConocimientoPostulante`, `Conocimiento`) "
                    + "VALUES (?,?) ";
            this.jdbcTemplate.update(sql, (PreparedStatement ps) -> {
                ps.setInt(1, Integer.parseInt(request.getParameter("id_usuarioPostulante")));
                ps.setString(2, request.getParameter("conocimiento"));

            });
            return new ModelAndView("redirect:/cvPostulante.htm#otrosconocimientos");
        } else if (form == 13) {
            String sql = "UPDATE `otrosconocimientos` SET `Conocimiento`=? "
                    + "WHERE `OtrosConocimientosID`= ? ";
            this.jdbcTemplate.update(sql, (PreparedStatement ps) -> {
                ps.setString(1, request.getParameter("conocimiento"));
                ps.setInt(2, Integer.parseInt(request.getParameter("id_conocimiento")));

            });
            return new ModelAndView("redirect:/cvPostulante.htm#otrosconocimientos");
        } else {

            return new ModelAndView("redirect:/cvPostulante.htm");
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
        //cambio configuracion para obtener fecha correctamente
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        String json = mapper.writeValueAsString(estudio);

        return json;
    }
//    Rellenar modal para editar experienciaPostulante

    @RequestMapping(value = "editExperienciaPostulante.htm", method = RequestMethod.POST)
    public @ResponseBody
    String ObtenerExperienciaPostulante(HttpServletRequest request) throws JsonProcessingException {
        String sql = "SELECT * FROM `experienciaProfesional` WHERE "
                + "ExperienciaProfesionalID= " + request.getParameter("id");
        List experiencia = jdbcTemplate.queryForList(sql);
        ObjectMapper mapper = new ObjectMapper();
        System.out.println(experiencia);
        //cambio configuracion para obtener fecha correctamente
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        String json = mapper.writeValueAsString(experiencia);

        return json;
    }
//    Rellenar modal para editar telefono

    @RequestMapping(value = "editTelefonoPostulante.htm", method = RequestMethod.POST)
    public @ResponseBody
    String ObtenerTelefonoPostulante(HttpServletRequest request) throws JsonProcessingException {
        String sql = "SELECT * FROM `numeroContacto` WHERE "
                + "NumeroContactoID= " + request.getParameter("id");
        List telefono = jdbcTemplate.queryForList(sql);
        ObjectMapper mapper = new ObjectMapper();
        //cambio configuracion para obtener fecha correctamente
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        String json = mapper.writeValueAsString(telefono);

        return json;
    }
//    Rellenar modal para editar idiomaPostulante

    @RequestMapping(value = "editIdiomaPostulante.htm", method = RequestMethod.POST)
    public @ResponseBody
    String ObtenerIdiomasPostulante(HttpServletRequest request) throws JsonProcessingException {
        String sql = "SELECT * FROM `IdiomaPostulante` WHERE "
                + "IdiomaPostulanteID= " + request.getParameter("id");
        List idiomaPos = jdbcTemplate.queryForList(sql);
        ObjectMapper mapper = new ObjectMapper();
        //cambio configuracion para obtener fecha correctamente
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        String json = mapper.writeValueAsString(idiomaPos);
        System.out.println();
        return json;
    }
//    Rellenar modal para editar idiomaPostulante

    @RequestMapping(value = "editConocimientoPostulante.htm", method = RequestMethod.POST)
    public @ResponseBody
    String ObtenerConocimientoPostulante(HttpServletRequest request) throws JsonProcessingException {
        String sql = "SELECT * FROM `otrosConocimientos` WHERE "
                + "OtrosConocimientosID= " + request.getParameter("id");
        List conoPos = jdbcTemplate.queryForList(sql);
        ObjectMapper mapper = new ObjectMapper();
        //cambio configuracion para obtener fecha correctamente
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        String json = mapper.writeValueAsString(conoPos);
        System.out.println();
        return json;
    }
    // Select dinamico pais-region

    @RequestMapping(value = "listaRegion.htm", method = RequestMethod.POST)
    public @ResponseBody
    String listaRegiones(HttpServletRequest request) throws JsonProcessingException {

        String sql = "select * from region where regionPaisFK=" + request.getParameter("pais_id");
        List regiones = jdbcTemplate.queryForList(sql);
        ObjectMapper mapper = new ObjectMapper();
        String jsonRegiones = mapper.writeValueAsString(regiones);
        return jsonRegiones;
    }

    // Select dinamico pais-region
    @RequestMapping(value = "listaComuna.htm", method = RequestMethod.POST)
    public @ResponseBody
    String listaComunas(HttpServletRequest request) throws JsonProcessingException {

        String sql = "select * from comuna where comunaRegionFK=" + request.getParameter("region_id");
        List comunas = jdbcTemplate.queryForList(sql);
        ObjectMapper mapper = new ObjectMapper();
        System.out.println(comunas);
        String jsonComuna = mapper.writeValueAsString(comunas);
        return jsonComuna;
    }

    //Borrar numero de contacto 
    @RequestMapping(value = "borrarTelefono.htm", method = RequestMethod.GET)
    public ModelAndView borrarNumeroContacto(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "DELETE FROM `numerocontacto` WHERE numeroContactoID=? ";
        this.jdbcTemplate.update(sql, (PreparedStatement ps) -> {
            ps.setInt(1, id);
        });
        return new ModelAndView("redirect:/cvPostulante.htm#datoscontacto");
    }

    //Borrar numero de contacto 
    @RequestMapping(value = "borrarIdiomaPostulante.htm", method = RequestMethod.GET)
    public ModelAndView borrarIdiomaPostulante(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "DELETE FROM `idiomaPostulante` WHERE idiomaPostulanteID=? ";
        this.jdbcTemplate.update(sql, (PreparedStatement ps) -> {
            ps.setInt(1, id);
        });
        return new ModelAndView("redirect:/cvPostulante.htm#idiomas");
    }

    //Borrar conocimiento usuario 
    @RequestMapping(value = "borrarConocimientoPostulante.htm", method = RequestMethod.GET)
    public ModelAndView borrarConociemtoPostulante(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "DELETE FROM `otrosconocimientos` WHERE OtrosConocimientosID=? ";
        this.jdbcTemplate.update(sql, (PreparedStatement ps) -> {
            ps.setInt(1, id);
        });
        return new ModelAndView("redirect:/cvPostulante.htm#otrosconocimientos");
    }

    //editar numero de contacto
    @RequestMapping(value = "editarTelefono.htm", method = RequestMethod.GET)
    public ModelAndView editarNumeroContacto(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        String nt = request.getParameter("numTel");
        String ct = request.getParameter("conTipo");
        System.out.println(id + nt + ct);
        String sql = "UPDATE `numerocontacto` SET `ContactoTipo`=?,`NumeroTelefonico`=? WHERE NumeroContactoID ? ";
        this.jdbcTemplate.update(sql, (PreparedStatement ps) -> {
            ps.setString(1, ct);
            ps.setString(2, nt);
            ps.setInt(3, id);
        });
        return new ModelAndView("redirect:/cvPostulante.htm#datoscontacto");
    }

    @RequestMapping(value = "borrarEducacion.htm", method = RequestMethod.GET)
    public ModelAndView borrarEducacion(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "DELETE FROM `educacionPostulante` WHERE educacionPostulanteID=? ";
        this.jdbcTemplate.update(sql, (PreparedStatement ps) -> {
            ps.setInt(1, id);
        });
        return new ModelAndView("redirect:/cvPostulante.htm");
    }

    @RequestMapping(value = "borrarExperienciaLaboral.htm", method = RequestMethod.GET)
    public ModelAndView borrarExperienciaLaboral(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "DELETE FROM `experienciaProfesional` WHERE experienciaProfesionalID=? ";
        this.jdbcTemplate.update(sql, (PreparedStatement ps) -> {
            ps.setInt(1, id);
        });
        return new ModelAndView("redirect:/cvPostulante.htm#experienciaprofesional");
    }

    @RequestMapping(value = "headerpostulante.htm", method = RequestMethod.PUT)
    public ModelAndView listarReg(HttpServletRequest request) {
        String sqlr = "SELECT * FROM v_regionofertas";
        List region = this.jdbcTemplate.queryForList(sqlr);
        mav.addObject("reg", region);
        System.out.println("Lista; " + region);
        mav.setViewName("postulante/headerpostulante.htm");
        return mav;
    }

    @RequestMapping(value = "videopitch.htm", method = RequestMethod.GET)
    public ModelAndView videoPitch() {
        mav.addObject(new UsuarioPostulante());
        mav.setViewName("postulante/videopitch");
        return mav;
    }

    @RequestMapping("entrevistadiferida.htm")
    public ModelAndView entrevistaDiferida() {
        String sql = "select * from ofertalaboral where ofertalaboralid =1";
        List ofertas = jdbcTemplate.queryForList(sql);
        mav.addObject("ofertas", ofertas);
        mav.setViewName("postulante/entrevistadiferida");
        return mav;
    }

}
