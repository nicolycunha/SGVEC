$(document).ready(function () {
    $("#txtCode").mask("9999");
    $("#txtCodFunc").mask("9999");
    $("#txtNumEndecFunc").mask("9999");    
    $("#txtCPF").mask("999.999.999-99");
    $("#txtCpfFunc").mask("999.999.999-99");
    $("#txtRGFunc").mask("99.999.999-9");
    $("#txtTelFunc").mask("(99)9999-9999");
    $("#txtCelFunc").mask("(99)99999-9999");
    $("#txtCepFunc").mask("99999-999");

    if ($('#lblError')[0] != undefined){
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
        $('#btnSave').prop('disabled', 'false');
        $('#btnClearComponents').prop('disabled', 'false');
        DisableComponents(true);
    });

    $('#btnInsertEmployee').click(function () {
        ClearComponents();
        DisableComponents(false);
    });

    $('#btnClearComponents').click(function () {
        ClearComponents();
    });

    function ClearComponents() {
        $('#txtCodFunc').val(""); $('#txtNomeFunc').val(""); $('#txtCpfFunc').val("");
        $('#txtRGFunc').val(""); $('#txtDtNascFunc').val(""); $('#txtTelFunc').val("");
        $('#txtCelFunc').val(""); $('#txtEnderecoFunc').val(""); $('#txtNumEndecFunc').val("");
        $('#txtBairroFunc').val(""); $('#txtCepFunc').val(""); $('#txtCidadeFunc').val("");
        $('#txtUFFunc').val(""); $('#txtEmailFunc').val(""); $('#txtSenhaFunc').val("");
        $('#txtDtDeslig').val("");
    }

    function DisableComponents(value) {
        $('#txtNomeFunc').prop('disabled', value); $('#txtCpfFunc').prop('disabled', value);
        $('#txtRGFunc').prop('disabled', value); $('#txtDtNascFunc').prop('disabled', value); $('#txtTelFunc').prop('disabled', value);
        $('#txtCelFunc').prop('disabled', value); $('#txtEnderecoFunc').prop('disabled', value); $('#txtNumEndecFunc').prop('disabled', value);
        $('#txtBairroFunc').prop('disabled', value); $('#txtCepFunc').prop('disabled', value); $('#txtCidadeFunc').prop('disabled', value);
        $('#txtUFFunc').prop('disabled', value); $('#txtEmailFunc').prop('disabled', value); $('#txtSenhaFunc').prop('disabled', value);
        $('#txtDtDeslig').prop('disabled', value); $('#ddlCargoFunc').prop('disabled', value); $('#btnSave').prop('disabled', value);
    }
});