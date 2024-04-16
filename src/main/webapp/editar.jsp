<%-- 
    Document   : editar
    Created on : 16 abr. 2024, 14:40:01
    Author     : Villalba
--%>
<%@page import="com.emergentes.Seminario"%>
<%
    Seminario sem = (Seminario) request.getAttribute("seminario");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>

    <body>
        <h1>REGISTRO EN SEMINARIOS</h1>
        <form action="MainServlet" method="post">
            <input type="hidden" name="id" value="<%= sem.getId()%>">
            <table border="1" >
                <tr>
                    <th>Datos</th>
                    <th>Seminarios</th>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td>Fecha: </td>
                                <td><input type="date" name="fecha" value="<%= sem.getFecha()%>"></td>
                            </tr>
                            <tr>
                                <td>Nombre: </td>
                                <td><input type="text" name="nombre" value="<%= sem.getNombre()%>"></td>
                            </tr>
                            <tr>
                                <td>Apellido</td>
                                <td><input type="text" name="apellido" value="<%= sem.getApellido()%>"></td>
                            </tr>
                            <tr>
                                <td>Turno: </td>
                                <td>
                                    <input type="radio" name="turno" value="Manana"><label>Mañana</label><input type="radio" name="turno" value="Tarde"><label>Tarde</label><input type="radio" name="turno" value="Noche"><label>Noche</label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td><p><input type="checkbox" name="s1" id="Inteligencia Artificial" value="Inteligencia Artificial">Inteligencia Artificial</p><p><input type="checkbox" name="s2" id="Machine Learning" value="Machine Learning">Machine Learning<p><input type="checkbox" name="s3" id="Simulacion con Arena" value="Simulacion con Arena">Simulacion con Arena</p></p><p><input type="checkbox" name="s4" id="Robotica Educativa" value="Robotica Educativa">Robotica Educativa</p></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <p><input type="submit" value="Enviar registro"></p>
        </form>
        <script>
            document.querySelector('input[name="turno"][value="<%=sem.getTurno()%>"]').checked = true;
            document.getElementById('<%=sem.getSeminarios()[0]%>').checked=true;
            document.getElementById('<%=sem.getSeminarios()[1]%>').checked=true;
            document.getElementById('<%=sem.getSeminarios()[2]%>').checked=true;
            document.getElementById('<%=sem.getSeminarios()[3]%>').checked=true;
        </script>
    </body>
</html>
