<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@page import="org.springframework.security.core.Authentication"%>


<%
    SecurityContext ctx = SecurityContextHolder.getContext();
    Authentication auth = ctx.getAuthentication();
    String rol = auth.getAuthorities().toString();
    
    System.out.println("rol: " + rol);
    if (rol.equals("[Postulante]")) {
        System.out.println("Postulante");
        response.sendRedirect("indexp.htm");
    } else if (rol.equals("[Empresa]")) {
        System.out.println("Empresa");
        response.sendRedirect("empresas.htm");
    } else if (rol.equals("[Reclutador]")) {
        System.out.println("Reclutador");
        response.sendRedirect("reclutadores.htm");
    } else if (rol.equals("[ROLE_ANONYMOUS]")) {
        System.out.println("Index");
        response.sendRedirect("index.htm");
    }
%>