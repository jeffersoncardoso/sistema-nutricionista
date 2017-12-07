package br.controller;

import br.infrastructure.DietaDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import br.modelo.Nutricionista;
import br.modelo.Dieta;
import br.infrastructure.NutricionistaDAO;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;


public class NutricionistaControle {
    public boolean login(HttpServletRequest request)
    {
        NutricionistaDAO dao = new NutricionistaDAO();
        Nutricionista nutricionista = dao.buscarPorEmail(request.getParameter("email"));
        
        if(nutricionista != null && nutricionista.validarSenha(request.getParameter("senha")))
        {
            HttpSession session = request.getSession();
            session.setAttribute("privateAdmin", nutricionista);
            
            return true;
        }else{
            return false;
        }
    }
    
    public void validarSessao(HttpServletRequest request, HttpServletResponse response)
    {
        if(!this.estaLogado(request)) 
            try {
                response.sendRedirect("login-nutricionista.jsp");
        } catch (IOException ex) {
            
        }
    }
    
    public Nutricionista getNutricionistaLogado(HttpServletRequest request)
    {
        if(!estaLogado(request)) throw new RuntimeException("Não está logado");
        
        HttpSession session = request.getSession();
        Nutricionista privateAdmin = (Nutricionista)session.getAttribute("privateAdmin");
        return privateAdmin;
    }
    
    public boolean estaLogado(HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        Nutricionista privateAdmin = (Nutricionista)session.getAttribute("privateAdmin");
        return (privateAdmin instanceof Nutricionista);
    }
    
    public void cadastrarDieta(HttpServletRequest request, HttpServletResponse response)
    {
        try{
            DietaDAO dao = new DietaDAO();

            Dieta dieta = new Dieta();
            dieta.setSegunda(request.getParameter("segunda"));
            dieta.setTerca(request.getParameter("terca"));
            dieta.setQuarta(request.getParameter("quarta"));
            dieta.setQuinta(request.getParameter("quinta"));
            dieta.setSexta(request.getParameter("sexta"));
            dieta.setSabado(request.getParameter("sabado"));
            dieta.setDomingo(request.getParameter("domingo"));

            dao.cadastrar(dieta, 
                Integer.parseInt(request.getParameter("id")), 
                getNutricionistaLogado(request).getId()
            );

            response.sendRedirect("dietas-nutricionista.jsp");
        }catch(Exception ex){
            throw new RuntimeException(ex.getMessage());
        }
    }
}
