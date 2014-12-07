<%@include file="includes/header.jsp"%>  

	<% session.setAttribute("erro", null); %>

	<div class="row">

		<div class="col-xs-3">

			<div class="panel panel-info">
		
					<% if(session.getAttribute("usuario") != null) { 
					
						Usuario u = (Usuario)session.getAttribute("usuario");
					%>
					
					<div class="panel-heading titulo">
						Informações da conta
					</div>
					
					<div class="panel-body">
					
						<p>
							<b>Nome:</b> <%=u.getNome()%>
						</p>
						
						<p>
							<b>Email:</b> <%=u.getEmail()%>
						</p>
						
						<p>
							<b>Sexo:</b> <%=u.getSexo()%>
						</p>
						
						<p>
							<b>Idade:</b> <%=u.getIdade()%>
						</p>
						
						<p>
							<b>Permissão:</b> <%=u.getStatus()%>
						</p>
						
					<% } else {
						
					%>	
						
					<div class="panel-heading titulo">
						Crie sua conta já!
					</div>
					
					<div class="panel-body">
					
					<button onclick="document.location.href = 'novaconta';" style="width: 100%" 
							type="button" class="btn btn-lg btn-info">
						<p class="titulo">Crie sua conta!</p>
					</button>
						
					<% } %>
					
				</div>
			</div>
		</div>

		<div class="col-xs-8 col-xs-offset-0">

			<div class="panel panel-info">

				<div class="panel-heading titulo">Olá, 
				
				<% if (session.getAttribute("usuario") != null) { 
					out.println(((Usuario)session.getAttribute("usuario")).getNome());
				   } else { %>
					visitante!
				<% } %>
				
				</div>

				<div class="panel-body">
				
					<% if(session.getAttribute("usuario") == null) { 
					
						Usuario u = (Usuario)session.getAttribute("usuario");
					%>

					<img id="logosqueak" src="images/squeak-logo.jpg" class="centered" />

					<p class="texto">

						Esse é o <b>Squeak</b>, um site onde pessoas legais se encontram
						para trocar ideias, conhecimento e se divertir bastante também!
					</p>

					<p class="texto">

						Notamos que você não está logado em sua conta... <br /> <br />

						Está esperando o quê? Logue-se agora mesmo ou crie sua conta para
						fazer parte você também dessa rede que é a cara do <strike>Twitter</strike>
						povo brasileiro! <br />
						<br />

						<button onclick="document.location.href = 'login';" style="width: 100%" type="button"
							class="btn btn-lg btn-success">
							<p class="titulo">Fazer login</p>
						</button>

					</p>
						
					<% } else {
						
					%>
	
					<p class="texto">
						O que gostaria de dizer?
						
						<br/>
						
						<textarea maxlength="60" id="textoMensagem" rows="5" cols="40">
						</textarea>
					</p>		
					
					<button id="enviarMensagem" style="width: 30%" type="button"
							class="btn btn-lg btn-success">
							<i class="texto">Enviar mensagem</i>
						</button>	
						
					<br/>
					
					<p class="titulo" style="margin-top: 2%">
						Mensagens globais
					</p>	
					
					<p class="texto">(as mensagens são atualizadas automaticamente a cada 3 segundos)</p>
					
					<br/>		
					
					<table id="msgs" align="center" 
						   style="text-align: center; border: 1px solid #000000; padding: 10px;" 
					       width="90%" border="0" class="table table-condensed table-striped table-bordered table-hover no-margin"> 
					
						<tr>
							<th style="text-align: center">Horário</th>
							<th style="text-align: center">Texto</th>
							<th style="text-align: center">Autor</th>
						</tr>
					</table>
					
					<% } %>

				</div>


				<div class="panel-footer footer">Squeak Social - Desenvolvido
					por Ricardo Godoy e Lucas Quadrado</div>
			</div>

		</div>
	</div>
	
<script src="js/script.js"></script>
<%@include file="includes/footer.jsp"%>  
