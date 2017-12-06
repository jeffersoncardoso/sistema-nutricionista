<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="_header.jsp">
  <jsp:param name="titulo" value="Preencha seus dados"/>
</jsp:include>

    <div class="container">
        <form id="form_completo" action="dietas.jsp" method="POST">
            <div v-if="errors.any()" class="alert alert-danger">
                <ul> <li v-for="error in errors.all()">{{ error }}</li> </ul>
            </div>
            <div class="form-group row">
                <label for="sexo" class="col-sm-2 form-control-label">Sexo</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" v-validate="'required'" name="sexo" id="sexo">
                </div>
            </div>
            <div class="form-group row">
                <label for="peso" class="col-sm-2 form-control-label">Peso</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" v-validate="'required'" name="peso" id="peso">
                </div>
            </div>
            <div class="form-group row">
                <label for="altura" class="col-sm-2 form-control-label">Altura</label>
                <div class="col-sm-10">
                    <input type="text" v-validate="'required'" class="form-control" name="altura" id="altura">
                </div>
            </div>
            
            <div class="form-group row">
                <label for="gordura" class="col-sm-2 form-control-label">% de Gordura</label>
                <div class="col-sm-10">
                    <input type="text" v-validate="'required'" class="form-control" name="gordura" id="gordura">
                </div>
            </div>
            
            <div class="form-group row">
                <label for="habitos" class="col-sm-2 form-control-label">Quais são seus hábitos alimentares?</label>
                <div class="col-sm-10">
                    <textarea v-validate="'required'" class="form-control" name="habitos" id="habitos">
                    </textarea>
                </div>
            </div>
            
            <div class="form-group row">
                <label for="exercicio" class="col-sm-2 form-control-label">Você se exercita? Qual frequência?</label>
                <div class="col-sm-10">
                    <textarea v-validate="'required'" class="form-control" name="exercicio" id="exercicio">
                    </textarea>
                </div>
            </div>
            
            <div class="form-group row">
                <label for="saude" class="col-sm-2 form-control-label">Você se possui algum problema de saúde?</label>
                <div class="col-sm-10">
                    <textarea v-validate="'required'" class="form-control" name="saude" id="saude">
                    </textarea>
                </div>
            </div>
            
            <div class="form-group row text-right">
                <div class="col-sm-offset-2 col-sm-12">
                    <a href="./" class="btn btn-secondary">Voltar</a>
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
           
       }
    });
</script>