<%@page import="br.com.pi.persistencia.PessoaDB"%>
<%@page import="br.com.pi.dominio.Pessoa"%>
<%@page import="java.util.ArrayList"%>
<%
	ArrayList<Pessoa> clientes = PessoaDB.getAllByTipo("c"); 
   
%>
 <h3 class="center-align">Clientes</h3>
  <div class="row">
    <div class="col s12 m12">
      <div class="card">
        <div class="card-content">
          <table class="striped">
	        <thead>
	          <tr>	          
	              <th>Nome</th>
	              <th>Cidade</th>
	              <th>Estado</th>
	              <th>Telefone</th>
	              <th>E-mail</th>
	          </tr>
	        </thead>
	
	        <tbody>	        
	          <% 
	          	for(Pessoa cliente:clientes){
	          %>
	          	<tr>
		            <td><%=cliente.getNome() %></td>
		            <td><%=cliente.getCidade() %></td>
					<td><%=cliente.getEstado() %></td>
					<td><%=cliente.getTelefone() %></td>
					<td><%=cliente.getEmail() %></td>
					<td><a href="javascript:excluir('<%=cliente.getCpf() %>', '<%=cliente.getNome() %>')" data-toggle="tooltip" title="Excluir"><i class="material-icons pointer red-text text-darken-1">delete</i></a> </td>
	          	</tr>
	          <%	
	          	}
	          %>   
	        </tbody>
	      </table>
        </div>
      </div>
    </div>
  </div>
<script type="text/javascript">
	function excluir(cpf, nome){
		
		swal({
			  title: 'Excluir cliente?',
			  text: "Deseja realmente excluir o(a) cliente(a) "+nome+"?",
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Excluir',
			  cancelButtonText: 'Cancelar'
			}).then(function () {
				swal({
					  title: 'Excluindo',
					  text: 'Excluindo cliente, aguarde um momento!',
					  showConfirmButton: false,
					  allowOutsideClick: false,
					  allowEscapeKey: false,
					  allowEnterKey: false,
					  showLoaderOnConfirm: true
				});
				swal.showLoading();
				setTimeout(function(){
					$.ajax({
				           url: "../api/excluir.jsp",
				           data: {
					   			cpf: cpf
				           },
				           type: "GET",
			               success: function (data) {
			            	   console.log(data.trim());
			                   swal({
			                       title: "Excluído!",
			                       text: "Cliente excluído com sucesso",
			                       type: "success",
			                       allowEscapeKey: false,
			          			   allowOutsideClick: false,
			                   }).then(function () {
				            	   location.href = "../admin/?pagina=clientes";
			                   });
			               },
			               error: function (data) {
			                   console.log(data);
			                   swal({
			                       title: "Erro!",
			                       text: "Falha ao excluir cliente.",
			                       type: "error",
			                   });
			               }
				    });
					
				}, 2000);
			})
	} 
	$(document).ready(function(){
	  
	});
</script>