<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
	<title>TechGold | Relat�rios</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/bootstrap-table.css">
</head>
<body>
	<c:import url="../barra-menus.jsp"></c:import>
	<div id="loader"></div>
	<br /><br /><br />
		<h4>Exportar Solicita��es</h4>
	        <div id="toolbar">
	            <select class="form-control">
	                <option value="">Export Basic</option>
	                <option value="all">Export All</option>
	                <option value="selected">Export Selected</option>
	            </select>
	        </div>
	<div id="corpo" class="conteudo">
		<table id="table" 
	               data-toggle="table"
	               data-show-columns="true"
	               data-show-toggle="true"
	               data-pagination="true"
	               data-show-pagination-switch="true"
	               data-search="true"
	               data-key-events="true"
	               data-show-export="true"
	               data-click-to-select="true"
	               data-toolbar="#toolbar">
			<thead>
			<tr class="" align="center">
				<th data-field="state" data-checkbox="true"></th>
				<th data-field="id" data-sortable="true">ID</th>
				<th data-field="dataAbertura" data-sortable="true">Data Abertura</th>
				<th data-field="onsiteOffsite" data-sortable="true">Local</th>
				<th>Anexo</th>
				<th data-field="cliente" data-sortable="true">Cliente</th>
				<th data-field="usuario" data-sortable="true">Usu�rio</th>
				<th>Problema Relatado</th>
				<th data-field="dataAndamento" data-sortable="true">Andamento</th>
				<th data-field="horaAndamento" data-sortable="true">Hora</th>
				<th data-field="status" data-sortable="true">Status</th>
				<th data-field="tecnico" data-sortable="true">T�cnico</th>
				<th data-field="dataEncerramento" data-sortable="true">Encerramento</th>
				<th data-field="horaEncerramento" data-sortable="true">Hora</th>
				<th data-field="tempoDeAndamento" data-sortable="true">Dura��o</th>
				<th>A��es</th>
			</tr>
			</thead>
			<c:forEach var="solicitacao" items="${solicitacoes}">
				<c:if test="${solicitacao.status == 'Aberto'}">
					<tr class="error" align="center">
						<td data-field="state" data-checkbox="true"></td>
						<td><a href="#" onclick="lancarSubmenu(${solicitacao.id})">${solicitacao.id}</a></td>	
						<td>
							<a class="dcontexto"> <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/>
								<span>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/><br/>
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
						<td>${solicitacao.cliente.nome}</td>
						<td>${solicitacao.usuario}</td>
						<td>
							<a class="dcontexto"> ${solicitacao.descricaoProblema}
								<span>
									<c:if test="${not empty solicitacao.obs}">
										<p>- Observa��o: ${solicitacao.obs}</p>
									</c:if>
									<p>- Categoria: ${solicitacao.classificacao}</p>
								</span>
							</a>
						</td>
						<td>N�o Iniciado</td>
						<td>N�o Iniciado</td>
						<td>${solicitacao.status}</td>
						<c:if test="${empty solicitacao.funcionario.nome}">
							<td><a href="solicitacaoEdit?id=${solicitacao.id}">N�o Atribuido</a></td>
						</c:if>
						<c:if test="${not empty solicitacao.funcionario.nome}">
							<td>${solicitacao.funcionario.nome}</td>
						</c:if>
						<td></td>
						<td></td>
						<td></td>
						<td><a href="solicitacaoEdit?id=${solicitacao.id}"><i class="fa fa-pencil-square-o fa-lg"></i></a></td>
					</tr>
				</c:if>
				<c:if test="${solicitacao.status == 'Finalizado'}">
					<tr class="success" align="center">
						<td data-field="state" data-checkbox="true"></td>
						<td><a href="#" onclick="lancarSubmenu(${solicitacao.id})">${solicitacao.id}</a></td>
						<td>
							<a class="dcontexto"> <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/>
								<span>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/></span></a>
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
						<td>${solicitacao.cliente.nome}</td>
						<td>${solicitacao.usuario}</td>
						<td>
							<a class="dcontexto"> ${solicitacao.descricaoProblema}
								<span>
									<c:if test="${not empty solicitacao.resolucao}">
										<p>- Resolu��o: ${solicitacao.resolucao}</p>
									</c:if>
									<c:if test="${not empty solicitacao.obs}">
										<p>- Observa��o: ${solicitacao.obs}</p>
									</c:if>
									<p>- Categoria: ${solicitacao.classificacao}</p>
								</span>
							</a>
						</td>
						<td>
							<f:formatDate value="${solicitacao.dataAndamento.time}" pattern="dd/MM/yyyy"/>
						</td>
						<td>
							<f:formatDate value="${solicitacao.dataAndamento.time}" pattern="HH:mm"/>	
						</td>
						<td>${solicitacao.status}</td>
						<c:if test="${empty solicitacao.funcionario.nome}">
							<td><a href="solicitacaoEdit?id=${solicitacao.id}">N�o Atribuido</a></td>
						</c:if>
						<c:if test="${not empty solicitacao.funcionario.nome}">
							<td>${solicitacao.funcionario.nome}</td>
						</c:if>
						<td>
							<f:formatDate value="${solicitacao.dataFechamento.time}" pattern="dd/MM/yyyy"/>
						</td>
						<td>
							<f:formatDate value="${solicitacao.dataFechamento.time}" pattern="HH:mm"/>	
						</td>
						<td>
							${solicitacao.tempoDeAndamento}
						</td>
						<td><a href="solicitacaoEdit?id=${solicitacao.id}"><i class="fa fa-pencil-square-o fa-lg"></i></a></td>
					</tr>
				</c:if>
				<c:if test="${solicitacao.status == 'Agendado'}">
					<tr class="warning" align="center">
						<td data-field="state" data-checkbox="true"></td>
						<td><a href="#" onclick="lancarSubmenu(${solicitacao.id})">${solicitacao.id}</a></td>
						<td>
							<a class="dcontexto"> <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/>
								<span>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/><br/>
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
						<td>${solicitacao.cliente.nome}</td>
						<td>${solicitacao.usuario}</td>
						<td>
							<a class="dcontexto"> ${solicitacao.descricaoProblema}
								<span>
									<c:if test="${not empty solicitacao.obs}">
										<p>- Observa��o: ${solicitacao.obs}</p>
									</c:if>
									<p>- Categoria: ${solicitacao.classificacao}</p>
								</span>
							</a>
						</td>
						<td>N�o Iniciado</td>
						<td>N�o Iniciado</td>
						<td>
							<a class="dcontexto"> ${solicitacao.status}
								<span>
									<p>Data: <f:formatDate value="${solicitacao.agendado.time}" pattern="dd/MM/yyyy"/></p>
									<p>Hora: <f:formatDate value="${solicitacao.agendadoHora.time}" pattern="HH:mm"/></p>
								</span>
							</a>
						</td>
						<c:if test="${empty solicitacao.funcionario.nome}">
							<td><a href="solicitacaoEdit?id=${solicitacao.id}">N�o Atribuido</a></td>
						</c:if>
						<c:if test="${not empty solicitacao.funcionario.nome}">
							<td>${solicitacao.funcionario.nome}</td>
						</c:if>		
						<td></td>
						<td></td>
						<td></td>
						<td><a href="solicitacaoEdit?id=${solicitacao.id}"><i class="fa fa-pencil-square-o fa-lg"></i></a></td>
					</tr>
				</c:if>
				<c:if test="${solicitacao.status == 'Em andamento'}">
					<tr class="info" align="center">
						<td data-field="state" data-checkbox="true"></td>
						<td><a href="#" onclick="lancarSubmenu(${solicitacao.id})">${solicitacao.id}</a></td>
						<td>
							<a class="dcontexto"> <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/>
								<span>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/><br/>
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
						<td>${solicitacao.cliente.nome}</td>
						<td>${solicitacao.usuario}</td>
						<td>
							<a class="dcontexto"> ${solicitacao.descricaoProblema}
								<span>
									<c:if test="${not empty solicitacao.resolucao}">
										<p>- Resolu��o: ${solicitacao.resolucao}</p>
									</c:if>
									<c:if test="${not empty solicitacao.obs}">
										<p>- Observa��o: ${solicitacao.obs}</p>
									</c:if>
									<p>- Categoria: ${solicitacao.classificacao}</p>
								</span>
							</a>
						</td>
						<td>
							<f:formatDate value="${solicitacao.dataAndamento.time}" pattern="dd/MM/yyyy"/>
						</td>
						<td>
							<f:formatDate value="${solicitacao.dataAndamento.time}" pattern="HH:mm"/>	
						</td>
						<td>${solicitacao.status}</td>
						<c:if test="${empty solicitacao.funcionario.nome}">
							<td><a href="solicitacaoEdit?id=${solicitacao.id}">N�o Atribuido</a></td>
						</c:if>
						<c:if test="${not empty solicitacao.funcionario.nome}">
							<td>${solicitacao.funcionario.nome}</td>
						</c:if>
						<td></td>
						<td></td>
						<td></td>
						<td><a href="solicitacaoEdit?id=${solicitacao.id}"><i class="fa fa-pencil-square-o fa-lg"></i></a></td>
					</tr>
				</c:if>
				<c:if test="${solicitacao.status == 'Aguardando usuario'}">
					<tr class="info" align="center">
						<td data-field="state" data-checkbox="true"></td>
						<td><a href="#" onclick="lancarSubmenu(${solicitacao.id})">${solicitacao.id}</a></td>
						<td>
							<a class="dcontexto"> <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="dd/MM/yyyy"/>
								<span>- Hora: <f:formatDate value="${solicitacao.dataAbertura.time}" pattern="HH:mm"/><br/>
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
						<td>${solicitacao.cliente.nome}</td>
						<td>${solicitacao.usuario}</td>
						<td>
							<a class="dcontexto"> ${solicitacao.descricaoProblema}
								<span>
									<c:if test="${not empty solicitacao.resolucao}">
										<p>- Resolu��o: ${solicitacao.resolucao}</p>
									</c:if>
									<c:if test="${not empty solicitacao.obs}">
										<p>- Observa��o: ${solicitacao.obs}</p>
									</c:if>
									<p>- Categoria: ${solicitacao.classificacao}</p>
								</span>
							</a>
						</td>
						<td>-</td>
						<td>-</td>
						<td>${solicitacao.status}</td>
						<c:if test="${empty solicitacao.funcionario.nome}">
							<td><a href="solicitacaoEdit?id=${solicitacao.id}">N�o Atribuido</a></td>
						</c:if>
						<c:if test="${not empty solicitacao.funcionario.nome}">
							<td>${solicitacao.funcionario.nome}</td>
						</c:if>
						<td></td>
						<td></td>
						<td></td>
						<td><a href="solicitacaoEdit?id=${solicitacao.id}"><i class="fa fa-pencil-square-o fa-lg"></i></a></td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>
	<div class="control-group">
			<label class="control-label"></label>
			<div class="controls" align="center">
				<button id="enviar" name="salvar" class="btn btn-success" onclick="cont();" >Imprimir <i class="fa fa-print fa-lg"></i></button>
			</div>
	</div>
	<br /><br />
	<legend></legend>
	<c:import url="../rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap-table.js"></script>
	<script src="assets/js/bootstrap-table-export.js"></script>
	<script src="assets/js/tableExport.js"></script>
	<script src="assets/js/bootstrap-table-key-events.js"></script>
	<script> 
		function lancarSubmenu(id){ 
		   window.open("logDeSolicitacao?id="+id,"janela1","width=700,height=650,scrollbars=YES") 
		} 
	</script>
	<script> 
		function imprimirRelatorio(id){ 
		   window.open("logDeSolicitacao?id="+id,"janela1","width=700,height=650,scrollbars=YES") 
		} 
	</script>
	<script>
		function cont(){
		   var conteudo = document.getElementById('corpo').innerHTML;
		   tela_impressao = window.open('about:blank');
		   tela_impressao.document.write(conteudo);
		   tela_impressao.window.print();
		   tela_impressao.window.close();
		}
	</script>
	<script type="text/javascript">
        // Este evendo � acionado ap�s o carregamento da p�gina
        jQuery(window).load(function() {
            //Ap�s a leitura da pagina o evento fadeOut do loader � acionado, esta com delay para ser perceptivo em ambiente fora do servidor.
            jQuery("#loader").delay(10).fadeOut("slow");
        });
    </script>
    <script>
	    var $table = $('#table');
	    $(function () {
	        $('#toolbar').find('select').change(function () {
	            $table.bootstrapTable('refreshOptions', {
	                exportDataType: $(this).val()
	            });
	        });
	    })
	</script>
</html>