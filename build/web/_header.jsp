<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>JSP Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <script src="https://use.fontawesome.com/b0fdf7917f.js"></script>
    </head>
    <body>
        <jsp:include page="_menu.jsp"></jsp:include>
        <div class="jumbotron">
            <h1 class='text-center'><%= request.getParameter("titulo") %></h1>
        </div>
        
        <% String error = (String)request.getSession().getAttribute("error"); 
        if(error != null){ %>
            <div class="container">
                <div class="alert alert-danger"><%= request.getSession().getAttribute("error") %></div>
            </div>
        <% } %>