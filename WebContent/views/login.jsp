<%@include file="includes/header.jsp"%>

<div class="row">

	<div class="col-xs-5 col-xs-offset-3">

		<div class="panel panel-success">

			<div class="panel-heading titulo">Faça seu login!</div>
			
			<% if(session.getAttribute("erro")!= null) { %>
			
			<br/>
			
			<div class="alert alert-danger" role="alert">
				<a class="alert-link"><%=(String)session.getAttribute("erro") %></a>
			</div>
			<% } %>

			<div class="row">
				<div class="col-xs-6 col-xs-offset-3">

					<div class="panel-body">

						<p class="titulo">Login</p>

						<br />

						<form name="loginForm" action="login" method="post">

							<p class="texto">

								Nome: <br /> <input type="text" name="nome" id="nome"></input>

								<br />
								<br /> Senha: <br /> <input type="password" name="senha"
									id="senha"></input> <br /> <br />

								<button onclick="document.loginForm.submit()" style="width: 100%" type="button"
									class="btn btn-lg btn-success">Login</button>

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
