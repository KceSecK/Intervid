package Controller;

import entidades.NumeroContacto;
import Config.Conexion;
import entidades.OfertaLaboral;
import entidades.Usuario;
import entidades.UsuarioEmpresa;
import entidades.UsuarioReclutador;
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

    @RequestMapping("empresas")
    public String Empresas() {
        return ("empresa/empresas");
    }

    @RequestMapping("cuentaempresa")
    public String Cuenta() {
        return ("empresa/cuentaempresa");
    }

    @RequestMapping("publicaciones")
    public String Publicaciones() {
        return ("empresa/publicaciones");
    }

    @RequestMapping("reclutadores")
    public String Reclutadores() {
        return ("empresa/reclutadores");
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

        System.out.println("Nombre: " + u.getNombre());
        System.out.println("Apellido: " + u.getApellido());
        System.out.println("Clave: " + u.getClave());
        System.out.println("Correo: " + u.getCorreo());

        System.out.println("RUT: " + ue.getRutEmpresa());
        System.out.println("Razon Social: " + ue.getRazonSocial());
        System.out.println("Nombre Empresa: " + ue.getNombreEmpresa());

        System.out.println("Numero: " + nc.getNumeroTelefonico());

        String sql = "SELECT COUNT(CorreoUsuario) FROM Usuario WHERE CorreoUsuario = ?";
        String existe = (String) jdbcTemplate.queryForObject(sql, new Object[]{u.getCorreo()}, String.class);
        System.out.println("Existe: " + existe);
        if (existe.equals("1")) {
            System.out.println("redirect: error");
            mav.setViewName("redirect:/registroEmpresa.htm?error=1");
            return mav;
        } else if (existe.equals("0")) {
            System.out.println("creacion de empresa");
            String sql3 = "SELECT COUNT(RutEmpresa) FROM UsuarioEmpresa WHERE RutEmpresa = ?";
            String existerut = (String) jdbcTemplate.queryForObject(sql3, new Object[]{ue.getRutEmpresa()}, String.class);
            System.out.println("Existerut: " + existerut);

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

    @RequestMapping(value = "agregarreclutador.htm", method = RequestMethod.POST)
    public ModelAndView AgregarReclutador(HttpServletRequest request, UsuarioReclutador ur, Usuario u) {
        HttpSession session = request.getSession();
        SecurityContext ctx = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
        Authentication auth = ctx.getAuthentication();

        String sql = "SELECT COUNT(CorreoUsuario) FROM Usuario WHERE CorreoUsuario = ?";
        System.out.println("Rcuenta: " + u.getCorreo());
        String existe = (String) jdbcTemplate.queryForObject(sql, new Object[]{u.getCorreo()}, String.class);
        System.out.println("Existe str: " + existe);
        if (existe.equals("1")) {
            System.out.println("redirect: error");
            mav.setViewName("agregarreclutador?error=1");
            return mav;
        } else if (existe.equals("0")) {
            System.out.println("call reclutador: ");
            this.jdbcTemplate.update("call creacion_UsuarioReclutador(?,?,?,?,?,?,?)", u.getCorreo(), u.getClave(), u.getNombre(), u.getApellido(), auth.getName(), ur.getRgenero(), ur.getRcargo());
            mav.setViewName("agregarreclutador.htm?success=1");
            return mav;
        }
        mav.setViewName("agregarreclutador.htm");
        return mav;
    }

}
