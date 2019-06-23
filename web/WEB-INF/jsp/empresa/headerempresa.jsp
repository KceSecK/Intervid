<%@page import="org.springframework.security.core.userdetails.User"%>
<%@page import="org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder"%>
<%@page import="org.springframework.security.crypto.password.PasswordEncoder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>

<%
    SecurityContext ctx = SecurityContextHolder.getContext();
    Authentication auth = ctx.getAuthentication();
    String username = auth.getName();
    String rol = auth.getAuthorities().toString();

%>

<!-- Navbar-->
<div id="nav-fixed" class="container-fluid nav-intervid static">
    <div class="navbar navbar-expand-sm black">
        <div class="container-fluid">
            <!-- Logo -->
            <div class="col-lg-2">
                <a class="navbar-brand img-fluid" href="index.htm">
                    <img id="logo" src="img/letra 5mm.png" alt="InterVid">
                </a>
            </div>
            <div class="container">
                <div class="ml-5 collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <div class="dropdown">
                                <a class="btn dropdown-toggle text-intervid " href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <%= username%>
                                </a>

                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
                                    <a class="dropdown-item" href="publicaciones.htm">Mis publicaciones</a>
                                    <a class="dropdown-item" href="#">Mis entrevistas</a>
                                    <a class="dropdown-item" href="reclutadores.htm">Mis reclutadores</a>
                                    <a class="dropdown-item" href="#">Notificaciones</a>
                                    <a class="dropdown-item" href="cuentaempresa.htm">Cuenta</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="logout">Cerrar Sesión</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>