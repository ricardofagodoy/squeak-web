<%@include file="includes/header.jsp"%>

<div class="row">

	<div class="col-xs-5 col-xs-offset-3">

		<div class="panel panel-success">

			<div class="panel-heading titulo">Novo por aqui?</div>

			<div class="row">
				<div class="col-xs-6 col-xs-offset-3">

					<div class="panel-body">

						<p class="titulo">Cadastre-se</p>
						
						<% if(session.getAttribute("erro")!= null) { %>
			
						<br/>
						
						<div class="alert alert-danger" role="alert">
							<a class="alert-link"><%=(String)session.getAttribute("erro") %></a>
						</div>
						<% } %>

						<br />

						<form name="formNova" action="novaconta" method="post">

							<p class="texto">

								Nome: <br /> <input type="text" name="nome" id="nome"></input>

								<br />
								<br /> 
							
								Email: <br /> <input type="email" name="email" id="email"></input> 
								
								<br />
								<br /> 
							
								Senha: <br /> <input type="password" name="senha" id="senha"></input> 
								
								<br />
								<br /> 
							
								Sexo: <br /> 
								
								<select name="sexo">
									<option value="M">Masculino</option>
									<option value="F">Feminino</option>
								</select>
								<br />
								<br /> 
							
								Idade: <br /> <input type="number" name="idade" id="idade"></input> 
								
								<br /> 
								<br />

								<button onclick="document.formNova.submit()" style="width: 100%" type="button"
									class="btn btn-lg btn-success">Criar conta</button>

							</p>

						</form>

						<br />

					</div>

				</div>
			</div>

			<div class="panel-footer footer">Squeak Social - Desenvolvido
				por Ricardo Godoy e Lucas Quadrado</div>
		</div>

	</div>
</div>

<%@include file="includes/footer.jsp"%>
