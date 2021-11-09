$(document).ready(function () {
    $("#txtCode").mask("9999");
    $("#txtCodSales").mask("9999");
    $("#txtCpfCli").mask("999.999.999-99"); 
    $("#txtCpfCliSales").mask("999.999.999-99");
    $("#txtCpfFunc").mask("999.999.999-99");
    $("#txtNumParcSales").mask("9999");
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

    $('#btnSearchSales').click(function () {
        $('#btnSave').prop('disabled', false);
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

    $('#txtDescontoSales').focusout(function () {
        if ($('#txtDescontoSales').val() != "") {
            let intNumParcSales = parseFloat($('#txtNumParcSales').val());
            let intValParcSales = parseFloat($('#txtValParcSales').val());
            let intValorDesc = parseInt($('#txtDescontoSales').val());

            let intValorTotal = intValParcSales * intNumParcSales;
            let flVlDesconto = parseFloat((intValorDesc / 100) * intValorTotal);
            $('#txtTotalSales').val(intValorTotal - flVlDesconto);
        }
    });

    $('#txtValParcSales').focusout(function () {
        if ($('#txtNumParcSales').val() != "" && $('#txtNumParcSales').val() != "0") {
            if ($('#txtDescontoSales').val() != "") {
                let intNumParcSales = parseFloat($('#txtNumParcSales').val());
                let intValParcSales = parseFloat($('#txtValParcSales').val());
                let intValorDesc = parseInt($('#txtDescontoSales').val());

                let intValorTotal = intValParcSales * intNumParcSales;
                let flVlDesconto = parseFloat((intValorDesc / 100) * intValorTotal);
                $('#txtTotalSales').val(intValorTotal - flVlDesconto);
            }
            else {
                let intNumParcSales = parseInt($('#txtNumParcSales').val());
                let intValParcSales = parseInt($('#txtValParcSales').val());
                $('#txtTotalSales').val(intValParcSales * intNumParcSales);
            }
        }
        else {
            $('#txtTotalSales').val($('#txtValParcSales').val());
        }
    });

    function ClearComponents() {
        $('#txtCodSales').val(""); $('#txtNomeCliSales').val(""); $('#txtCpfCliSales').val("");
        $('#txtDtSales').val(""); $('#txtNumParcSales').val(""); $('#txtValParcSales').val("");
        $('#txtDescontoSales').val(""); $('#txtTotalSales').val(""); 
    }

    function DisableComponents(value) {
        $('#txtNomeCliSales').prop('disabled', value); $('#txtCpfCliSales').prop('disabled', value); $('#txtDtSales').prop('disabled', value);
        $('#txtNumParcSales').prop('disabled', value); $('#txtValParcSales').prop('disabled', value); $('#txtDescontoSales').prop('disabled', value);
        $('#txtTotalSales').prop('disabled', value); $('#ddlTipoPagSales').prop('disabled', value); 
    }
});