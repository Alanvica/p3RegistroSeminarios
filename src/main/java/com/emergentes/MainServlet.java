package com.emergentes;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Villalba
 */
@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") != null ? request.getParameter("action") : "view";
        switch (action) {
            case "view":
                response.sendRedirect("index.jsp");
                break;
            case "nuevo":
                Seminario s = new Seminario();
                request.setAttribute("seminario", s);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "editar":
                int idEditar = Integer.parseInt(request.getParameter("id"));
                HttpSession sesion = request.getSession();
                List<Seminario> lista = (ArrayList<Seminario>) sesion.getAttribute("lista");
                Seminario semiedit = new Seminario();
                for (Seminario seminario : lista) {
                    if (seminario.getId() == idEditar) {
                        semiedit = seminario;
                        break;
                    }
                }
                request.setAttribute("seminario", semiedit);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                HttpSession sesion1 = request.getSession();
                List<Seminario> lista1 = (ArrayList<Seminario>) sesion1.getAttribute("lista");
                for (Seminario seminario : lista1) {
                    if (seminario.getId() == idEliminar) {
                        lista1.remove(seminario);
                        break;
                    }
                }
                response.sendRedirect("index.jsp");
                break;
            default:
                throw new AssertionError();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String fecha = request.getParameter("fecha");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String turno = request.getParameter("turno");
        String[] seminarios = new String[4];
        seminarios[0] = "";
        seminarios[1] = "";
        seminarios[2] = "";
        seminarios[3] = "";
        int i = 0;
        String s1 = request.getParameter("s1") != null ? request.getParameter("s1") : "";
        String s2 = request.getParameter("s2") != null ? request.getParameter("s2") : "";
        String s3 = request.getParameter("s3") != null ? request.getParameter("s3") : "";
        String s4 = request.getParameter("s4") != null ? request.getParameter("s4") : "";
        if (s1 != "") {
            seminarios[i] = s1;
            i++;
        }
        if (s2 != "") {
            seminarios[i] = s2;
            i++;
        }
        if (s3 != "") {
            seminarios[i] = s3;
            i++;
        }
        if (s4 != "") {
            seminarios[i] = s4;
            i++;
        }
        HttpSession ses = request.getSession();
        List<Seminario> lista = (ArrayList<Seminario>) ses.getAttribute("lista");

        if (id == 0) {
            Seminario sem = new Seminario();
            int idNuevo = getNewId(lista);
            sem.setId(idNuevo);
            sem.setFecha(fecha);
            sem.setNombre(nombre);
            sem.setApellido(apellido);
            sem.setTurno(turno);
            sem.setSeminarios(seminarios);

            lista.add(sem);
        } else {
            for (Seminario seminario : lista) {
                if (seminario.getId() == id) {
                    seminario.setFecha(fecha);
                    seminario.setNombre(nombre);
                    seminario.setApellido(apellido);
                    seminario.setTurno(turno);
                    seminario.setSeminarios(seminarios);
                    break;
                }
            }
        }
        response.sendRedirect("index.jsp");
    }

    private int getNewId(List<Seminario> lista) {
        int nuevoId = 1;
        for (Seminario seminario : lista) {
            if (seminario.getId() >= nuevoId) {
                nuevoId = seminario.getId() + 1;
            }
        }
        return nuevoId;
    }

}
