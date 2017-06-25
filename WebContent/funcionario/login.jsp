
  <div class="container">
      <div class="row center">
      <h4>Login Funcionário</h4>
        <div class="col s6 m6">
          <div class="card small">
            <div class="card-content">
              <form class="col s12" id="formulario" name="formulario" action="javascript:validar()" action="javascript:goHome()" method="post">
			      <div class="row">
			        <div class="input-field col s12">
			          <i class="material-icons prefix">email</i>
			          <input id="email" name="email" type="text" class="validate" required>
			          <label for="email">E-mail</label>
			        </div>
			      </div>
			      <div class="row">
			        <div class="input-field col s12">
			          <i class="material-icons prefix">lock</i>
			          <input id="senha" name="senha" type="password" class="validate" required>
			          <label for="senha">Senha</label>
			        </div>
			      </div>
			      <div class="row">
			        <div class="input-field col s12">
				      <button class="btn waves-effect waves-light right" type="submit" name="action">Entrar
					    <i class="material-icons right">arrow_forward</i>
					  </button>			          
			        </div>
			      </div>
			    </form>
            </div>
          </div>
        </div>
     </div>
</div>

<script type="text/javascript">

	function validar(){
		
		var email = $('#email').val();
		var senha = $('#senha').val();
		
		swal({
			  title: 'Login',
			  text: 'Verificando email e senha.',
			  showConfirmButton: false,
			  allowOutsideClick: false,
			  allowEscapeKey: false,
			  allowEnterKey: false,
			  showLoaderOnConfirm: true
		});
		swal.showLoading();
		
		setTimeout(function(){
			$.ajax({
		           url: "../api/logar.jsp",
		           data: {
		               email: email,
		               senha: senha,
		               tipo: "f",
		           },
		           type: "GET",
	               success: function (data) {
	            	   console.log(data.trim());
	            	   if(data.trim()!="false"){
		                   swal({
		                       title: "Sucesso!",
		                       text: "Logado com sucesso",
		                       type: "success",
		                       allowEscapeKey: false
		                   });
		            	   location.href = "../cliente/?pagina=alugueis&funcionario="+data;
	            	   }else{
		                   swal({
		                       title: "Erro!",
		                       text: "Email ou senha não encontrado(s).",
		                       type: "error",
		                   });	            		   
	            	   }
	               },
	               error: function (data) {
	                   console.log(data);
	                   swal({
	                       title: "Erro!",
	                       text: "Servidor fora do ar, tente novamente mais tarde.",
	                       type: "error",
	                   });
	               }
		    });
			
		}, 2000);
	}
	
	$(document).ready(function(){
	  $('#header').css('padding-left','0px');
	  $('#main').css('padding-left','0px');
	  //$('footer').css('padding-left','');
	});
</script>