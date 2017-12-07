<%@page import="br.controller.NutricionistaControle"%>
<%@page import="br.controller.ClienteControle"%>
<%@page import="br.modelo.Cliente"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="_header.jsp">
    <jsp:param name="titulo" value="Clientes"/>
</jsp:include>

<%
    ClienteControle controle = new ClienteControle();
    new NutricionistaControle().validarSessao(request, response);
%>

<div class="container">
    <table class="table">
        <thead>
            <tr>
              <th>#</th>
              <th>Nome</th>
              <th>Email</th>
              <th>Idade</th>
              <th>Dieta</th>
            </tr>
        </thead>
        <tbody>
            <%
            for (Cliente cliente : controle.buscarClientes()) {
            %>
                <tr>
                    <td scope="row"><%= cliente.getId() %></td>
                    <td><%= cliente.getNome() %></td>
                    <td><%= cliente.getEmail() %></td>
                    <td width="15%"><%= cliente.getIdade() %></td>
                    <td width="12%">
                      <div class="row">
                        <div class="col-md-4">
                            <a href="<%= "cadastrar-dieta.jsp?id=" + cliente.getId() %>">
                                <i class="fa fa-pencil-square-o" data-toggle="tooltip" title="Cadastrar Dieta"></i>
                            </a>
                        </div>
                      </div>
                    </td>
                </tr>
                
            <%  
            }
            %>
            
        </tbody>
    </table>
</div>

<%@include file="_footer.jsp" %>