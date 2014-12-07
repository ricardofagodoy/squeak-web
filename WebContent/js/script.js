var ultimoId = 0;

var refreshMessages = function() {
	$.get("mensagem", function(data) {
		
		msgs = JSON.parse(data);
		
		$.each(msgs, function(k, v) {
			
			if(v.id > ultimoId) {
				
				var bg = ultimoId%2 == 0 ? '#D2D2D2' : '#FFFFFF';
				
				var texto = v.texto.length > 30 ? v.texto.substring(0,30) + '<br/>' + v.texto.substring(30) : v.texto;
				
				$("#msgs").append(
					'<tr style="background-color:' + bg +'"><td>'+ v.data +'</td><td>'+ texto +'</td><td>'+ v.usuario.nome +'</td></tr>');
			
				ultimoId = v.id;
			}
		});
	});
};

var enviarMensagem = function() {
	
	$.ajax({
		  type: "POST",
		  url: 'mensagem',
		  data: $("#textoMensagem").val(),
		  success: function() {
			  $('#msgsuc').modal('show');
			  $("#textoMensagem").val("");
		  },
		  dataType: 'text'
		});
};

$("#enviarMensagem").click(enviarMensagem);

window.setInterval(refreshMessages, 3000);

$("#textoMensagem").val("");