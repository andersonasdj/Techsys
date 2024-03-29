<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
	<title>TechGold | Computadores</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
	<link rel="stylesheet" href="assets/css/bootstrap-table.css">
</head>
<body>
	<c:import url="../barra-menus.jsp"></c:import>
	<div id="loader"></div>
	<br/><br/><br/>
		<legend>Lista de Computadores</legend>
		
		<a href="computadorForm"><i class="fa fa-plus-square-o fa-2x" aria-hidden="true"></i></a>
		<p class="pull-right">
			<a href="homePage"><i class="fa fa-reply-all fa-2x" aria-hidden="true"></i></a>
		</p>
		
		<h4>Exportar Relat�rio</h4>
	        <div id="toolbar">
	            <select class="form-control">
	                <option value="">Export Basic</option>
	                <option value="all">Export All</option>
	                <option value="selected">Export Selected</option>
	            </select>
	        </div>
		<table id="table"
	               data-toggle="table"
	               data-show-columns="true"
	               data-show-toggle="true"
	               data-pagination="true"
	               data-show-pagination-switch="true"
	               data-show-refresh="true"
	               data-search="true"
	               data-key-events="true"
	               data-show-export="true"
	               data-click-to-select="true"
	               data-toolbar="#toolbar">
	        <thead>
			<tr>
				<th data-field="state" data-checkbox="true"></th>
				<th data-field="pontuacao" data-sortable="true">Pontua��o</th>
				<th data-field="cliente" data-sortable="true">Cliente</th>
				<th data-field="funcao" data-sortable="true">Fun��o</th>
				<th data-field="nomeComputador" data-sortable="true">Hostname</th>
				<th data-field="status" data-sortable="true">Status</th>
				<th data-field="nomeUsuario" data-sortable="true">Usu�rio</th>
				<th data-field="software" data-sortable="true">Software</th>
				<th data-field="marca" data-sortable="true">Marca</th>
				<th data-field="serviceTag" data-sortable="true">Service Tag</th>
				<th data-field="processador" data-sortable="true">Processador</th>
				<th data-field="memoria" data-sortable="true">Mem�ria</th>
				<th data-field="armazenamento" data-sortable="true">Armazenamento</th>
				<th data-field="antivirus" data-sortable="true">Antivirus</th>
				<th data-field="expiracaoAV" data-sortable="true">Expira��o</th>
				<th>Fun��es</th>
			</tr>
			</thead>
			<c:forEach var="computador" items="${computadores}">
				<tr>
					<td data-field="state" data-checkbox="true"></td>					
					<td>${computador.pontos}</td>
					<td>${computador.cliente.nome}</td>
					<td>${computador.funcao}</td>
					<td>${computador.nomeComputador}</td>
					<td>${computador.status}</td>
					<td>${computador.nomeDoUsuario}</td>
					<td>
						<a class="dcontexto"> ${computador.sistemaOperacionalInstalado}
							<span>Windows Licenciado:  ${computador.sistemaOperacionalLicenciado}<br/><br/>
								Office Instalado: ${computador.officeInstalado} <br/> <br/>
								Office Licenciado: ${computador.officeLicenciado}</span></a>
					</td>
					<td>
						<a class="dcontexto"> ${computador.marca}
							<span>Service Tag: ${computador.serviceTag}</span></a>
					</td>
					<td>${computador.serviceTag}</td>
					<td>
						<a class="dcontexto">${computador.modeloProcessador}
							<span>Fam�lia: ${computador.familia} <br/>
								Tipo: ${computador.tipoProcessador} <br/>
								Freq�ncia: ${computador.frequenciaProcessador}
							</span></a>
					</td>
					<td>${computador.qtdMemoria}</td>
					<td>${computador.qtdHd}
						<c:if test="${computador.ssd}">
						 - SSD
						</c:if>
					</td>
					<td>${computador.antiVirus}</td>
					<td><f:formatDate value="${computador.expiracaoAV.time}" pattern="dd/MM/yyyy"/></td>
					<td><a href="computadorEdit?id=${computador.id}"><i class="fa fa-pencil-square-o fa-lg"></i></a> <!-- <a
						href="removeFuncionario?id=${funcionario.id}">Excluir</a> --></td>
				</tr>
			</c:forEach>
		</table>
		<br/><br/><br/><br/><br/><br/><br/>
	<legend></legend>
	<c:import url="../rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap-table.js"></script>
	<script src="assets/js/bootstrap-table-export.js"></script>
	<script src="assets/js/tableExport.js"></script>
	<script src="assets/js/bootstrap-table-key-events.js"></script>
	<script src="assets/js/ga.js"></script>
	<script type="text/javascript">
        // Este evendo � acionado ap�s o carregamento da p�gina
        jQuery(window).load(function() {
            //Ap�s a leitura da pagina o evento fadeOut do loader � acionado, esta com delay para ser perceptivo em ambiente fora do servidor.
            jQuery("#loader").delay(10).fadeOut("slow");
        });
    </script>
</html>