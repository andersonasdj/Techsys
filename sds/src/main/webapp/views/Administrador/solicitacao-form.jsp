<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
	<title>TechGold | Solicita��o de Suporte</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
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
			<p class="pull-right">
				<a href="homePage"><i class="fa fa-reply-all fa-2x" aria-hidden="true"></i></a>
			</p>
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
        	</div>
			<br/>
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
				<label class="control-label">T�cnico Respons�vel</label>
				<div class="controls">
					<select class="selectpicker alertaFuncionario" id="nomeDoFuncionario"
						name="nomeDoFuncionario">
						<option>${solicitacao.funcionario.id}</option>
						<c:forEach var="funcionario" items="${funcionarios}">
							<option>${funcionario.nome}</option> 
						</c:forEach>
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
			<div class="form-check">
			    <label class="form-check-label">
			    	Enviar E-mail na abertura
			      <input id="boxEmail" name="boxEmail" type="checkbox" class="form-check-input">
			    </label>
			    <div class="form-group" id="enviaEmail">
					<label class="control-label">Destinatario</label>
		            <div class="controls">
		                <select class="form-control destinatario" name="destinatario" id="destinatario" style="display: none"></select>
		            </div>
	       		</div>
	       		<br/>
			</div>
			<br/><br/>
			<div class="form-check">
			    <label class="form-check-label">
			    	Associar chamado a
			      <input id="boxIdChamado" name="boxIdChamado" type="checkbox" class="form-check-input">
			    </label>
			    <div class="form-group" id="enviaEmail">
					<label class="control-label">ID do Chamado</label>
		            <div class="controls">
		            	<div id="idChamado" style="display: none">
		             	   	<input class="form-control" name="idChamadoLigacao" id="idChamadoLigacao" />
		                	<a href="javascript:func()" id="buscaId"><i class="fa fa-refresh fa-lg" aria-hidden="true"></i></a>
		                	<span id="statusId" style="font-size: 15px ;color:#0101DF ; font-weight:bold"></span>
		                </div>
		            </div>
        		</div>
        		<br/>
			</div>
			<br/>
			<input type="hidden" name="abriuChamado" id="abriuChamado" value="${funcionarioLogado.nome}">
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
	<script src="assets/js/controle-vip.js"></script>
</html>