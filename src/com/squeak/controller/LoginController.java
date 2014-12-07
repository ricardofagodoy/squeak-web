package com.squeak.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.squeak.dao.UsuarioDAO;
import com.squeak.model.BD;
import com.squeak.model.Usuario;

public class LoginController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public LoginController() {
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("views/login.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String nome = request.getParameter("nome"), senha = request
				.getParameter("senha");

		try {

			if (nome == null || senha == null)
				throw new Exception("Nome ou senha invalidos!");

			UsuarioDAO usuarioDAO = new UsuarioDAO(new BD(
					"com.mysql.jdbc.Driver",
					"jdbc:mysql://127.0.0.1:3306/squeak", "root", "root"));

			Usuario u = usuarioDAO.procuraUsuario(nome, senha);

			usuarioDAO.fecharConexao();

			if (u == null)
				throw new Exception("Nome ou senha invalidos!");

			if (u.getStatus() != null && u.getStatus().getId().equals(2))
				throw new Exception("Usuario bloqueado!");

			request.getSession().setAttribute("usuario", u);

			response.sendRedirect("home");

		} catch (Exception e) {
			request.getSession().setAttribute("erro", e.getMessage());

			RequestDispatcher rd = request
					.getRequestDispatcher("views/login.jsp");
			
			rd.forward(request, response);
		}
	}
}
