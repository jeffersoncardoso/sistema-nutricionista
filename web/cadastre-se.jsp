<%@page import="br.controller.ClienteControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="_header.jsp">
  <jsp:param name="titulo" value="Cadastre seus dados"/>
</jsp:include>

<%
    boolean isPost = "POST".equals(request.getMethod());
    if(isPost)
    {
        ClienteControle controle = new ClienteControle();
        controle.cadastrar(request, response);
    }
%>

    <div class="container">
        <form id="form-cadastre-se" method="POST" action="">
            <div v-if="senhasNaoConferem" class="alert alert-danger">
                As senhas não conferem
            </div>
            <div v-if="errors.any()" class="alert alert-danger">
                <ul> <li v-for="error in errors.all()">{{ error }}</li> </ul>
            </div>

            <div class="form-group row">
                <label for="nome" class="col-sm-2 form-control-label">Nome Completo</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" v-validate="'required'" name="nome" id="nome">
                </div>
            </div>
            <div class="form-group row">
                <label for="cpf" class="col-sm-2 form-control-label">CPF</label>
                <div class="col-sm-10">
                    <input type="text" v-mask="['###.###.###-##']" v-validate="'required'" class="form-control" name="cpf" id="cpf">
                </div>
            </div>
            <div class="form-group row">
                <label for="email" class="col-sm-2 form-control-label">Email</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" name="email" v-validate="'required'" id="email">
                </div>
            </div>
            <div class="form-group row">
                <label for="nascimento" class="col-sm-2 form-control-label">Data de Nascimento</label>
                <div class="col-sm-10">
                    <input type="date" class="form-control" v-validate="'required'" name="nascimento" id="nascimento">
                </div>
            </div>
            <div class="form-group row">
                <label for="senha" class="col-sm-2 form-control-label">Senha</label>
                <div class="col-sm-10">
                    <input type="password" v-model="senha" v-validate="'required'" class="form-control" name="senha" id="senha">
                           
                </div>
            </div>
            <div class="form-group row">
                <label for="senha" class="col-sm-2 form-control-label">Confirmar Senha</label>
                <div class="col-sm-10">
                    <input type="password" v-model="confirmacaoSenha" class="form-control" name="senha" id="senha">
                </div>
            </div>
            <div class="form-group row text-right">
                <div class="col-sm-offset-2 col-sm-12">
                    <a href="./" class="btn btn-secondary">Voltar</a>
                    <button type="submit" @click='onSubmit()' v-bind:disabled="errors.any()" class="btn btn-primary">Cadastrar</button>
                </div>
            </div>
        </form>
    </div>
<%@include file="_footer.jsp" %>

<script>
    new Vue({
        el: "#form-cadastre-se",
        data: {
           senha : '',
           confirmacaoSenha: ''
        },
        computed: {
           senhasNaoConferem: function(){
               return this.senha != this.confirmacaoSenha;
           },
        },
        methods: {
           onSubmit: function(){
               this.$validator.validateAll();
           }
       }
    });
</script>