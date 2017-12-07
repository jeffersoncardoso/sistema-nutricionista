package br.controller;

import java.util.ArrayList;
import br.modelo.Cliente;
import br.modelo.Dieta;
import br.infrastructure.ClienteDAO;
import br.infrastructure.DietaDAO;
import br.modelo.ClienteDetalhe;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ClienteControle {
    
    public void cadastrar(HttpServletRequest request, HttpServletResponse response)
    {
        try{
            ClienteDAO dao = new ClienteDAO();
            Cliente cliente = new Cliente();
            cliente.setNome(request.getParameter("nome"));
            cliente.setCpf(request.getParameter("cpf"));
            cliente.setEmail(request.getParameter("email"));
            cliente.setDataNascimento(Date.valueOf(request.getParameter("nascimento")));
            cliente.setSenha(request.getParameter("senha"));

            dao.cadastrar(cliente);
            
            response.sendRedirect("completo.jsp");
        }catch(Exception ex){
            HttpSession session = request.getSession();
            session.setAttribute("error", ex.getMessage());
        }
    }
    
    public void cadastrarDadosAdicionais(HttpServletRequest request, HttpServletResponse response)
    {
        try{
            ClienteDAO dao = new ClienteDAO();
            ClienteDetalhe cliente = new ClienteDetalhe();
            cliente.setSexo(request.getParameter("sexo"));
            cliente.setPeso(Float.parseFloat(request.getParameter("peso")));
            cliente.setAltura(Float.parseFloat(request.getParameter("altura")));
            cliente.setGordura(Float.parseFloat(request.getParameter("gordura")));
            cliente.setHabitos(request.getParameter("habitos"));
            cliente.setExercicio(request.getParameter("exercicio"));
            cliente.setSaude(request.getParameter("saude"));

            dao.cadastrarDadosAdicionais(getClienteLogado(request).getId(), cliente);
            
            response.sendRedirect("dietas.jsp");
        }catch(Exception ex){
            HttpSession session = request.getSession();
            session.setAttribute("error", ex.getMessage());
        }
    }
    
    public Dieta buscarDieta(HttpServletRequest request)
    {
        DietaDAO dao = new DietaDAO();
        return dao.buscarUltimaDieta(this.getClienteLogado(request));
    }
    
    public boolean login(HttpServletRequest request)
    {
        ClienteDAO dao = new ClienteDAO();
        Cliente cliente = dao.buscarPorEmail(request.getParameter("email"));
        
        if(cliente != null && cliente.validarSenha(request.getParameter("senha")))
        {
            HttpSession session = request.getSession();
            session.setAttribute("privateUser", cliente);
            
            return true;
        }else{
            return false;
        }
    }
    
    public void validarSessao(HttpServletRequest request, HttpServletResponse response)
    {
        if(!this.estaLogado(request)){ 
            try {
                response.sendRedirect("login.jsp");
            } catch (IOException ex) {
                HttpSession session = request.getSession();
                session.setAttribute("error", ex.getMessage());
            }
        }
    }
    
    public Cliente getClienteLogado(HttpServletRequest request)
    {
        if(!estaLogado(request)) throw new RuntimeException("Não está logado");
        
        HttpSession session = request.getSession();
        Cliente privateUser = (Cliente)session.getAttribute("privateUser");
        return privateUser;
    }
    
    public boolean estaLogado(HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        Cliente privateUser = (Cliente)session.getAttribute("privateUser");
        return (privateUser instanceof Cliente);
    }
    
    public ArrayList<Cliente> buscarClientes()
    {
        ClienteDAO dao = new ClienteDAO();
        ArrayList<Cliente> clientes = dao.listar();
        
        return clientes;
    }
    
    public Cliente buscarCliente(Integer id)
    {
        ClienteDAO dao = new ClienteDAO();
        Cliente cliente = dao.buscarPorId(id);
        cliente.setDetalhes(dao.buscarDadosAdicionais(cliente));
        
        return cliente;
    }
    
}
