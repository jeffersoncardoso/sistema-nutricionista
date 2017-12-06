<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="_header.jsp">
    <jsp:param name="titulo" value="Sua Dieta"/>
</jsp:include>

<div class="container">
    <div class="alert alert-warning text-center">
        Clique <a href="completo.jsp">aqui</a> para atualizar seus dados e receber sua dieta.
    </div>
</div>

<div class="container">
    <div class="alert alert-success text-center">
        Seus dados foram cadastrados. Em breve estará sua dieta estará disponível.
    </div>
</div>

<div class="container">
    <div class="alert alert-info text-center">
        Dieta de 04/12/2017 até 15/12/2017.
    </div>
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
                    1 copo de Leite desnatado<br>
                    1 colher (sobremesa) rasa de Achocolatado em pó<br>
                    3 unidades de Torrada integral<br>
                    1,5 colheres (sopa) de Margarina
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
                    1 copo de Leite desnatado<br>
                    1 colher (sobremesa) rasa de Achocolatado em pó<br>
                    3 unidades de Torrada integral<br>
                    1,5 colheres (sopa) de Margarina
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="_footer.jsp" %>