$(document).ready(function () {
    $("#txtCode").mask("9999");
    $("#txtCNPJ").mask("99.999.999/9999-99");
    $("#txtCodSupplier").mask("9999");
    $("#txtCNPJSupplier").mask("99.999.999/9999-99");
    $("#txtNumTel").mask("(99)9999-9999");
    $("#txtNumSupplier").mask("9999");
    $("#txtCEPSupplier").mask("99999-999");
    
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

    $('#btnSearchSupplier').click(function () {
        $('#btnSave').prop('disabled', false);
        $('#btnClearComponents').prop('disabled', 'false');
        DisableComponents(true);
    });

    $('#btnInsertSupplier').click(function () {
        $('#txtCodFunc').val("");
        ClearComponents();
        DisableComponents(false);
    });

    $('#btnUpdateSupplier').click(function () {
        DisableComponents(false);
        $('#txtCpfFunc').prop('disabled', true);
    });

    $('#btnClearComponents').click(function () {
        ClearComponents();
    });

    function ClearComponents() {
        $('#txtCodSupplier').val(""); $('#txtRazaoSupplier').val(""); $('#txtCNPJSupplier').val("");
        $('#txtNumTel').val(""); $('#txtEndecSupplier').val(""); $('#txtNumSupplier').val("");
        $('#txtBairroSupplier').val(""); $('#txtCEPSupplier').val(""); $('#txtCidadeSupplier').val("");
        $('#txtUFSupplier').val("");                
    }

    function DisableComponents(value) {
        $('#txtRazaoSupplier').prop('disabled', value); $('#txtCNPJSupplier').prop('disabled', value);
        $('#txtNumTel').prop('disabled', value); $('#txtEndecSupplier').prop('disabled', value);
        $('#txtNumSupplier').prop('disabled', value); $('#txtBairroSupplier').prop('disabled', value);
        $('#txtCEPSupplier').prop('disabled', value); $('#txtCidadeSupplier').prop('disabled', value);
        $('#txtUFSupplier').prop('disabled', value); 
    }
});