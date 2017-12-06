<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="_header.jsp">
    <jsp:param name="titulo" value="Clientes"/>
</jsp:include>

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
            <tr>
              <th scope="row">1</th>
              <td>Jefferson</td>
              <td width="15%">22</td>
              <td width="6%">
                  <div class="row">
                    <div class="col-md-6"><a href="#" data-toggle="modal" data-target="#modal_evolucao"><i class="fa fa-pencil-square-o"></i></a></div>
                    <div class="col-md-6"><a href="#" data-toggle="modal" data-target="#modal_dieta"><i class="fa fa-bar-chart"></i></a></div>
                  </div>
              </td>
            </tr>
        </tbody>
    </table>
</div>

<!-- Modal -->
<div class="modal fade" id="modal_dieta" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg " role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<%@include file="_footer.jsp" %>