package com.squeak.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mysql.jdbc.StringUtils;
import com.squeak.dao.StatusDAO;
import com.squeak.dao.UsuarioDAO;
import com.squeak.model.BD;
import com.squeak.model.Status;
import com.squeak.model.Usuario;

public class NovaContaController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static final Integer DEFAULT_USER_PERMISSION = 1;

	public NovaContaController() {
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("views/nova.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String page = null;

		try {

			if (StringUtils.isNullOrEmpty(request.getParameter("nome"))
					|| StringUtils.isNullOrEmpty(request.getParameter("email"))
					|| StringUtils.isNullOrEmpty(request.getParameter("senha"))
					|| StringUtils.isNullOrEmpty(request.getParameter("sexo"))
					|| StringUtils.isNullOrEmpty(request.getParameter("idade")))
				throw new Exception("Preencha todos os campos corretamente.");
			
			BD db = new BD("com.mysql.jdbc.Driver",	"jdbc:mysql://127.0.0.1:3306/squeak", "root", "root");
			
			UsuarioDAO usuarioDAO = new UsuarioDAO(db);
			
			StatusDAO statusDAO = new StatusDAO(db);
			Status status = statusDAO.buscaStatus(DEFAULT_USER_PERMISSION);
			
			Usuario u = new Usuario(null, request.getParameter("nome"), request.getParameter("senha"), request.getParameter("email"),
					request.getParameter("sexo").charAt(0), Integer.parseInt(request.getParameter("idade")), status);
			
			usuarioDAO.criar(u);
			
			usuarioDAO.fecharConexao();
			
			page = "login";

		} catch (Exception e) {
			request.getSession().setAttribute("erro", e.getMessage());
			page = "views/nova.jsp";
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}
}
