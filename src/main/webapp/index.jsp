<%-- 
    Document   : index
    Created on : 16 abr. 2024, 13:47:19
    Author     : Villalba
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.Seminario"%>
<%
    if (session.getAttribute("lista") == null) {
        // creando atributo lista en session
        ArrayList<Seminario> listaAux = new ArrayList<Seminario>();
        session.setAttribute("lista", listaAux);
    }
    List<Seminario> lista = (ArrayList<Seminario>) session.getAttribute("lista");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>LISTADO DE INSCRITOS</h1>
        <p><a href="MainServlet?action=nuevo">Nuevo</a></p>
        <table border="1" >
            <tr>
                <th>Id</th>
                <th>Fecha</th>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>Turno</th>
                <th>Seminarios</th>
                <th></th>
                <th></th>
            </tr>
            <%
                for (Seminario seminario : lista) {
            %>
            <tr>
                <td><%= seminario.getId()%></td>
                <td><%= seminario.getFecha()%></td>
                <td><%= seminario.getNombre()%></td>
                <td><%= seminario.getApellido()%></td>
                <td><%= seminario.getTurno()%></td>
                <td><%= seminario.toStringSeminarios()%></td>
                <td><a href="MainServlet?action=editar&id=<%= seminario.getId()%>">Editar</a></td>
                <td><a href="MainServlet?action=eliminar&id=<%= seminario.getId()%>">Eliminar</a></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
