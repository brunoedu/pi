
  <div class="container">
      <div class="row center">
      <h4>Cadastro de Cliente</h4>
       <div class="row">
       <form id="formulario" name="formulario" action="javascript:validar()" action="javascript:goHome()" method="post">
        <div class="col s12 m6">
          <div class="card">          
            <div class="card-content">
               <div class="row">
				    <div class="col s12">
				      <div class="row">
				        <div class="input-field col s7">
          				  <i class="material-icons prefix">account_circle</i>
				          <input id="nome" name="nome" type="text" class="validate" required>
				          <label for="nome">Nome Completo</label>
				        </div>
				        <div class="input-field col s5">
          				  <i class="material-icons prefix">assignment</i>
				          <input id="cnh" name="cnh" type="text" class="validate" required>
				          <label for="cnh">CNH</label>
				        </div>
				      </div>
				      <div class="row">
				        <div class="input-field col s6">
                          <i class="material-icons prefix">assignment</i>
				          <input id="cpf" name="cpf" type="text" class="validate" required>
				          <label for="cpf">CPF</label>
				        </div>
				        <div class="input-field col s6">
                          <i class="material-icons prefix">assignment</i>
				          <input id="rg" name="rg" type="text" class="validate" required>
				          <label for="rg">RG</label>
				        </div>
				      </div>
				      <div class="row">
				        <div class="input-field col s6">
                          <i class="material-icons prefix">call</i>
				          <input id="tel" name="tel" type="tel" class="validate" required>
				          <label for="tel">Telefone</label>
				        </div>
				        <div class="input-field col s6">
                          <i class="material-icons prefix">date_range</i>
  						  <input id="dataNasc" name="dataNasc" type="date" class="datepicker" required>
				          <label for="dataNasc">Data Nascimento</label>
				        </div>
				      </div>
				      <div class="row">
				        <div class="input-field col s12">
                          <i class="material-icons prefix">place</i>
				          <input id="cep" name="cep" type="text" class="validate" required>
				          <label for="cep">CEP</label>
				        </div>
				      </div>
				      <div class="row">
				        <div class="input-field col s8">
                          <i class="material-icons prefix">place</i>
				          <input id="endereco" name="endereco" type="text" class="validate" disabled required>
				          <label id="lblEndereco" for="endereco">Endereco</label>
				        </div>
				        <div class="input-field col s4">
                          <i class="material-icons prefix">place</i>
				          <input id="numero" name="numero" type="text" class="validate" disabled required>
				          <label for="numero">Número</label>
				        </div>
				      </div>
				      <div class="row">
				        <div class="input-field col s6">
                          <i class="material-icons prefix">place</i>
				          <input id="cidade" name="cidade" type="text" class="validate" disabled required>
				          <label id="lblCidade" for="cidade">Cidade</label>
				        </div>
				        <div class="input-field col s6">
                          <i class="material-icons prefix">place</i>
				          <input id="estado" name="estado" type="text" class="validate" disabled required>
				          <label id="lblEstado" for="estado">Estado</label>
				        </div>
				      </div>
				    </div>
				  </div>
            </div>
          </div>
        </div>
        <div class="col s12 m6">
          <div class="card">
            <div class="card-content">
               <div class="row">
				    <div class="col s12">				      
				      <div class="row">
				        <div class="input-field col s12">
                          <i class="material-icons prefix">email</i>
				          <input id="email" type="email" class="validate" required>
				          <label for="email">Email</label>
				        </div>
				      </div>
				      <div class="row">
				        <div class="input-field col s12">
                          <i class="material-icons prefix">lock</i>
				          <input id="senha" type="password" class="validate" required>
				          <label for="senha">Senha</label>
				        </div>
				      </div>
				      <div class="row">
				        <div class="input-field col s12">
					      <button class="btn waves-effect waves-light right cyan lighten-1" type="submit" name="action">Cadastrar
						    <i class="material-icons right">arrow_forward</i>
						  </button>			          
				        </div>
				      </div>
				    </div>
				  </div>
            </div>
          </div>
        </div>
        </form>
      </div>
     </div>
</div>

