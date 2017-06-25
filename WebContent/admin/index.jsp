<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   String pagina = request.getParameter("pagina");
   if (pagina == null){ 
       pagina = "login";
   }
   pagina = pagina + ".jsp";
   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="../res/css/materialize.min.css"  media="screen,projection"/>
<link type="text/css" rel="stylesheet" href="../res/css/style.css"  media="screen,projection"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="../res/js/materialize.min.js"></script>

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.5/sweetalert2.common.min.js" type="text/javascript"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.5/sweetalert2.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.5/sweetalert2.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.1.60/inputmask/jquery.inputmask.js" type="text/javascript"></script>
  
<title>Martinelli's Company</title>
</head>
<body>
<%if(!pagina.equals("login.jsp")){%>
  <ul id="slide-out" class="side-nav fixed">
    <li><div class="userView">
    <div class="background">
      <img src="../res/img/capa.jpg">
    </div>
    <a href="#!user"><img class="circle" src="../res/img/usuario.png"></a>
    <a href="#!name"><span class="white-text name">Olá, Admin</span></a>
    <a href="#!email"><span class="white-text email">admin@gmail.com</span></a>
    </div></li>
	
	<%if(pagina.equals("funcionarios.jsp")){%>
		<li class="active"><a class="waves-effect" href="index.jsp?pagina=funcionarios"><i class="material-icons">account_box</i>Funcionários</a></li>  
	<%}	else {%>
	    <li><a class="waves-effect" href="index.jsp?pagina=funcionarios"><i class="material-icons">account_box</i>Funcionários</a></li>
	<% } %>
	<%if(pagina.equals("clientes.jsp")){%>
		<li class="active"><a class="waves-effect" href="index.jsp?pagina=clientes"><i class="material-icons">account_circle</i>Usuários</a></li>  
	<%}	else {%>
	    <li><a class="waves-effect" href="index.jsp?pagina=clientes"><i class="material-icons">account_circle</i>Usuários</a></li>
	<% } %>
	<%if(pagina.equals("alugueis.jsp")){%>
		<li class="active"><a class="waves-effect" href="index.jsp?pagina=alugueis"><i class="material-icons">account_balance_wallet</i>Aluguéis</a></li>  
	<%}	else {%>
	    <li><a class="waves-effect" href="index.jsp?pagina=alugueis"><i class="material-icons">account_balance_wallet</i>Aluguéis</a></li>
	<% } %>
	<%if(pagina.equals("veiculos.jsp")){%>
		<li class="active"><a class="waves-effect" href="index.jsp?pagina=veiculos"><i class="material-icons">directions_car</i>Veículos</a></li>  
	<%}	else {%>
	    <li><a class="waves-effect" href="index.jsp?pagina=veiculos"><i class="material-icons">directions_car</i>Veículos</a></li>
	<% } %>
	<%if(pagina.equals("duvidas.jsp")){%>
		<li class="active"><a class="waves-effect" href="index.jsp?pagina=duvidas"><i class="material-icons">help_outline</i>Dúvidas</a></li>  
	<%}	else {%>
	    <li><a class="waves-effect" href="index.jsp?pagina=duvidas"><i class="material-icons">help_outline</i>Dúvidas</a></li>
	<% } %>
    <li><a class="waves-effect" href="../admin/"><i class="material-icons">exit_to_app</i>Sair</a></li>
  </ul>
<% } %>
  <header id="header"> 
    <nav>
      <div class="nav-wrapper cyan lighten-1">
        <a href="#!" class="brand-logo center">Martinelli's Company</a>
      </div>
    </nav>
  </header>

  <main id="main">
	<section id="content">
            <jsp:include page="<%=pagina%>"></jsp:include>
            
    </section>
  </main>

</body>
</html>

<script type="text/javascript">
  $(".button-collapse").sideNav();
  $(document).ready(function(){
      $('.slider').slider();
    });
</script>