$(document).ready(function () {
    $("#txtCode").mask("9999");
    $("#txtCpfCli").mask("999.999.999-99");
    $("#txtCpfFunc").mask("999.999.999-99");
    $("#txtNumParcSales").mask("9999");
    $("#txtValParcSales").mask("999.00");
    $("#txtDescontoSales").mask("999.00");
    $("#txtTotalSales").mask("999.00");

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

    $('#btnSearchSales').click(function () {
        $('#btnSave').prop('disabled', false);
        $('#btnClearComponents').prop('disabled', 'false');
        DisableComponents(true);
    });

    $('#btnInsertSales').click(function () {
        $('#txtCodSales').val("");
        ClearComponents();
        DisableComponents(false);
    });

    $('#btnClearComponents').click(function () {
        ClearComponents();
    });

    $("#gvSales tr").click(function () {
        var selected = $(this).hasClass("selecionado");
        $("#gvSales tr").removeClass("selecionado");
        if (!selected)
            $(this).addClass("selecionado");
    });


    function ClearComponents() {
        $('#txtNomeSales').val(""); $('#txtCpfSales').val("");
        $('#txtRGSales').val(""); $('#txtDtNascSales').val(""); $('#txtTelSales').val("");
        $('#txtCelSales').val(""); $('#txtEnderecoSales').val(""); $('#txtNumEndecSales').val("");
        $('#txtBairroSales').val(""); $('#txtCepSales').val(""); $('#txtCidadeSales').val("");
        $('#txtUFSales').val(""); $('#txtEmailSales').val(""); $('#txtSenhaSales').val("");
        $('#txtDtDeslig').val("");
    }

    function DisableComponents(value) {
        $('#txtNomeSales').prop('disabled', value); $('#txtCpfSales').prop('disabled', value);
        $('#txtRGSales').prop('disabled', value); $('#txtDtNascSales').prop('disabled', value); $('#txtTelSales').prop('disabled', value);
        $('#txtCelSales').prop('disabled', value); $('#txtEnderecoSales').prop('disabled', value); $('#txtNumEndecSales').prop('disabled', value);
        $('#txtBairroSales').prop('disabled', value); $('#txtCepSales').prop('disabled', value); $('#txtCidadeSales').prop('disabled', value);
        $('#txtUFSales').prop('disabled', value); $('#txtEmailSales').prop('disabled', value); $('#txtSenhaSales').prop('disabled', value);
        $('#txtDtDeslig').prop('disabled', value); $('#ddlCargoSales').prop('disabled', value); $('#btnSave').prop('disabled', value);
    }
});