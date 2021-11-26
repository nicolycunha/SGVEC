$(document).ready(function () {
    DisableComponents(false);
    $("#txtCpfCli").mask("999.999.999-99");
    $("#txtCpfCliSales").mask("999.999.999-99");
    $("#txtNumParcSales").mask("9999");
    $("#txtQuantProduct").mask("9999");
    $("#txtValParcSales").mask("999.00");
    $("#txtTotalSales").mask("999.00");
    $("#txtDescontoSales").mask("99%");

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

    $('#btnClearComponentsModal').click(function () {
        ClearComponentsModal();
    });

    $("#gvSales tr").click(function () {
        var selected = $(this).hasClass("selecionado");
        $("#gvSales tr").removeClass("selecionado");
        if (!selected)
            $(this).addClass("selecionado");
    });

    $('#txtDescontoSales').focusout(function () {
        if ($('#txtDescontoSales').val() != "") {
            let intValorTotal = parseInt($('#txtTotalSales').val());
            let intValorDesc = parseInt($('#txtDescontoSales').val());

            let flVlDesconto = parseFloat((intValorDesc / 100) * intValorTotal);
            $('#txtTotalSales').val(intValorTotal - flVlDesconto);
        }
    });

    $('#txtNumParcSales').focusout(function () {
        if ($('#txtTotalSales').val() != "") {
            let intValorTotal = parseInt($('#txtTotalSales').val());
            let intNumParc = parseInt($('#txtNumParcSales').val());

            let flVlParcelas = parseFloat(intValorTotal / intNumParc);
            $('#txtValParcSales').val(flVlParcelas);
        }
    });

    $('#ddlTipoPagSales').change(function () {
        if ($('#ddlTipoPagSales').val() == "3") {
            $('#txtNumParcSales').prop('disabled', false);
        }
        else {
            $('#txtNumParcSales').prop('disabled', true);
        }
    });

    function ClearComponents() {
        $('#txtNomeCliSales').val(""); $('#txtCpfCliSales').val(""); $('#txtNumParcSales').val("");
        $('#txtValParcSales').val(""); $('#txtDescontoSales').val(""); $('#txtQuantProduct').val("");
    }

    function ClearComponentsModal() {
        $('#txtCodProduct').val(""); $('#txtNomeProduct').val(""); $('#txtQuantProduct').val("");
    }

    function DisableComponents(value) {
        $('#txtNomeCliSales').prop('disabled', value); $('#txtCpfCliSales').prop('disabled', value);
        $('#txtDescontoSales').prop('disabled', value); $('#ddlTipoPagSales').prop('disabled', value);
        $('#txtQuantProduct').prop('disabled', value);
    }
});