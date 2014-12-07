package com.squeak.controller;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.codehaus.jackson.map.ObjectMapper;
import com.squeak.dao.MensagemDAO;
import com.squeak.model.BD;
import com.squeak.model.Mensagem;
import com.squeak.model.Usuario;

public class MensagemController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public MensagemController() {
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String resp = null;

		try {
			MensagemDAO mensagemDAO = new MensagemDAO(new BD(
					"com.mysql.jdbc.Driver",
					"jdbc:mysql://127.0.0.1:3306/squeak", "root", "root"));

			List<Mensagem> mensagens = mensagemDAO.buscaMensagens();

			mensagemDAO.fecharConexao();

			if (mensagens == null || mensagens.size() <= 0)
				throw new Exception("Sem mensagens!");

			final OutputStream out = new ByteArrayOutputStream();

			ObjectMapper mapper = new ObjectMapper();
			mapper.writeValue(out, mensagens);

			resp = out.toString();

		} catch (Exception e) {
			resp = e.getMessage();
		}

		PrintWriter writer = response.getWriter();

		writer.println(resp);
		writer.flush();

		writer.close();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		BufferedReader in = new BufferedReader(request.getReader());
		StringBuilder sb = new StringBuilder();
		String line = null;

		while ((line = in.readLine()) != null) {
			sb.append(line);
		}

		in.close();
		
		try {
			MensagemDAO mensagemDAO = new MensagemDAO(new BD(
					"com.mysql.jdbc.Driver",
					"jdbc:mysql://127.0.0.1:3306/squeak", "root", "root"));
			
			Mensagem m = new Mensagem(null, sb.toString(), new Date(), (Usuario)request.getSession().getAttribute("usuario"));

			mensagemDAO.criar(m);

			mensagemDAO.fecharConexao();

		} catch (Exception e) {
			response.setStatus(500);
		}

	}
}
