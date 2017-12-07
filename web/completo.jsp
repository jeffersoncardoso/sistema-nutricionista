<%@page import="java.util.Objects"%>
<%@page import="br.controller.ClienteControle"%>
<%@page import="br.modelo.Cliente"%>
<%@page import="br.modelo.ClienteDetalhe"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="_header.jsp">
  <jsp:param name="titulo" value="Complemente seus dados"/>
</jsp:include>
    <% 
        ClienteControle controle = new ClienteControle();
        controle.validarSessao(request, response);
        
        Cliente cliente = controle.buscarCliente(controle.getClienteLogado(request).getId());
        if(!(cliente.getDetalhes() instanceof ClienteDetalhe)){
            ClienteDetalhe detalhe = new ClienteDetalhe();
            cliente.setDetalhes(detalhe);
        }

        if("POST".equals(request.getMethod()))
        {
            controle.cadastrarDadosAdicionais(request, response);
        }
    %>
    <div class="container">
        <form id="form_completo" action="" method="POST">
            <div v-if="errors.any()" class="alert alert-danger">
                <ul> <li v-for="error in errors.all()">{{ error }}</li> </ul>
            </div>
            <div class="form-group row">
                <label for="sexo" class="col-sm-2 form-control-label">Sexo</label>
                <div class="col-sm-10">
                    <input type="text" v-model="sexo" class="form-control" v-validate="'required'" name="sexo" id="sexo">
                </div>
            </div>
            <div class="form-group row">
                <label for="peso" class="col-sm-2 form-control-label">Peso</label>
                <div class="col-sm-10">
                    <input type="text" v-model="peso" class="form-control" v-validate="'required'" name="peso" id="peso">
                </div>
            </div>
            <div class="form-group row">
                <label for="altura" class="col-sm-2 form-control-label">Altura</label>
                <div class="col-sm-10">
                    <input type="text" v-model="altura" v-validate="'required'" class="form-control" name="altura" id="altura">
                </div>
            </div>
            
            <div class="form-group row">
                <label for="gordura" class="col-sm-2 form-control-label">% de Gordura</label>
                <div class="col-sm-10">
                    <input type="text" v-model="gordura" v-validate="'required'" class="form-control" name="gordura" id="gordura">
                </div>
            </div>
            
            <div class="form-group row">
                <label for="habitos" class="col-sm-2 form-control-label">Quais são seus hábitos alimentares?</label>
                <div class="col-sm-10">
                    <textarea v-validate="'required'" v-model="habitos" class="form-control" name="habitos" id="habitos">
                    </textarea>
                </div>
            </div>
            
            <div class="form-group row">
                <label for="exercicio" class="col-sm-2 form-control-label">Você se exercita? Qual frequência?</label>
                <div class="col-sm-10">
                    <textarea v-validate="'required'" v-model="exercicio" class="form-control" name="exercicio" id="exercicio">
                    </textarea>
                </div>
            </div>
            
            <div class="form-group row">
                <label for="saude" class="col-sm-2 form-control-label">Você se possui algum problema de saúde?</label>
                <div class="col-sm-10">
                    <textarea v-validate="'required'" v-model="saude" class="form-control" name="saude" id="saude">
                    </textarea>
                </div>
            </div>
            
            <div class="form-group row text-right">
                <div class="col-sm-offset-2 col-sm-12">
                    <a href="dietas.jsp" class="btn btn-secondary">Voltar</a>
                    <button type="submit" v-bind:disabled="errors.any()" class="btn btn-primary">Cadastrar</button>
                </div>
            </div>
        </form>
    </div>
<%@include file="_footer.jsp" %>

<script>
    new Vue({
        el: "#form_completo",
        data: {
           sexo : "<%= Objects.toString(cliente.getDetalhes().getSexo(), "") %>",
           peso : "<%= Objects.toString(cliente.getDetalhes().getPeso(), "") %>",
           altura : "<%= Objects.toString(cliente.getDetalhes().getAltura(), "") %>",
           gordura : "<%= Objects.toString(cliente.getDetalhes().getGordura(), "") %>",
           habitos : "<%= Objects.toString(cliente.getDetalhes().getHabitos(), "") %>",
           exercicio : "<%= Objects.toString(cliente.getDetalhes().getExercicio(), "") %>",
           saude : "<%= Objects.toString(cliente.getDetalhes().getSaude(), "") %>"
        },
        methods: {
           onSubmit: function(){
               this.$validator.validateAll();
           }
       }
    });
</script>