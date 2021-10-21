$(document).ready(function () {
    $("#txtCode").mask("9999");
    $("#txtCodEmployee").mask("9999");
    $("#txtNumEndecEmployee").mask("9999");
    $("#txtCPF").mask("999.999.999-99");
    $("#txtCpfEmployee").mask("999.999.999-99");
    $("#txtRGEmployee").mask("99.999.999-9");
    $("#txtTelEmployee").mask("(99)9999-9999");
    $("#txtCelEmployee").mask("(99)99999-9999");
    $("#txtCepEmployee").mask("99999-999");

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

    $('#btnSearchEmployee').click(function () {
        $('#btnSave').prop('disabled', false);
        $('#btnClearComponents').prop('disabled', 'false');
        DisableComponents(true);
    });

    $('#btnInsertEmployee').click(function () {
        $('#txtCodEmployee').val("");
        ClearComponents();
        DisableComponents(false);
    });

    $('#btnUpdateEmployee').click(function () {
        DisableComponents(false);
        $('#txtCpfEmployee').prop('disabled', true);
    });

    $('#btnClearComponents').click(function () {
        ClearComponents();
    });

    function ClearComponents() {
        $('#txtNomeEmployee').val(""); $('#txtCpfEmployee').val("");
        $('#txtRGEmployee').val(""); $('#txtDtNascEmployee').val(""); $('#txtTelEmployee').val("");
        $('#txtCelEmployee').val(""); $('#txtEnderecoEmployee').val(""); $('#txtNumEndecEmployee').val("");
        $('#txtBairroEmployee').val(""); $('#txtCepEmployee').val(""); $('#txtCidadeEmployee').val("");
        $('#txtUFEmployee').val(""); $('#txtEmailEmployee').val(""); $('#txtSenhaEmployee').val("");
        $('#txtDtDeslig').val("");
    }

    function DisableComponents(value) {
        $('#txtNomeEmployee').prop('disabled', value); $('#txtCpfEmployee').prop('disabled', value);
        $('#txtRGEmployee').prop('disabled', value); $('#txtDtNascEmployee').prop('disabled', value); $('#txtTelEmployee').prop('disabled', value);
        $('#txtCelEmployee').prop('disabled', value); $('#txtEnderecoEmployee').prop('disabled', value); $('#txtNumEndecEmployee').prop('disabled', value);
        $('#txtBairroEmployee').prop('disabled', value); $('#txtCepEmployee').prop('disabled', value); $('#txtCidadeEmployee').prop('disabled', value);
        $('#txtUFEmployee').prop('disabled', value); $('#txtEmailEmployee').prop('disabled', value); $('#txtSenhaEmployee').prop('disabled', value);
        $('#txtDtDeslig').prop('disabled', value); $('#ddlCargoEmployee').prop('disabled', value); $('#btnSave').prop('disabled', value);
    }
});