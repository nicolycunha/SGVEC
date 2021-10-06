$(document).ready(function () {
    $("#txtCPF").mask("999.999.999-99");
    $("#txtCpfFunc").mask("999.999.999-99");
    $("#txtRGFunc").mask("99.999.999-9");

    $('#btnSearchEmployee').click(function () {
        $('#lblValue').val("1");
        $('#btnSave').prop('disabled', 'false');
        $('#btnClearComponents').prop('disabled', 'false');
    });

    $('#btnInsertEmployee').click(function () {
        ClearComponents();
        $('#lblValue').val("0");
    });

    $('#btnUpdateEmployee').click(function () {
        $('#lblValue').val("2");
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
});