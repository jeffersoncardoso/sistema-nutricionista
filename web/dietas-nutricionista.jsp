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
                    <td width="15%"><%= cliente.getIdade() %></td>
                    <td width="12%">
                      <div class="row">
                        <!--<div class="col-md-4"><a href="#" data-toggle="modal" data-target="#modal_info"><i class="fa fa-info"></i></a></div>-->
                        <div class="col-md-4"><a href="<%= "cadastrar-dieta.jsp?id=" + cliente.getId() %>"><i class="fa fa-pencil-square-o"></i></a></div>
                        <!--<div class="col-md-4"><a href="#" data-toggle="modal" data-target="#modal_dieta"><i class="fa fa-bar-chart"></i></a></div>-->
                      </div>
                    </td>
                </tr>
                
            <%  
            }
            %>
            
        </tbody>
    </table>
</div>

<div class="modal fade" id="modal_info" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg " role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Informações</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="modal_evolucao" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg " role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Relatório de Evolução</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="modal_dieta" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg " role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Cadastrar Dieta</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<%@include file="_footer.jsp" %>