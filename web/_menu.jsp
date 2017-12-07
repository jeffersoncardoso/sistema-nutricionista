<%@page import="br.controller.ClienteControle"%>
<%@page import="br.controller.NutricionistaControle"%>
<%
    ClienteControle cliControle = new ClienteControle();
    NutricionistaControle nutriControle = new NutricionistaControle();
%>

<%
    if(cliControle.estaLogado(request) || nutriControle.estaLogado(request)){
%>
        <nav class="navbar navbar-expand-md navbar-light bg-faded">
          <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <a class="navbar-brand" href="./">Sistema de Nutrição</a>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
            </ul>
          </div>
            <ul class="navbar-nav mr-auto">
                <li>
                    <a class="nav-link" href="sair.jsp">Sair</a>
                </li>
            </ul>
        </nav>
<%
    }
%>