<%@page import="br.modelo.Dieta"%>
<%@page import="br.controller.ClienteControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="_header.jsp">
    <jsp:param name="titulo" value="Sua Dieta"/>
</jsp:include>

<%
   ClienteControle controle = new ClienteControle();
   controle.validarSessao(request, response);
   
   Dieta dieta = controle.buscarDieta(request);
%>

<div class="container">
    <div class="alert alert-warning text-center">
        Clique <a href="completo.jsp">aqui</a> para atualizar seus dados
    </div>
</div>

<% if(dieta == null) { %>
<div class="container">
    <div class="alert alert-success text-center">
        Seus dados foram cadastrados. Em breve estará sua dieta estará disponível.
    </div>
</div>
<% }else{ %>
<div class="container">
    <fieldset>
        <legend>Essa é a sua dieta</legend>
        <div id="accordion" role="tablist" aria-multiselectable="true">
            <div class="card">
                <div class="card-header" role="tab" id="dia_segunda">
                    <h5 class="mb-0">
                        <a data-toggle="collapse" data-parent="#accordion" href="#segunda" aria-expanded="true" aria-controls="collapseOne">
                          Segunda-feira
                        </a>
                    </h5>
                </div>
                <div id="segunda" class="collapse hide" role="tabpanel" aria-labelledby="dia_segunda">
                    <div class="card-block" style="padding:1em">
                        <%= dieta.getSegunda() %>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" role="tab" id="dia_terca">
                    <h5 class="mb-0">
                        <a data-toggle="collapse" data-parent="#accordion" href="#terca" aria-expanded="true" aria-controls="collapseOne">
                          Terça-feira
                        </a>
                    </h5>
                </div>
                <div id="terca" class="collapse hide" role="tabpanel" aria-labelledby="dia_terca">
                    <div class="card-block" style="padding:1em">
                        <%= dieta.getTerca() %>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" role="tab" id="dia_quarta">
                    <h5 class="mb-0">
                        <a data-toggle="collapse" data-parent="#accordion" href="#quarta" aria-expanded="true" aria-controls="collapseOne">
                          Quarta-feira
                        </a>
                    </h5>
                </div>
                <div id="quarta" class="collapse hide" role="tabpanel" aria-labelledby="dia_quarta">
                    <div class="card-block" style="padding:1em">
                        <%= dieta.getQuarta() %>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" role="tab" id="dia_quinta">
                    <h5 class="mb-0">
                        <a data-toggle="collapse" data-parent="#accordion" href="#quinta" aria-expanded="true" aria-controls="collapseOne">
                          Quinta-feira
                        </a>
                    </h5>
                </div>
                <div id="quinta" class="collapse hide" role="tabpanel" aria-labelledby="dia_quinta">
                    <div class="card-block" style="padding:1em">
                        <%= dieta.getQuinta() %>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" role="tab" id="dia_sexta">
                    <h5 class="mb-0">
                        <a data-toggle="collapse" data-parent="#accordion" href="#sexta" aria-expanded="true" aria-controls="collapseOne">
                          Sexta-feira
                        </a>
                    </h5>
                </div>
                <div id="sexta" class="collapse hide" role="tabpanel" aria-labelledby="dia_sexta">
                    <div class="card-block" style="padding:1em">
                        <%= dieta.getSexta() %>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" role="tab" id="dia_sabado">
                    <h5 class="mb-0">
                        <a data-toggle="collapse" data-parent="#accordion" href="#sabado" aria-expanded="true" aria-controls="collapseOne">
                          Sábado
                        </a>
                    </h5>
                </div>
                <div id="sabado" class="collapse hide" role="tabpanel" aria-labelledby="dia_sabado">
                    <div class="card-block" style="padding:1em">
                        <%= dieta.getSabado()%>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header" role="tab" id="dia_domingo">
                    <h5 class="mb-0">
                        <a data-toggle="collapse" data-parent="#accordion" href="#domingo" aria-expanded="true" aria-controls="collapseOne">
                          Domingo
                        </a>
                    </h5>
                </div>
                <div id="domingo" class="collapse hide" role="tabpanel" aria-labelledby="dia_domingo">
                    <div class="card-block" style="padding:1em">
                        <%= dieta.getDomingo() %>
                    </div>
                </div>
            </div>
        </div>
    </fieldset>
</div>
<% }%>

<%@include file="_footer.jsp" %>