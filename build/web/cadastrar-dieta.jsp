<%@page import="br.controller.NutricionistaControle"%>
<%@page import="br.controller.ClienteControle"%>
<%@page import="br.modelo.Cliente"%>
<%@page import="br.modelo.ClienteDetalhe"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    ClienteControle clienteControle = new ClienteControle();
    Cliente cliente = clienteControle.buscarCliente(Integer.parseInt(request.getParameter("id")));
    
    if("POST".equals(request.getMethod()))
    {
        NutricionistaControle nutricionistaControle = new NutricionistaControle();
        nutricionistaControle.cadastrarDieta(request, response);
    }
%>

<jsp:include page="_header.jsp">
    <jsp:param name="titulo" value='<%= "Cadastrar dieta para " + cliente.getNome() %>'/>
</jsp:include>

<div class="container">
    <fieldset>
        <div class="row">
            <div class="col-md-2">
                <p><strong>Idade:</strong> <%= cliente.getIdade() %></p>
            </div>
            <div class="col-md-2">
                <p><strong>Sexo:</strong> <%= cliente.getDetalhes().getSexo() %></p>
            </div>
            <div class="col-md-2">
                <p><strong>Peso:</strong> <%= cliente.getDetalhes().getPeso() %></p>
            </div>
            <div class="col-md-2">
                <p><strong>Altura:</strong> <%= cliente.getDetalhes().getAltura() %></p>
            </div>
            <div class="col-md-3">
                <p><strong>% de Gordura:</strong> <%= cliente.getDetalhes().getGordura() %></p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <p><strong>Hábitos alimentares: </strong> <%= cliente.getDetalhes().getHabitos()%></p>
            </div>
            <div class="col-md-12">
                <p><strong>Frequencia de exercicios: </strong> <%= cliente.getDetalhes().getExercicio()%></p>
            </div>
            <div class="col-md-12">
                <p><strong>Problemas de Saúde: </strong> <%= cliente.getDetalhes().getSaude()%></p>
            </div>
        </div>
        
        <hr>
        
        <form method="POST" action="">
        
            <div class="form-group row">
                <label for="segunda" class="col-sm-2 form-control-label"><strong>Segunda</strong></label>
                <div class="col-sm-10">
                    <textarea name="segunda" class="form-control"></textarea>
                </div>
            </div>
            <div class="form-group row">
                <label for="terca" class="col-sm-2 form-control-label"><strong>Terça</strong></label>
                <div class="col-sm-10">
                    <textarea name="terca" class="form-control"></textarea>
                </div>
            </div>
            <div class="form-group row">
                <label for="quarta" class="col-sm-2 form-control-label"><strong>Quarta</strong></label>
                <div class="col-sm-10">
                    <textarea name="quarta" class="form-control"></textarea>
                </div>
            </div>
            <div class="form-group row">
                <label for="quinta" class="col-sm-2 form-control-label"><strong>Quinta</strong></label>
                <div class="col-sm-10">
                    <textarea name="quinta" class="form-control"></textarea>
                </div>
            </div>
            <div class="form-group row">
                <label for="sexta" class="col-sm-2 form-control-label"><strong>Sexta</strong></label>
                <div class="col-sm-10">
                    <textarea name="sexta" class="form-control"></textarea>
                </div>
            </div>
            <div class="form-group row">
                <label for="sabado" class="col-sm-2 form-control-label"><strong>Sábado</strong></label>
                <div class="col-sm-10">
                    <textarea name="sabado" class="form-control"></textarea>
                </div>
            </div>
            <div class="form-group row">
                <label for="domingo" class="col-sm-2 form-control-label"><strong>Domingo</strong></label>
                <div class="col-sm-10">
                    <textarea name="domingo" class="form-control"></textarea>
                </div>
            </div>

            <div class="form-group row text-right">
                <div class="col-sm-offset-2 col-sm-12">
                    <a href="dietas-nutricionista.jsp" class="btn btn-secondary">Voltar</a>
                    <button type="submit" class="btn btn-primary">Cadastrar</button>
                </div>
            </div>
        </form>
    </fieldset>
</div>

<%@include file="_footer.jsp" %>