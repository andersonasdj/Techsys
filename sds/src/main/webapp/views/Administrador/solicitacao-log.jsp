<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
   	<title>TechGold | Funcionario</title>
	<link rel="shortcut icon" href="assets/img/ico.png" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
</head>
<body>
		<div class="container">
		<fieldset>
			<legend>Log de solicitação</legend>
			<div class="container">
				<div class="col-xs-12 col-md-6">
					<textarea class="form-control" rows="30" style="width: 640px; height: 500px;">
						${solicitacao.andamentoDoChamado}
					</textarea>
				</div>
			</div>
			<legend></legend>
		</fieldset>
		</div>
	<c:import url="rodape.jsp"></c:import>
</body>
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.js"></script>
</html>