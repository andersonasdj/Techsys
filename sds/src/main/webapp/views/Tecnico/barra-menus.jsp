<html>
<head>
    <link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
	<nav class="navbar navbar-fixed-top navbar-inverse">
		<div class="navbar-inner">
			<div class="container">
				<div class="navbar-collapse">
					<ul class="nav">
						<li><a href="homePage"><i class="fa fa-home fa-fw"> </i> In�cio</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-bar-chart"></i> Controle de Chamado <span class="caret"></span></a>
			                  <ul class="dropdown-menu">
			                    <li class="dropdown-header">Solicita��es</li>
			                    <li><a href="solicitacaoForm"><i class="fa fa-plus-square"> </i> Abrir Solicita��o</a></li>
			                    <li role="separator" class="divider"></li>
			                    <li><a href="solicitacoesAbertas"><i class="fa fa-question-circle"> </i> Abertas</a></li>
			                    <li><a href="solicitacoesAgendadosTecnico"><i class="fa fa-clock-o"> </i> Agendadas</a></li>
			                    <li><a href="solicitacoesAndamentoTecnico"><i class="fa fa-share"> </i> Em Andamento</a></li>
			                    <li><a href="solicitacoesAguardandoTecnico"><i class="fa fa-thumbs-o-up"> </i> Aguardando usu�rio</a></li><li role="separator" class="divider"></li>
			                    <li class="dropdown-header">Relat�rio Geral</li>
			                    <li><a href="relatorioTecnico"><i class="fa fa-pie-chart"> </i> Relat�rio</a></li>
			                     <li><a href="finalizadoHoje"><i class="fa fa-pie-chart"> </i> Finalizados Hoje</a></li>
			                  </ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="fa fa-desktop"> </i> Invent�rios <span class="caret"></span></a>
			                  <ul class="dropdown-menu">
			                  	<li class="dropdown-header">Listar</li>
			                    <li><a href="computadorList">M�quinas</a></li>
			                    <li role="separator" class="divider"></li>
			                    <li class="dropdown-header">Cadastro</li>
			                    <li><a href="computadorForm">M�quinas</a></li>
			                  </ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="fa fa-desktop"> </i> Clientes <span class="caret"></span></a>
			                  <ul class="dropdown-menu">
			                    <li><a href="clientesList">Listar</a></li>
			                  </ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="fa fa-desktop"> </i> Backup <span class="caret"></span></a>
			                  <ul class="dropdown-menu">
			                  	<li class="dropdown-header">Listar</li>
			                    <li><a href="backupDiario">Todos</a></li>
			                    <li role="separator" class="divider"></li>
			                    <li class="dropdown-header">Cadastro</li>
			                    <li><a href="#">Relat�rios</a></li>
			                  </ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-file-text-o"> </i> Checklist <span class="caret"></span></a>
			                  <ul class="dropdown-menu">
			                  	<li class="dropdown-header">Listar</li>
			                    <li><a href="checkList">Por Cliente</a></li>
			                    <li><a href="listarCheckLists">Todos</a></li>
			                    <li role="separator" class="divider"></li>
			                    <li class="dropdown-header">Cadastrar</li>
			                    <li><a href="checklistForm">Novo</a></li>
			                  </ul>
						</li>
					</ul>
					
					<ul class="nav nav-pills pull-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user  fa-lg" > </i> ${tecnicoLogado.nome}<span class="caret"></span></a>
			                  <ul class="dropdown-menu">
			                  	<li><a href="#"><i class="fa fa-cloud-download"></i> SVN</a></li>
			                  	<li><a href="#"><i class="fa fa-wrench"></i> Nagios</a></li>
			                  	<li role="separator" class="divider"></li>
			                    <li><a href="atualizarDados"><i class="fa fa-cog fa-spin"></i>  Meus Dados</a></li>
			                    <li><a href="logout"><i class="fa fa-power-off"></i> Sair</a></li>
			                  </ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
</body>
</html>