package Controller;

import entidades.NumeroContacto;
import Config.Conexion;
import entidades.OfertaLaboral;
import entidades.Usuario;
import entidades.UsuarioEmpresa;
import entidades.UsuarioReclutador;
import java.sql.PreparedStatement;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Saitam
 */
@Controller
@SessionAttributes({"tipoCuenta", "CorreoUsuario", "NombreUsuario", "CuentaActiva", "ID"})

public class CtrlEmpresa {

    Conexion con = new Conexion();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Conectar());
    ModelAndView mav = new ModelAndView();
    
    public String Auth(HttpServletRequest request){
        HttpSession session = request.getSession();
        SecurityContext ctx = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
        Authentication auth = ctx.getAuthentication();
        return auth.getName();
    }

    @RequestMapping("empresas")
    public String Empresas() {
        return ("empresa/empresas");
    }

    @RequestMapping("cuentaempresa")
    public String Cuenta() {
        return ("empresa/cuentaempresa");
    }
    
    @RequestMapping("perfilempresa")
    public String Perfil() {
        return ("empresa/perfilempresa");
    }

    @RequestMapping("publicaciones")
    public String Publicaciones() {
        return ("empresa/publicaciones");
    }

    @RequestMapping("reclutadores")
    public String Reclutadores() {
        return ("empresa/reclutadores");
    }
    
    @RequestMapping("nuevoaviso")
    public String Avisos() {
        return ("empresa/nuevoaviso");
    }

    @RequestMapping(value = "registroEmpresa.htm", method = RequestMethod.GET)
    public ModelAndView AgregarEmpresa() {
        mav.addObject(new Usuario());
        mav.setViewName("registroEmpresa");
        return mav;
    }

    @RequestMapping(value = "agregarreclutador.htm", method = RequestMethod.GET)
    public ModelAndView AgregarReclutador() {
        mav.setViewName("agregarreclutador.htm");
        return mav;
    }

    @RequestMapping(value = "registroEmpresa.htm", method = RequestMethod.POST)

    public ModelAndView Agregar(Usuario u, UsuarioEmpresa ue, NumeroContacto nc) {

        String password = u.getClave();
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedPassword = passwordEncoder.encode(password);
        u.setClave(hashedPassword);

        String sql = "SELECT COUNT(CorreoUsuario) FROM Usuario WHERE CorreoUsuario = ?";
        String existe = (String) jdbcTemplate.queryForObject(sql, new Object[]{u.getCorreo()}, String.class);
        System.out.println("Existe: " + existe);
        if (existe.equals("1")) {
            mav.setViewName("redirect:/registroEmpresa.htm?error=1");
            return mav;
        } else if (existe.equals("0")) {
            String sql3 = "SELECT COUNT(RutEmpresa) FROM UsuarioEmpresa WHERE RutEmpresa = ?";
            String existerut = (String) jdbcTemplate.queryForObject(sql3, new Object[]{ue.getRutEmpresa()}, String.class);

            if (existerut.equals("1")) {
                mav.setViewName("redirect:/registroEmpresa.htm?error=2");
                return mav;
            } else if (existerut.equals("0")) {
                this.jdbcTemplate.update("call creacion_UsuarioEmpresa(?,?,?,?,?,?,?,?)", u.getCorreo(),
                        u.getClave(), u.getNombre(), u.getApellido(), ue.getRazonSocial(),
                        ue.getRutEmpresa(), ue.getNombreEmpresa(), nc.getNumeroTelefonico());
                mav.setViewName("redirect:/loginEmpresa.htm?success=1");
                return mav;
            }
        }
        System.out.println("Else");
        mav.setViewName("registroEmpresa");
        return mav;
    }

    @RequestMapping(value = "loginEmpresa.htm", method = RequestMethod.GET)
    public ModelAndView loginUsuarioEmpresa(@RequestParam(value = "error", required = false) String error,
            HttpServletRequest request, Usuario u) throws Exception {

        ModelAndView model = new ModelAndView();

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        if (!(auth instanceof AnonymousAuthenticationToken)) {
            String rol = auth.getAuthorities().toString();
            if (rol.equals("[Empresa]")) {
                /* The user is logged in :) */
                model.setViewName("redirect:/empresas.htm");
                return model;
            } else {
                model.setViewName("redirect:/index.htm");
            }
        }

        if (error != null) {
            model.addObject("error", true);
        }
        model.setViewName("loginEmpresa");

        return model;
    }

    @RequestMapping(value = "crearOfertaLaboral.htm", method = RequestMethod.POST)

    public ModelAndView AgregarOferta(Usuario u, UsuarioEmpresa ue, NumeroContacto nc, OfertaLaboral of) {
        try {
            this.jdbcTemplate.update("insert into OfertaLaboral (NombreOferta,"
                    + "CreadorOferta,EmpresaOferta,LugarTrabajo,TipoEntrevista,"
                    + "PlanOferta,DescripcionCargo,FechaPublicacionOferta,"
                    + "FechaFinalizacionOferta,RequisitosOferta,BeneficiosOferta,"
                    + "HorarioEntrevista,TipoCargo,TipoContrato,JornadaTrabajo,SueldoOfrecido) "
                    + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
                    of.getNombreOferta(), u.getUsuarioID(), ue.getUsuarioEmpresaID(), of.getLugarTrabajo(),
                    of.getTipoEntrevista(), of.getPlanOferta(), of.getDescripcionCargo(),
                    of.getFechaPublicacionOferta(), of.getFechaFinalizacionOferta(),
                    of.getRequisitosOferta(), of.getBeneficiosOferta(), of.getHorarioEntrevista(),
                    of.getTipoCargo(), of.getTipoContrato(), of.getJornadaTrabajo(),
                    of.getSueldoOfrecido());

            return new ModelAndView("redirect:/ofertasLaboralesEmpresa.htm");

        } catch (DataIntegrityViolationException e) {
            return new ModelAndView("redirect:/crearOfertaLaboral.htm?err=1");
        }
    }

    @RequestMapping(value = "reclutadores.htm", method = RequestMethod.POST)
    public ModelAndView AgregarReclutador(HttpServletRequest request, UsuarioReclutador ur, Usuario u) {
        HttpSession session = request.getSession();
        SecurityContext ctx = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
        Authentication auth = ctx.getAuthentication();

        String sql = "SELECT COUNT(CorreoUsuario) FROM Usuario WHERE CorreoUsuario = ?";
        String existe = (String) jdbcTemplate.queryForObject(sql, new Object[]{u.getCorreo()}, String.class);
        if (existe.equals("1")) {
            System.out.println("redirect: error");
            mav.setViewName("redirect:reclutadores.htm?error=1");
            return mav;
        } else if (existe.equals("0")) {
            PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            String hashedPassword = passwordEncoder.encode(u.getClave());
            u.setClave(hashedPassword);
            this.jdbcTemplate.update("call creacion_UsuarioReclutador(?,?,?,?,?,?,?)", u.getCorreo(), u.getClave(), u.getNombre(), u.getApellido(), auth.getName(), ur.getRgenero(), ur.getRcargo());
            mav.setViewName("redirect:reclutadores.htm?success=1");
            return mav;
        }
        mav.setViewName("empresa/reclutadores");
        return mav;
    }

    @RequestMapping(value = "reclutadores.htm", method = RequestMethod.GET)
    public ModelAndView listarReclutadores(HttpServletRequest request) {
        String sql = "SELECT * FROM v_reclutadores "
                + "WHERE EmpresaAsociadaFK = (SELECT UsuarioEmpresaID FROM usuarioempresa,usuario "
                + "WHERE CorreoUsuario = ? AND EmpresaUsuarioFK = UsuarioID)";
        List reclt = jdbcTemplate.queryForList(sql, new Object[]{Auth(request)});

        mav.addObject("reclut", reclt);
        mav.setViewName("empresa/reclutadores");
        return mav;
    }

    //editar reclutador
    @RequestMapping(value = "modificarreclutador.htm", method = RequestMethod.GET)
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
    
    @RequestMapping(value = "perfilempresa.htm", method = RequestMethod.GET)
    public ModelAndView listarDatosEmpresa(HttpServletRequest request){
        String sql = "SELECT * FROM v_empresa WHERE CorreoUsuario = ?";
        String sqlpais = "SELECT * FROM PAIS";
        List pais = this.jdbcTemplate.queryForList(sqlpais);
        List empresa = this.jdbcTemplate.queryForList(sql,new Object[]{Auth(request)});
        mav.addObject("perfil", empresa);
        mav.addObject("pais",pais);
        mav.setViewName("empresa/perfilempresa");
        return mav;
    }

    @RequestMapping(value = "cuentaempresa.htm", method = RequestMethod.POST)
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
            if (password != null & correo != null) {
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
                        mav.setViewName("redirect:/cuentaempresa.htm?error=2");
                        return mav;
                    }
                } else {
                    mav.setViewName("redirect:/cuentaempresa.htm?error=3");
                    return mav;
                }
            } else {
                mav.setViewName("redirect:/cuentaempresa.htm?error=999");
                return mav;
            }
        } else if (form == 2) {
            if (password != null && npass1 != null & npass2 != null) {
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
                    mav.setViewName("redirect:/cuentaempresa.htm?success=1");
                    return mav;
                } else {
                    mav.setViewName("redirect:/cuentaempresa.htm?error=4");
                    return mav;
                }
            } else {
                mav.setViewName("redirect:/cuentaempresa.htm?error=999");
                return mav;
            }

        } else {
            mav.setViewName("redirect:/cuentaempresa.htm?error=999");
            return mav;
        }
    }

}
