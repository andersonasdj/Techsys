<%@page import="java.util.Calendar"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
	<title>TechGold | Solicita��o de Suporte</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/jquery-ui.css">
	<link rel="stylesheet" href="assets/css/jquery.ui.timepiker.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>		
	<br/><br/><br/>
	<form action="salvarSolicitacao" method="post" class="form-horizontal container">
		<fieldset>
			<legend>Solicita��o de Atendimento</legend>
			<input type="hidden" name="abriuChamado" id="abriuChamado" value="${tecnicoLogado.nome}">
			<div class="control-group">
				<label class="control-label">Cliente</label>
				<div class="controls">
					<select class="selectpicker" id="nomeDoCliente"
						name="nomeDoCliente">
						<option>${solicitacao.funcionario.id}</option>
						<c:forEach var="cliente" items="${clientes}">
							<option>${cliente.nome}</option>
						</c:forEach>
					</select>
					<span id="flag" style="font-size: 20px ;color:red ; font-weight:bold"></span>
					<span id="vip" style="font-size: 18px ;color:#04B404 ; font-weight:bold"></span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Forma de Abertura</label>
				<div class="controls">
					<select class="selectpicker" id="formaAbertura"
						name="formaAbertura">
						<option></option>
						<option>Helpdesk</option>
						<option>E-mail</option>
						<option>Whatsapp</option>
						<option>No local</option>
						<option>
					</select>
				</div>
			</div> 
			<div class="form-group">
				<label class="control-label">Solicitante</label>
	            <div class="controls">
	                <select class="form-control solicitante" name="solicitante" id="solicitante"></select>
	            	<span id="cargoSolicitante" style="font-size: 15px ;color:#0101DF ; font-weight:bold">  </span>
	                <span id="celularSolicitante" style="font-size: 15px ;color:#0101DF ; font-weight:bold">  </span>
	            </div>
        	</div>
        	<br/>
        	<div class="form-group">
				<label class="control-label">Usu�rio Afetado</label>
	            <div class="controls">
	               <select class="form-control usuario" name="usuario" id="usuario"></select>
	               <span id="cargoUsuario" style="font-size: 15px ;color:#0101DF ; font-weight:bold"></span>
	               <span id="celularUsuario" style="font-size: 15px ;color:#0101DF ; font-weight:bold"></span>
	               <p class="help-block">* Campo Obrigat�rio</p>
	            </div>
        	</div> <br/>
			<div class="control-group">
				<label class="control-label">Problema Relatado</label>
				<div class="controls">
					<textarea class="form-control" rows="4" id="descricaoProblema" name="descricaoProblema" type="text" placeholder="Problema Relatado" 
						onkeyup="limite_textarea_prob(this.value)" class="input-xlarge" required></textarea>
					<span id="contProb">255</span> Restantes <br>
					<p class="help-block">* Campo Obrigat�rio</p>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Observa��es</label>
				<div class="controls">
					<textarea class="form-control" rows="4" id="obs" name="obs" type="text" placeholder="Observa��es da solicita��o"
						value="${solicitacao.obs}" onkeyup="limite_textarea_obs(this.value)" class="input-xlarge"></textarea>
						<span id="contObs">255</span> Restantes <br>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Categoria
					<a class="dcontexto"> (?)
					<span>Hardware - Problema f�sico no equipamento. <br><br>
						Software - Problema l�gico no equipamento. <br><br>
						Rede - Problemas de conex�o. <br><br>
						Cabeamento - Servi�os de cabeamento estruturado.
					</span></a>
				</label>
				<div class="controls">
					<select class="selectpicker" id="classificacao"
						name="classificacao">
						<option></option>
						<option>Hardware</option>
						<option>Software</option>
						<option>Rede</option>
						<option>Cabeamento</option>
						<option>Smartphone</option>
						<option>Projeto</option>
						<option>Backup</option>
						<option>Outros</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Classifica��o
					<a class="dcontexto"> (?)
					<span>Problema - Algo que � recorrente. <br> Incidente - Algo n�o recorrente. <br> Solicita��o - Planejado.</span></a>
				</label>
				<div class="controls">
					<select class="selectpicker" id="nivelDeIncidencia"
						name="nivelDeIncidencia">
						<option></option>
						<option>Problema</option>
						<option>Incidente</option>
						<option>Solicita��o</option>
						<option>Backup</option>
					</select>
				</div>
			</div> 
			<div class="control-group">
				<label class="control-label">Prioridade
				<a class="dcontexto"> (?)
					<span>Cr�tico - 2 Horas. <br> Alta - 4 Horas. <br> M�dia - 24 Horas. <br> Baixa - 48 Horas. <br> Planejada - Evento Planejado.</span>
				</a></label>
				<div class="controls">
					<select class="selectpicker" id="prioridade"
						name="prioridade">
						<option></option>
						<option>Cr�tico</option>
						<option>Alta</option>
						<option>Media</option>
						<option>Baixa</option>
						<option>Planejada</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Onsite / Offsite
					<a class="dcontexto"> (?)
					<span>Onsite - Atendimento no local. <br> Offsite - Atendimento remoto.</span></a>
				</label>
				<div class="controls">
					<select class="selectpicker" id="onsiteOffisite"
						name="onsiteOffsite">
						<option></option>
						<option>Onsite</option>
						<option>Offsite</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Status</label>
				<div class="controls">
					<select class="selectpicker alertaFuncionario" id="status"
						name="status">
						<option>Abrir</option>
						<option>Em andamento</option>
						<option>Agendar</option>
					</select>
				</div>
			</div>
			<div id="agendamentos">
				<div class="control-group" id="opAgendamentoData">
					<label class="control-label">Data de Agendamento</label>
					<div class="controls">
						<input id="datepicker" name="agendado" type="text" placeholder="Data de agendamento" maxlength="10"
							value="<f:formatDate pattern="dd-MM-yyyy" value="${solicitacao.agendado.time}" />" /> <i class="fa fa-calendar fa-lg"> </i>
					</div>
				</div>
				<div class="control-group" id="opAgendamentoHora">
					<label class="control-label">Hora de Agendamento</label>
					<div class="controls">
						<input id="timepicker" name="agendadoHora" type="text" placeholder="Hora de agendamento" maxlength="10"
							value="<f:formatDate pattern="HH:mm" value="${solicitacao.agendadoHora.time}" />" /> <i class="fa fa-clock-o fa-lg"> </i>
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">T�cino Respons�vel</label>
				<div class="controls">
					<select class="selectpicker alertaFuncionario" id="nomeDoFuncionario"
						name="nomeDoFuncionario">
						<option>${tecnicoLogado.nome}</option>
						<option></option> 
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="enviar" name="salvar" class="btn btn-success">Salvar <i class="fa fa-floppy-o fa-lg"></i></button>
					<a class="btn btn-primary" href="homePage" role="button">Voltar <i class="fa fa-reply-all fa-lg"></i></a>
				</div>
			</div>
			<legend></legend>
		</fieldset>
	</form>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/jquery-ui.js"></script>
	<script src="assets/js/jquery.ui.timepiker.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/calendario.js"></script>
	<script>
   		var divCliente = $(".alertaFuncionario");
   		divCliente.on("change", function(){
   			var funcionario = $("#nomeDoFuncionario").val();
   			var status = $("#status").val();
   			if(funcionario == "" && status == 'Abrir'){
   				alert("Voc� n�o pode agendar um chamado sem um t�cino!");
   				$('#enviar').attr('disabled','disabled');
   			} else if(funcionario == "" && status == 'Em andamento'){
   				alert("Voc� n�o pode iniciar um chamado sem um t�cnico!");
   				$('#enviar').attr('disabled','disabled');
   			} else if(funcionario == "" && status == 'Agendar'){
   				alert("Voc� n�o pode deixar um chamado aguardano sem um t�cnico!");
   				$('#enviar').attr('disabled','disabled');
   			} else{
   				$('#enviar').attr('disabled',false);
   			}
   		}); 
	</script>
	<script>
    	$(document).ready(function () {
    		var divCliente = $("#nomeDoCliente");
    		divCliente.on("change", function(){
	    		var json = {"nomeCliente" : $("#nomeDoCliente").val()};
		        $.ajax({
		            url: "/provider/listarColaboradoresForm",
		            type: "GET",
		            data: json,
		            success: function (object) {
		                if (object != null) {
		                    var selectbox = $('.usuario');
		                    selectbox.find('option').remove();
		                    var selectbox = $('.solicitante');
		                    selectbox.find('option').remove();
		                    $('.usuario').append('<option value="" slected="selected"></option>');
		                    $('.solicitante').append('<option value="" slected="selected"></option>');
		                    document.getElementById("cargoUsuario").innerHTML="";
		                    document.getElementById("cargoSolicitante").innerHTML="";
		                    $.each(object, function (i, item) {
		                    	$('.usuario').append('<option value="' + item + '" slected="selected">' + item + '</option>');
		                    });
		                    	$('.usuario').append('<option value="ProviderOne" slected="selected">ProviderOne</option>');
		                    	$('.usuario').append('<option value="Geral" slected="selected">Geral</option>');
		                    $.each(object, function (i, item) {
		                    	$('.solicitante').append('<option value="' + item + '" slected="selected">' + item + '</option>');
		                    });	
		                    	$('.solicitante').append('<option value="ProviderOne" slected="selected">ProviderOne</option>');
		                    	$('.solicitante').append('<option value="Geral" slected="selected">Geral</option>');
		                }
		            },
			        erro : function(request, status, error) {},
			        complete : function(data) {}
		        })
    		}); 
    	});
	</script>
	<script>
    	$(document).ready(function () {
    		var divCliente = $("#nomeDoCliente");
    		divCliente.on("change", function(){
	    		var nomeCliente = $("#nomeDoCliente").val();
	    		var json = {"nomeCliente" : nomeCliente};
		        $.ajax({
		            url: "/provider/listarEmails",
		            type: "GET",
		            data: json,
		            success: function (object) {
		                if (object != null) {
		                    var selectbox = $('.destinatario');
		                    selectbox.find('option').remove();
		                    $.each(object, function (i, item) {
		                    	$('.destinatario').append('<option value="' + item + '" slected="selected">' + item + '</option>');
		                    });
		                }
		            },
			        erro : function(request, status, error) {},
			        complete : function(data) {}
		        })
    		}); 
    	});
	</script>
	<script>
    	$(document).ready(function () {
    		var divCliente = $("#nomeDoCliente");
    		divCliente.on("change", function(){
	    		var json = {"nomeCliente" : divCliente.val()};
		        $.ajax({
		            url: "/provider/getFlag",
		            type: "GET",
		            data: json,
		            success: function (object) {
		                if (object) {
		                    document.getElementById("flag").innerHTML=""; 
		                    $('#flag').append('Red Flag');
		                }else{
		                	document.getElementById("flag").innerHTML="";
		                }
		            },
			        erro : function(request, status, error) {},
			        complete : function(data) {}
		        })
		        $.ajax({
		            url: "/provider/getVip",
		            type: "GET",
		            data: json,
		            success: function (object) {
		                if (object) {
		                    document.getElementById("vip").innerHTML=""; 
		                    $('#vip').append('  Vip');
		                }else{
		                	document.getElementById("vip").innerHTML="";
		                }
		            },
			        erro : function(request, status, error) {},
			        complete : function(data) {}
		        })
    		}); 
    	});
	</script>
