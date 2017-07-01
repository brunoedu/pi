<%@page import="br.com.pi.persistencia.PessoaDB"%>
<%@page import="br.com.pi.persistencia.DuvidaDB"%>
<%@page import="br.com.pi.dominio.Pessoa"%>
<%@page import="br.com.pi.dominio.Duvida"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	String usuario = request.getParameter("usuario");
	String pagina = request.getParameter("pagina");
	if ((pagina != null) && (pagina.equals("cadastro"))){
	     
	}else if (pagina == null || usuario == null){
	    pagina = "login";
	}
	pagina = pagina + ".jsp";
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	
	ArrayList<Duvida> duvidas = DuvidaDB.getByCliente(usuario); 
   
%>
<input id="cliente" type="hidden" value="<%=usuario%>"/>
 <nav>
   <div class="nav-wrapper cyan lighten-1">
     <div class="col s12">
       <a href="index.jsp?pagina=home" class="breadcrumb">Home</a>
       <a href="#!" class="breadcrumb">Dúvidas</a>
     </div>
   </div>
 </nav>
<div class="container">
  <h3 class="center-align">Dúvidas</h3>
   <div class="row">
    <div class="col s12">
      <div class="card">
        <div class="card-content">
          <!-- <span class="card-title">Nova Dúvida</span> -->
          <a class="waves-effect waves-light btn cyan lighten-1" href="#modalNovaDuvida"><i class="material-icons left">help</i>Nova Dúvida</a>
          
          <h5>Minhas Dúvidas</h5>		  
		  <ul class="collection">	
		  	<% if (duvidas.size() == 0){ %>
			  	<li class="collection-item avatar">			      
			      <i class="material-icons circle red">not_interested</i>
			      <span class="title">Você ainda não possui dúvidas.</span>
		      	  <p>Faça agora mesmo suas perguntas.</p>	
			    </li>
		  	<%} %>	  
		    <% 
			  for(Duvida duvida:duvidas){
			%>
		    <li class="collection-item avatar">
		      <%if(duvida.getResposta()==null){ %>
		      	<i class="material-icons circle red">hourglass_empty</i>
		      <%}else{ %>
		      	<i class="material-icons circle green">help_outline</i>
		      <%} %>
		      <span class="title"><%=duvida.getPergunta() %></span>
		      <p>Perguntado em: <%=dateFormat.format(duvida.getDataPergunta()) %></p>		      
		      <%if(duvida.getResposta()!=null){ %>
		      	<p>Respondido em: <%=dateFormat.format(duvida.getDataResposta()) %></p>
		      	<p><%=duvida.getResposta() %></p> 
		      <%}else{ %>
		      	<p>Dúvida ainda não respondida</p>
		      <%} %>
		    </li>		    	  
		    <% 
			  }
			%>
		  </ul>
        
        </div>
      </div>
    </div>
  </div>
</div>

<div id="modalNovaDuvida" class="modal">
  <div class="modal-content">
    <h4>Nova Dúvida</h4>  
    <div class="row">
	    <form class="col s12" id="formulario" name="formulario" action="javascript:validar()" method="post">
	      <div class="row">
	        <div class="input-field col s12">
	          <textarea id="duvida" class="materialize-textarea"></textarea>
	          <label for="duvida">Digite sua dúvida</label>
	        </div>
	      </div>
	      <div class="row">
		      <button class="btn waves-effect waves-light right cyan lighten-1" type="submit" name="action">Enviar
			    <i class="material-icons right">send</i>
			  </button>
	      </div>
	    </form>
  	</div>
  </div>
  <!-- <div class="modal-footer">
    <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Enviar</a>
  </div> -->
</div>

<script type="text/javascript">
	$(document).ready(function(){
		$('.modal').modal();
	});
	
	function validar(){
		
		var dados = {
			duvida: $('#duvida').val()
		};
				
		console.log(dados);
		
		swal({
			  title: 'Dúvida',
			  text: 'Efetuando cadastro de dúvida, aguarde um momento!',
			  showConfirmButton: false,
			  allowOutsideClick: false,
			  allowEscapeKey: false,
			  allowEnterKey: false,
			  showLoaderOnConfirm: true
		});
		swal.showLoading();
		
		setTimeout(function(){
			$.ajax({
		           url: "../api/cadastrarDuvida.jsp",
		           data: {
		        	   cliente: $('#cliente').val(),
		        	   duvida: dados.duvida
		           },
		           type: "GET",
	               success: function (data) {
	            	   console.log(data.trim());
	            	   if(data.trim()=="false"){
		                   swal({
		                       title: "Sucesso!",
		                       text: "Dúvida cadastrada com sucesso.",
		                       type: "success",
		                       allowEscapeKey: false,
		          			   allowOutsideClick: false,
		                   }).then(function () {
			            	   location.href = "../cliente/?pagina=duvidas&usuario="+$('#cliente').val();
		                   });
	            	   }else{
		                   swal({
		                       title: "Erro!",
		                       text: "Falha ao cadastrar dúvida.",
		                       type: "error",
		                   });
	            	   }
	               },
	               error: function (data) {
	                   console.log(data);
	                   swal({
	                       title: "Erro!",
	                       text: "Falha ao cadastrar dúvida.",
	                       type: "error",
	                   });
	               }
		    });
			
		}, 2000);
	}
</script>