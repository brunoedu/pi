<%@page import="br.com.pi.persistencia.PessoaDB"%>
<%@page import="br.com.pi.persistencia.VeiculoDB"%>
<%@page import="br.com.pi.dominio.Pessoa"%>
<%@page import="br.com.pi.dominio.Veiculo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%
	String usuario = request.getParameter("usuario");
	String pagina = request.getParameter("pagina");
	if ((pagina != null) && (pagina.equals("cadastro"))){
	     
	}else if (pagina == null || usuario == null){
	    pagina = "login";
	}
	pagina = pagina + ".jsp";
	
	DecimalFormat df = new DecimalFormat("###.#");
	
	ArrayList<Veiculo> veiculos = VeiculoDB.listar(); 
   
%>
<input id="cliente" type="hidden" value="<%=usuario%>"/>
 <nav>
   <div class="nav-wrapper cyan lighten-1">
     <div class="col s12">
       <a href="index.jsp?pagina=home" class="breadcrumb">Home</a>
       <a href="#!" class="breadcrumb">Veículos</a>
     </div>
   </div>
 </nav>
<div class="container">
  <h3 class="center-align">Nossos Veículos</h3>
  <% if (veiculos.size() == 0){ %>
  <div class="row center">
     <div class="col s12 m12">
       <div class="card">
         <div class="card-content">
           <p>Não existem veículos disponíveis no momento.</p>
         </div>
       </div>
     </div>
   </div>
   <%} %>
  <div class="row">
    <% 
	  for(Veiculo veiculo:veiculos){
	%>
    <div class="col s6 m6">
      <div class="card medium">
        <div class="card-image">
          <img src="../res/img/carro1.jpg">
          <span class="card-title"><%=veiculo.getModelo() %></span>
        </div>
        <div class="card-content">
          <p><%=veiculo.getAdicionais() %>.</p>
          <h5>R$ <%=df.format(veiculo.getPrecoTotal()) %>,00</h5>
        </div>
        <div class="card-action">
          <a href="#modalAlugar" onclick="javascript:setVeiculo('<%=veiculo.getPlaca() %>','<%=veiculo.getPrecoTotal() %>')">Alugar Carro</a>
        </div>
      </div>
    </div>
    <%	
   		}
    %>
  </div>
</div>
<input type="hidden" id="veiculoAluguel" value=""/>
<input type="hidden" id="preco" value=""/>
<div id="modalAlugar" class="modal">
  <div class="modal-content">
    <h4>Alugar Carro</h4>
	<form class="col s12" id="formulario" name="formulario" action="javascript:validar()" method="post">      
      <div class="row">
        <div class="input-field col s6">
	      <i class="material-icons prefix">date_range</i>
          <input id="dataRetirada" type="date" class="datepicker" required>
          <label for="dataRetirada">Data de Retirada</label>
        </div>
        <div class="input-field col s6">
	      <i class="material-icons prefix">date_range</i>
          <input id="dataEntrega" type="date" class="datepicker" required>
          <label for="dataEntrega">Data de Entrega</label>
        </div>
      </div>     
      <div class="row">      
        <div class="input-field col s6">
	      <i class="material-icons prefix">security</i>
          <input id="seguro" type="checkbox" />
          <label for="seguro">Seguro</label>
        </div>
      </div>
      <div class="row">
	      <button class="btn waves-effect waves-light right cyan lighten-1" type="submit" name="action">Alugar
		    <i class="material-icons right">directions_car</i>
		  </button>
      </div>
    </form>
  </div>
<!--   <div class="modal-footer">
    <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Ok</a>
  </div> -->
</div>
<script type="text/javascript">

	function setVeiculo(placa, preco){
		console.log(placa, preco);
		$('#veiculoAluguel').val(placa);
		$('#preco').val(preco);
	}
	
	function validar(){
		
		var dados = {
			dataRetirada: $('#dataRetirada').val(),
			dataEntrega: $('#dataEntrega').val(),
			seguro: $('#seguro').prop('checked'),
			veiculo: $('#veiculoAluguel').val(),
			precoTotal: $('#preco').val(),
		};
						
		console.log(dados);
		
		swal({
			  title: 'Aluguel',
			  text: 'Efetuando aluguel, aguarde um momento!',
			  showConfirmButton: false,
			  allowOutsideClick: false,
			  allowEscapeKey: false,
			  allowEnterKey: false,
			  showLoaderOnConfirm: true
		});
		swal.showLoading();
		
		setTimeout(function(){
			$.ajax({
		           url: "../api/cadastrarAluguel.jsp",
		           data: {
		        	   cliente: $('#cliente').val(),
		        	   dataRetirada: dados.dataRetirada,
		        	   dataEntrega: dados.dataEntrega,
		        	   seguro: dados.seguro,
		        	   veiculo: dados.veiculo,
		        	   precoTotal: dados.precoTotal,
		           },
		           type: "GET",
	               success: function (data) {
	            	   console.log(data.trim());
	            	   if(data.trim()=="false"){
		                   swal({
		                       title: "Sucesso!",
		                       text: "Aluguel solicitado com sucesso.",
		                       type: "success",
		                       allowEscapeKey: false,
		          			   allowOutsideClick: false,
		                   }).then(function () {
			            	   location.href = "../cliente/?pagina=alugueis&usuario="+$('#cliente').val();
		                   });
	            	   }else{
		                   swal({
		                       title: "Erro!",
		                       text: "Falha ao cadastrar aluguel.",
		                       type: "error",
		                   });
	            	   }
	               },
	               error: function (data) {
	                   console.log(data);
	                   swal({
	                       title: "Erro!",
	                       text: "Falha ao cadastrar aluguel.",
	                       type: "error",
	                   });
	               }
		    });
			
		}, 2000);
	}
	$(document).ready(function(){
	  // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
	  $('.modal').modal();
	  $('.datepicker').pickadate({
		    selectMonths: true,
		    selectYears: 15,
		    format: 'dd/mm/yyyy'
	  });
	});
</script>