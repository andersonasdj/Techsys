<%@page import="java.util.Calendar"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>TechGold | Relat�rio</title>
<link rel="shortcut icon" href="assets/img/ico.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/css/bootstrap-responsive.css">
<link rel="stylesheet" href="assets/css/jquery-ui.css">
<link rel="stylesheet" href="assets/css/jquery.ui.timepiker.css">
</head>
<body>
	<c:import url="../barra-menus.jsp"></c:import>
	<br /><br /><br />
	<form action="gerarRelatorioPeriodoAberturaCliente" method="post" class="form-horizontal container">
		<fieldset></fieldset>
			<legend>Relat�rio Por data de Abertura | ${nomeDoCliente}</legend>
			<div class="control-group">
				<label class="control-label">Data de In�cio</label>
				<div class="controls">
					<input id="datepicker" name="dataInicio" type="text" placeholder="Data de inicio" maxlength="10" /> <i class="fa fa-calendar fa-lg"> </i>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Data de T�rmino</label>
				<div class="controls">
					<input id="datepickert" name="dataFim" type="text" placeholder="Data de termino" maxlength="10" /> <i class="fa fa-calendar fa-lg"> </i>
				</div>
			</div>
			<input type="hidden" name="nomeDoCliente" id="nomeDoCliente" value="${nomeDoCliente}">
			<div class="control-group">
				<label class="control-label"></label>
				<div class="controls">
					<button id="buscar" class="btn btn-success">
						Buscar <i class="fa fa-search"></i>
					</button>
					<a class="btn btn-primary" href="javascript:func()" onclick="telaImpressao()">Impress�o <i class="fa fa-share"></i></a>
				</div>
			</div>
			<legend></legend>
		</form>
		<br />
	<c:import url="../rodape.jsp"></c:import>
</body>
<script src="assets/js/jquery.js"></script>
<script src="assets/js/jquery-ui.js"></script>
<script src="assets/js/jquery.ui.timepiker.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/calendario.js"></script>
<script>
	function telaImpressao(){
		var inicio = document.getElementsByName("dataInicio")[0].value;
		var fim = document.getElementsByName("dataFim")[0].value;
		var nome = document.getElementsByName("nomeDoCliente")[0].value;
		window.open("gerarRelatorioPeriodoAberturaClienteImp?dataInicio="+inicio+"&dataFim="+fim+"&nomeDoCliente="+nome,"janela1","width=800,height=800,scrollbars=YES") 
	}
</script>
<script>
$(function(){

    jQuery('#timepicker').timepicker();
    jQuery('#datepickert').datepicker();
    

    (function( factory ) {
        if ( typeof define === "function" && define.amd ) {

            // AMD. Register as an anonymous module.
            define([ "../datepicker" ], factory );
        } else {

            // Browser globals
            factory( jQuery.datepicker );
        }
    }(function( datepicker ) {

    datepicker.regional['pt-BR'] = {
        changeMonth: true,
        changeYear: true,
        closeText: 'Fechar',
        prevText: '&#x3C;Anterior',
        nextText: 'Pr�ximo&#x3E;',
        currentText: 'Hoje',
        monthNames: ['Janeiro','Fevereiro','Mar�o','Abril','Maio','Junho',
        'Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
        monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun',
        'Jul','Ago','Set','Out','Nov','Dez'],
        dayNames: ['Domingo','Segunda-feira','Ter�a-feira','Quarta-feira','Quinta-feira','Sexta-feira','S�bado'],
        dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','S�b'],
        dayNamesMin: ['Dom','Seg','Ter','Qua','Qui','Sex','S�b'],
        weekHeader: 'Sm',
        dateFormat: 'dd-mm-yy',
        firstDay: 0,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''};
    datepicker.setDefaults(datepicker.regional['pt-BR']);

    return datepicker.regional['pt-BR'];

    }));

    (function ($) {
        $.timepicker.regional['pt-BR'] = {
            timeOnlyTitle: 'Escolha o horário',
            timeText: 'Horário',
            hourText: 'Hora',
            minuteText: 'Minutos',
            secondText: 'Segundos',
            millisecText: 'Milissegundos',
            microsecText: 'Microssegundos',
            timezoneText: 'Fuso horário',
            currentText: 'Agora',
            closeText: 'Fechar',
            timeFormat: 'HH:mm',
            amNames: ['a.m.', 'AM', 'A'],
            pmNames: ['p.m.', 'PM', 'P'],
            isRTL: false
        };
        $.timepicker.setDefaults($.timepicker.regional['pt-BR']);
    })(jQuery);
});
</script>

</html>