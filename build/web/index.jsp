<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="_header.jsp">
  <jsp:param name="titulo" value="Receba dietas semanalmente"/>
</jsp:include>

<div class="container">
    <div class="row">
        <div class="col-md-12 text-center">
            <a href="cadastre-se.jsp" class="btn btn-info btn-lg" role="button" aria-pressed="true">Quero me cadastrar</a>
            <a href="login.jsp" class="btn btn-success btn-lg" role="button" aria-pressed="true">Já sou cadastrado</a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 text-right">
            <a href="login-nutricionista.jsp" class="btn btn-light btn-outline-secondary btn-sm" role="button" aria-pressed="true">Sou nutricionista</a>
        </div>
    </div>
</div>

<%@include file="_footer.jsp" %>