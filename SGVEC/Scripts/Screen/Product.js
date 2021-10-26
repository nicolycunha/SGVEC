$(document).ready(function () {
    $("#txtCode").mask("9999999999");
    $("#txtCodBarrasProduct").mask("9999999999");
    $("#txtPrecoProduct").mask("999.99");
    $("#txtCustoProduct").mask("999.999");
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
        $('#btnSave').prop('disabled', false);
        $('#btnClearComponents').prop('disabled', 'false');
        DisableComponents(true);
    });

    $('#btnInsertProduct').click(function () {
        $('#txtCodBarrasProduct').val("");
        ClearComponents();
        DisableComponents(false);
    });

    $('#btnUpdateProduct').click(function () {
        DisableComponents(false);
        $('#txtCodBarrasProduct').prop('disabled', true);
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
        $('#txtCodBarrasProduct').val(""); $('#txtNomeProduct').val("");
        $('#txtMarcaProduct').val(""); $('#txtPrecoProduct').val(""); $('#txtCustoProduct').val("");
        $('#txtDtCadProduct').val(""); $('#txtQuantidadeProduct').val(""); $('#txtDescProduct').val("");
    }

    function DisableComponents(value) {
        $('#txtCodBarrasProduct').prop('disabled', value); $('#txtNomeProduct').prop('disabled', value);
        $('#txtMarcaProduct').prop('disabled', value); $('#txtPrecoProduct').prop('disabled', value);
        $('#txtCustoProduct').prop('disabled', value); $('#txtDtCadProduct').prop('disabled', value);
        $('#txtQuantidadeProduct').prop('disabled', value); $('#txtDescProduct').prop('disabled', value);  
        $('#ddlTipoProduct').prop('disabled', value); $('#ddlFornecProduct').prop('disabled', value);         
    }
});