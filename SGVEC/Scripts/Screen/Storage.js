$(document).ready(function () {
    $("#txtCode").mask("9999999999");
    $("#txtCodBarrasStorage").mask("9999999999");
    $("#txtPrecoStorage").mask("999.00");
    $("#txtCustoStorage").mask("999.00");
    $("#txtQuantidadeStorage").mask("99999");

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

    $('#btnSearchStorage').click(function () {
        DisableComponents(true);
    });

    $('#btnInsertStorage').click(function () {
        ClearComponents();
        DisableComponents(false);
    });

    $('#btnUpdateStorage').click(function () {
        DisableComponents(false);
        $('#txtCodBarrasStorage').prop('disabled', true);
        $('#txtNomeStorage').prop('disabled', true);
    });

    $('#btnClearComponents').click(function () {
        ClearComponents();
    });

    $("#gvStorage tr").click(function () {
        var selected = $(this).hasClass("selecionado");
        $("#gvStorage tr").removeClass("selecionado");
        if (!selected)
            $(this).addClass("selecionado");
    });

    function ClearComponents() {
        $('#txtCodBarrasStorage').val(""); $('#txtNomeStorage').val(""); $('#txtQuantidadeStorage').val("");
    }

    function DisableComponents(value) {
        $('#btnSave').prop('disabled', value); $('#btnClearComponents').prop('disabled', value);        
        $('#txtCodBarrasStorage').prop('disabled', value); $('#txtNomeStorage').prop('disabled', value);        
        $('#txtQuantidadeStorage').prop('disabled', value);
    }
});