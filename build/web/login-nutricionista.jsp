<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="_header.jsp">
  <jsp:param name="titulo" value="Bem vindo nutricionista"/>
</jsp:include>

<div class="container">
    <form id="form-login" action="dietas-nutricionista.jsp" method="POST">
        <div v-if="errors.any()" class="alert alert-danger">
            <ul> <li v-for="error in errors.all()">{{ error }}</li> </ul>
        </div>
        <div class="form-group row">
            <label for="email" class="col-sm-2 form-control-label">Email</label>
            <div class="col-sm-10">
                <input type="email" class="form-control" name="email" id="email">
            </div>
        </div>
        <div class="form-group row">
            <label for="senha" class="col-sm-2 form-control-label">Senha</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" name="senha" id="senha">
            </div>
        </div>
        <div class="form-group row text-right">
            <div class="col-sm-offset-2 col-sm-12">
                <a href="./" class="btn btn-secondary">Voltar</a>
                <button type="submit" v-bind:disabled="errors.any()" class="btn btn-primary">Login</button>
            </div>
        </div>
    </form>
</div>

<%@include file="_footer.jsp" %>

<script>
    new Vue({
       el: "#form-login",
       data: {
           
       }
    });
</script>