<script>
    	$(document).ready(function () {
    		var divCliente = $("#solicitante");
    		divCliente.on("change", function(){
	    		var json = {"solicitante" : $("#solicitante").val() , "nomeCliente" : $("#nomeDoCliente").val()};
		        $.ajax({
		            url: "/provider/getCargo",
		            type: "GET",
		            data: json,
		            success: function (object) {
		                if (object != null) {
		                    document.getElementById("cargoSolicitante").innerHTML=""; 
		                    $('#cargoSolicitante').append(object);
		                }else{
		                	document.getElementById("cargoSolicitante").innerHTML="";
		                }
		            },
			        erro : function(request, status, error) {},
			        complete : function(data) {}
		        })
    		}); 
    	});
	</script>
	<script>
    	$(document).ready(function () {
    		var divCliente = $("#usuario");
    		divCliente.on("change", function(){
	    		var json = {"solicitante" : $("#usuario").val() , "nomeCliente" : $("#nomeDoCliente").val()};
		        $.ajax({
		            url: "/provider/getCargo",
		            type: "GET",
		            data: json,
		            success: function (object) {
		                if (object != null) {
		                    document.getElementById("cargoUsuario").innerHTML=""; 
		                    $('#cargoUsuario').append(object);
		                }else{
		                	document.getElementById("cargoUsuario").innerHTML="";
		                }
		            },
			        erro : function(request, status, error) {},
			        complete : function(data) {}
		        })
    		}); 
    	});
	</script>
	<script>
		var divStatus = $("#status");
		divStatus.on("change", function(){
			var status = $("#status").val();
			if(status === 'Abrir'){
				document.getElementById('agendamentos').style.display = 'none';
			}else if(status === 'Em andamento'){
				document.getElementById('agendamentos').style.display = 'none';
			}else {
				$("#agendamentos").stop().slideToggle(1000);
			}
		} );
	</script>
    <script>
	    function limite_textarea_prob(valor) {
	        quant = 255;
	        total = valor.length;
	        if(total <= quant) {
	            resto = quant - total;
	            document.getElementById('contProb').innerHTML = resto;
	        } else {
	            document.getElementById('descricaoProblema').value = valor.substr(0,quant);
	        }
	    }
    </script>
    <script>
	    function limite_textarea_obs(valor) {
	        quant = 255;
	        total = valor.length;
	        if(total <= quant) {
	            resto = quant - total;
	            document.getElementById('contObs').innerHTML = resto;
	        } else {
	            document.getElementById('obs').value = valor.substr(0,quant);
	        }
	    }
    </script>
    <script>
		function copiaSolicitante(){
			var solicitante = $('#solicitante').val();
			$('#usuario').val(solicitante);
		}
	</script>
		<script>
    	$(document).ready(function () {
    		var divCliente = $("#solicitante");
    		divCliente.on("change", function(){
	    		var json = {"solicitante" : $("#usuario").val() , "nomeCliente" : $("#nomeDoCliente").val()};
	    		$.ajax({
		            url: "/provider/getCel",
		            type: "GET",
		            data: {"solicitante" : $("#solicitante").val() , "nomeCliente" : $("#nomeDoCliente").val()},
		            success: function (object) {
		                if (object != null) {
		                    document.getElementById("celularSolicitante").innerHTML=""; 
		                    $('#celularSolicitante').append(" - Celular: " + object);
		                }else{
		                	document.getElementById("celularSolicitante").innerHTML="";
		                }
		            },
			        erro : function(request, status, error) {},
			        complete : function(data) {}
		        })
		
    		}); 
    	});
	</script>
	<script>
    	$(document).ready(function () {
    		var divCliente = $("#usuario");
    		divCliente.on("change", function(){
	    		var json = {"solicitante" : $("#usuario").val() , "nomeCliente" : $("#nomeDoCliente").val()};
	    		$.ajax({
		            url: "/provider/getCel",
		            type: "GET",
		            data: {"solicitante" : $("#usuario").val() , "nomeCliente" : $("#nomeDoCliente").val()},
		            success: function (object) {
		                if (object != null) {
		                    document.getElementById("celularUsuario").innerHTML=""; 
		                    $('#celularUsuario').append(" - Celular: " + object);
		                }else{
		                	document.getElementById("celularUsuario").innerHTML="";
		                }
		            },
			        erro : function(request, status, error) {},
			        complete : function(data) {}
		        })
		
    		}); 
    	});
	</script>
</html>