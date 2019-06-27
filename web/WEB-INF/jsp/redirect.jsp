<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@page import="org.springframework.security.core.Authentication"%>


<%
    SecurityContext ctx = SecurityContextHolder.getContext();
    Authentication auth = ctx.getAuthentication();
    String rol = auth.getAuthorities().toString();
    
    System.out.println("rol: " + rol);
    if (rol.equals("[Postulante]")) {
        response.sendRedirect("trabajos.htm");
    } else if (rol.equals("[Empresa]")) {
        response.sendRedirect("empresas.htm");
    } else if (rol.equals("[Reclutador]")) {
        response.sendRedirect("indexr.htm");
    } else if (rol.equals("[ROLE_ANONYMOUS]")) {
        response.sendRedirect("index.htm");
    }else{
        session.invalidate();
        response.sendRedirect("404.jsp");
    }
%>