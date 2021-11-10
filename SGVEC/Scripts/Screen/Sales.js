$(document).ready(function () {
    $("#txtCode").mask("9999");
    $("#txtCpfCli").mask("999.999.999-99"); 
    $("#txtCpfFunc").mask("999.999.999-99");

    if ($('#lblError')[0] != undefined) {
        if ($('#lblError')[0].innerText != "") {
            $('#divAlertDanger').prop('style', 'display:block');
        }
    }

    if ($('#lblSucess')[0] != undefined) {
        if ($('#lblSucess')[0].innerText != "") {
            $('#divAlertSucess').prop('style', 'display:block');
        }
    }
    
    $("#gvSales tr").click(function () {
        var selected = $(this).hasClass("selecionado");
        $("#gvSales tr").removeClass("selecionado");
        if (!selected)
            $(this).addClass("selecionado");
    });
});