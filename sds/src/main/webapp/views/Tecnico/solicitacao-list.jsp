<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
	<title>TechGold | Minhas Solicita��es</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/bootstrap-table.css">
</head>
<body>
	<c:import url="barra-menus.jsp"></c:import>
	<br /><br /><br />
	<div class="container">
	<legend></legend>
		<span id="botoes-status""></span></br></br>
		<div align="center"><a class="btn btn-danger" href="solicitacoesAbertas" role="button"> ${qtdAberto} Abertas <i class="fa fa-question-circle"></i></a>
		 - <a class="btn btn-info" href="solicitacoesAndamentoTecnico" role="button">${qtdAndamento} Andamento <i class="fa fa-share"></i></a>
		 - <a class="btn btn-warning" href="solicitacoesAgendadosTecnico" role="button">${qtdAgendado} Agendadas <i class="fa fa-clock-o"></i></a>
		 - <a class="btn btn-success" href="solicitacoesAguardandoTecnico" role="button"> ${qtdAguardando} Aguardando <i class="fa fa-thumbs-o-up"></i></a>
		</div>
	</div>
	<br/>
	<legend></legend>
	<h4>Exportar Solicita��es</h4>
        <div id="toolbar">
            <select class="form-control">
               	<option value="">Exporta��o b�sica</option>
                <option value="all">Exportar todos</option>
                <option value="selected">Exportar Selecionados</option>
            </select>
        </div>
	<table id="table"
	               data-toggle="table"
	               data-show-columns="true"
	               data-show-toggle="true"
	               data-pagination="true"
	               data-show-pagination-switch="true"
	               data-search="true"
	               data-show-export="true"
	               data-click-to-select="true"
	               data-toolbar="#toolbar">
	    <thead>
			<tr>
				<th data-field="state" data-checkbox="true"></th>
				<th data-field="id" data-sortable="true">ID</th>
				<th>Data da Solicita��o</th>
				<th>Site</th>
				<th>Anexo</th>
				<th>Cliente</th>
				<th>Usu�rio Afetado</th>
				<th>Problema Relatado</th>
				<th>Status da Solicita��o</th>
				<th>A��es</th>
			</tr>
		</thead>
		<c:forEach var="solicitacao" items="${solicitacoes}">
			<tr>
				<td></td>
				<td>
					<a href="#" onclick="lancarSubmenu(${solicitacao.id})">${solicitacao.id}</a>
				</td>
				<td>
					<a class="dcontexto"> <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/>
								<c:if test="${solicitacao.prioridade == 'Cr�tico'}">
									<img class="ico_status" src="assets/img/critico.png">
								</c:if>
								<c:if test="${solicitacao.prioridade == 'Alta'}">
									<img class="ico_status" src="assets/img/alta.png">
								</c:if>
								<c:if test="${solicitacao.prioridade == 'Media'}">
									<img class="ico_status" src="assets/img/media.png">
								</c:if>
								<c:if test="${solicitacao.prioridade == 'Baixa'}">
									<img class="ico_status" src="assets/img/baixa.png">
								</c:if>
								<c:if test="${solicitacao.prioridade == 'Planejada'}">
									<img class="ico_status" src="assets/img/planejada.png">
								</c:if>	
						<span>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/> <br/>
							- Aberto por: ${solicitacao.abriuChamado}</span></a>
				</td>
				<td>${solicitacao.onsiteOffsite}</td>
				<c:if test="${solicitacao.caminhoAnexo != null}">
					<td>
						<a href="downloadAnexoSolicitacao?id=${solicitacao.id}"><i class="fa fa-paperclip fa-lg" aria-hidden="true"></i></a>
						| <a href="deleteAnexoSolicitacao?id=${solicitacao.id}"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
					</td>
				</c:if>
				<c:if test="${solicitacao.caminhoAnexo == null}">
					<td><a href="uploadAnexoSolicitacao?id=${solicitacao.id}"><i class="fa fa-cloud-upload" aria-hidden="true"></i></a></td>
				</c:if>
				<td>
					<a class="dcontexto"> ${solicitacao.cliente.nome}
							<c:if test="${solicitacao.cliente.vip == true}">
								<img class="ico_vip" src="assets/img/vip.png">
							</c:if>
							<c:if test="${solicitacao.cliente.redFlag == true}">
								<img class="ico_vip" src="assets/img/flag.png">
							</c:if>
						<span>- Tel.: ${solicitacao.cliente.telefone1} <br/>
							- Endere�o: ${solicitacao.cliente.endereco}<br/></a>
				</td>
				<td>${solicitacao.usuario}</td>
				<td>
					<a class="dcontexto"> ${solicitacao.descricaoProblema}
						<span>Resolu��o: ${solicitacao.resolucao} <br/><br/>
							Observa��o: ${solicitacao.obs}</span></a>
				</td>
				<td>
					<a class="dcontexto"><div id="status-botao"> ${solicitacao.status}</div>
					
						<c:if test="${solicitacao.status == 'Em andamento'}">
							<c:if test="${solicitacao.play == 'false'}">
								 (Pausado)
							</c:if>
						</c:if>
					
						<c:if test="${solicitacao.status != 'Aberto'}">
							<span>
								<c:if test="${solicitacao.status == 'Em andamento'}">
									<p>- Data: <f:formatDate value="${solicitacao.dataAndamento.time}" pattern="dd/MM/yyyy"/></p>
									<p>- Hora: <f:formatDate value="${solicitacao.dataAndamento.time}" pattern="HH:mm"/></p>
								</c:if>
								<c:if test="${solicitacao.status == 'Agendado'}">
									<p>- Data: <f:formatDate value="${solicitacao.agendado.time}" pattern="dd/MM/yyyy"/></p>
									<p>- Hora: <f:formatDate value="${solicitacao.agendadoHora.time}" pattern="HH:mm"/></p>
								</c:if>
									<c:if test="${solicitacao.status == 'Excluida'}">
									<p>- Data: <f:formatDate value="${solicitacao.dataFechamento.time}" pattern="dd/MM/yyyy"/></p>
									<p>- Hora: <f:formatDate value="${solicitacao.dataFechamento.time}" pattern="HH:mm"/></p>
								</c:if>
							</span>
						</c:if>
					</a>
				</td>
				<td>
					<a href="solicitacaoEdit?id=${solicitacao.id}"><i class="fa fa-pencil-square-o fa-lg"></i></a> |
					<a href="solicitacaoCopy?id=${solicitacao.id}"><i class="fa fa-copy fa-lg"></i></a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<br /><br /><br />
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap-table.js"></script>
	<script src="assets/js/bootstrap-table-export.js"></script>
	<script src="assets/js/tableExport.js"></script>
	<script src="assets/js/botoes-status.js"></script>
	<script> 
		function lancarSubmenu(id){ 
		   window.open("logDeSolicitacao?id="+id,"janela1","width=700,height=650,scrollbars=YES") 
		} 
	</script> 
</html>