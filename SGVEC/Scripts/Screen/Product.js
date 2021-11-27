$(document).ready(function () {
    $("#txtCode").mask("9999999999");
    $("#txtCodBarrasProduct").mask("9999999999");
    $("#txtPrecoProduct").mask("999.00");
    $("#txtCustoProduct").mask("999.00");
    $("#txtQuantidadeProduct").mask("99999");

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

    $('#btnSearchProduct').click(function () {        
        DisableComponents(true);
    });

    $('#btnInsertProduct').click(function () {
        ClearComponents();
        DisableComponents(false);
    });

    $('#btnUpdateProduct').click(function () {
        DisableComponents(false);
        $('#txtCodBarrasProduct').prop('disabled', true);
        $('#txtNomeProduct').prop('disabled', true);
        $('#txtQuantidadeProduct').prop('disabled', true);
    });

    $('#btnClearComponents').click(function () {
        ClearComponents();
    });

    $("#gvProduct tr").click(function () {
        var selected = $(this).hasClass("selecionado");
        $("#gvProduct tr").removeClass("selecionado");
        if (!selected)
            $(this).addClass("selecionado");
    });

    function ClearComponents() {
        $('#txtCodBarrasProduct').val(""); $('#txtNomeProduct').val(""); $('#txtMarcaProduct').val("");
        $('#txtPrecoProduct').val(""); $('#txtCustoProduct').val(""); $('#txtQuantidadeProduct').val(""); $('#txtDescProduct').val("");
    }

    function DisableComponents(value) {
        $('#btnSave').prop('disabled', value); $('#btnClearComponents').prop('disabled', value);
        $('#txtCodBarrasProduct').prop('disabled', value); $('#txtNomeProduct').prop('disabled', value);
        $('#txtMarcaProduct').prop('disabled', value); $('#txtPrecoProduct').prop('disabled', value);
        $('#txtCustoProduct').prop('disabled', value); $('#txtQuantidadeProduct').prop('disabled', value);
        $('#txtDescProduct').prop('disabled', value); $('#ddlTipoProduct').prop('disabled', value);
        $('#ddlFornecProduct').prop('disabled', value);         
    }
});