<script type="text/javascript">

	function validar(){
		
		var dados = {
			nome: $('#nome').val(),
			cpf: $('#cpf').val(),
			cnh: $('#cnh').val(),
			rg: $('#rg').val(),	
			telefone: $('#tel').val(),	
			dataNascimento: $('#dataNasc').val(),
			logradouro: $('#endereco').val(),
			numero: $('#numero').val(),
			cidade: $('#cidade').val(),
			estado: $('#estado').val(),
			cep: $('#cep').val(),
			email: $('#email').val(),
			senha: $('#senha').val(),
			tipo: "c",
		};
		
		console.log(dados);
		
		swal({
			  title: 'Cadastro',
			  text: 'Efetuando cadastro, aguarde um momento!',
			  showConfirmButton: false,
			  allowOutsideClick: false,
			  allowEscapeKey: false,
			  allowEnterKey: false,
			  showLoaderOnConfirm: true
		});
		swal.showLoading();
		
		setTimeout(function(){
			$.ajax({
		           url: "../api/cadastrar.jsp",
		           data: {
		        	    nome: dados.nome,
			   			cpf: dados.cpf,
			   			cnh: dados.cnh,
			   			rg: dados.rg,	
			   			telefone: dados.telefone,	
			   			dataNascimento: '12/12/2017',
			   			logradouro: dados.logradouro,
			   			numero: dados.numero,
			   			cidade: dados.cidade,
			   			estado: dados.estado,
			   			cep: dados.cep,
			   			tipo: dados.tipo,
			   			email: dados.email,
			   			senha: dados.senha,
		           },
		           type: "GET",
	               success: function (data) {
	            	   console.log(data.trim());
	            	   if(data.trim()!="false"){
		                   swal({
		                       title: "Sucesso!",
		                       text: "Cliente cadastrado com sucesso",
		                       type: "success",
		                       allowEscapeKey: false,
		          			   allowOutsideClick: false,
		                   }).then(function () {
			            	   location.href = "../cliente/?pagina=home&usuario="+data;
		                   });
	            	   }else{
		                   swal({
		                       title: "Erro!",
		                       text: "Falha ao cadastrar cliente. CPF ou E-mail já cadastrado.",
		                       type: "error",
		                   });
		                   setMask();
	            	   }
	               },
	               error: function (data) {
	                   console.log(data);
	                   swal({
	                       title: "Erro!",
	                       text: "Falha ao cadastrar cliente.",
	                       type: "error",
	                   });
	               }
		    });
			
		}, 2000);
	}
	

    var ajaxCEP;
    $("#cep").blur(function () {
        var val = $(this).val().replace(/[^0-9]/gi, "");
        if (val != "") {
            if (ajaxCEP && ajaxCEP.readyState != 4) {
                ajaxCEP.abort();
            }
            ajaxCEP = $.ajax({
                url: "http://correiosapi.apphb.com/cep/" + val,
                crossDomain: true,
                dataType: "jsonp",
                success: function (data) {
                    console.log(data);
                    $("#endereco").val(data.tipoDeLogradouro+" "+data.logradouro);
                    $("#lblEndereco").addClass("active");
                    $("#cidade").val(data.cidade);
                    $("#lblCidade").addClass("active");
                    $("#estado").val(data.estado);
                    $("#lblEstado").addClass("active");
                    $("#numero").removeAttr("disabled").focus();
                    swal.close();                  
                },
                error: function (data) {
                    console.log(data);
                    $("#endereco").removeAttr("disabled");
                    $("#cidade").removeAttr("disabled");
                    $("#estado").removeAttr("disabled");
                    $("#numero").removeAttr("disabled");
                    swal.close();
                },
                beforeSend: function () {
                    swal({
                        title: "Carregando...",
                        text: "Procurando CEP.",
                        showConfirmButton: false,
                        showCancelButton: false,
          			    allowOutsideClick: false,
                        closeOnConfirm: false,
                        closeOnCancel: false,
                        allowEscapeKey: false
                    });
                }
            });
        }
    });
    
    function setMask(){
    	$('#cnh').inputmask({
  		  mask:"99999999999",
  		  showMaskOnHover: false,
  		  showMaskOnFocus: false,
  		  clearMaskOnLostFocus: true,
  		  removeMaskOnSubmit: true,
  	  });
  	  $('#tel').inputmask({
  		  mask:"(99) 9999-9999",
  		  showMaskOnHover: false,
  		  showMaskOnFocus: false,
  		  clearMaskOnLostFocus: true,
  		  removeMaskOnSubmit: true,
  	  });
  	  $('#rg').inputmask({
  		  mask:"99.999.999-*",
  		  showMaskOnHover: false,
  		  showMaskOnFocus: false,
  		  clearMaskOnLostFocus: true,
  		  removeMaskOnSubmit: true,
  	  });
  	  $('#cpf').inputmask({
  		  mask:"999.999.999-99",
  		  showMaskOnHover: false,
  		  showMaskOnFocus: false,
  		  clearMaskOnLostFocus: true,
  		  removeMaskOnSubmit: true,
  	  });
  	  $('#cep').inputmask({
  		  mask:"99999-999",
  		  showMaskOnHover: false,
  		  showMaskOnFocus: false,
  		  clearMaskOnLostFocus: true,
  		  removeMaskOnSubmit: true,
  	  });
    }
	
	$(document).ready(function(){
	  $('#header').css('padding-left','0px');
	  $('#main').css('padding-left','0px');
	  //$('footer').css('padding-left','');
	  $('.datepicker').pickadate({
	    selectMonths: true,
	    selectYears: 90
  	  });

	  setMask();
	});
</script>