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
		    <li class="collection-item avatar">
		      <i class="material-icons circle green">help_outline</i>
		      <span class="title">Pergunta 2</span>
		      <p>One common flaw we've seen in many frameworks is a lack of support for truly responsive text. While elements on the page resize fluidly, text still resizes on a fixed basis. To ameliorate this problem, for text heavy pages, we've created a class that fluidly scales text size and line-height to optimize readability for the user. 
		      </p>
		    </li>
		    <li class="collection-item avatar">
		      <i class="material-icons circle red">hourglass_empty</i>
		      <span class="title">Pergunta 1</span>
		      <p>One common flaw we've seen in many frameworks is a lack of support for truly responsive text. While elements on the page resize fluidly, text still resizes on a fixed basis. To ameliorate this problem, for text heavy pages, we've created a class that fluidly scales text size and line-height to optimize readability for the user. 
		      </p>
		    </li>
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
	    <form class="col s12">
	      <div class="row">
	        <div class="input-field col s12">
	          <textarea id="duvida" class="materialize-textarea"></textarea>
	          <label for="duvida">Digite sua dúvida</label>
	        </div>
	      </div>
	      <div class="row">
		      <button class="btn waves-effect waves-light right" type="submit" name="action">Enviar
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
</script>