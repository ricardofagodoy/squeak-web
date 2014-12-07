<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" 
import="java.util.Date,com.squeak.model.Usuario" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Squeak</title>

<script src="js/jquery-2.1.0.min.js"></script>

<link rel="stylesheet"
	href="css/bootstrap.min.css">
<script
	src="js/bootstrap.min.js"></script>
	<script src="js/scriptGeral.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css"></link>

</head>
<body>

	<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">

		<div class="navbar-header" style="border-right: 1px solid #D2D2D2">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a style="font-weight: bold" class="navbar-brand" href="home">Squeak</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				
				<% if(session.getAttribute("usuario") == null) { %>
					<li><a href="novaconta">Nova conta <span class="sr-only">(current)</span></a></li>
					<li><a href="login">Fazer login</a></li>
				<% } %>
				
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li onclick="mostraComoFun()"><a href="#">Como funciona?</a></li>
				<li onclick="mostraSobre()"><a href="#">Sobre</a></li>
				
				<% if(session.getAttribute("usuario") != null) { %>
				<li>
					<a href="logout">Logout</a>
				</li>
				<% } %>
				
			</ul>
		</div>
	</div>
	</nav>
	
	     <div class="modal fade" id="msgsuc" tabindex="-1" role="dialog" aria-labelledby="msg" aria-hidden="true">
              <div class="modal-dialog modal-sm" style="text-align: center">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Sucesso!</h4>
                  </div>
                  <div class="modal-body">
                    <h3>Mensagem enviada com sucesso!</h3>
                  </div>
                  <div class="modal-footer">
                    <span style="width: 100%" type="button" class="btn btn-primary" data-dismiss="modal">OK</span>
                  </div>
                </div>
              </div>
            </div>
            
            	     <div class="modal fade" id="comofun" tabindex="-1" role="dialog" aria-labelledby="msg" aria-hidden="true">
              <div class="modal-dialog modal-sm" style="text-align: center">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Como funciona?</h4>
                  </div>
                  <div class="modal-body">
                    <h3>Basta criar sua conta ou se logar e já poderá enviar mensagens à timeline global :)</h3>
                  </div>
                  <div class="modal-footer">
                    <span style="width: 100%" type="button" class="btn btn-primary" data-dismiss="modal">OK</span>
                  </div>
                </div>
              </div>
            </div>
            
            	     <div class="modal fade" id="sobre" tabindex="-1" role="dialog" aria-labelledby="msg" aria-hidden="true">
              <div class="modal-dialog modal-sm" style="text-align: center">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Sobre</h4>
                  </div>
                  <div class="modal-body">
                    <h3>Squeak não é uma marca registrada - Desenvolvido para a matéria de PW do professor André :D</h3>
                  </div>
                  <div class="modal-footer">
                    <span style="width: 100%" type="button" class="btn btn-primary" data-dismiss="modal">OK</span>
                  </div>
                </div>
              </div>
            </div>
            
            