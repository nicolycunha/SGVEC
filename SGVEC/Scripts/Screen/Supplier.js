$(document).ready(function () {
    $("#txtCode").mask("9999");
    $("#txtCNPJ").mask("99.999.999/9999-99");
    $("#txtCodSupplier").mask("9999");
    $("#txtCNPJSupplier").mask("99.999.999/9999-99");
    $("#txtNumTelSupplier").mask("(99)9999-9999");
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
        DisableComponents(true);
    });

    $('#btnInsertSupplier').click(function () {
        $('#txtCodSupplier').val("");
        ClearComponents();
        DisableComponents(false);
    });

    $('#btnUpdateSupplier').click(function () {
        DisableComponents(false);
    });

    $('#btnClearComponents').click(function () {
        ClearComponents();
    });

    function ClearComponents() {
        $('#txtCodSupplier').val(""); $('#txtRazaoSupplier').val(""); $('#txtCNPJSupplier').val("");
        $('#txtNumTelSupplier').val(""); $('#txtEndecSupplier').val(""); $('#txtNumSupplier').val("");
        $('#txtBairroSupplier').val(""); $('#txtCEPSupplier').val(""); $('#txtCidadeSupplier').val("");
        $('#txtUFSupplier').val("");                
    }

    function DisableComponents(value) {        
        $('#btnSave').prop('disabled', value); $('#btnClearComponents').prop('disabled', value);
        $('#txtRazaoSupplier').prop('disabled', value); $('#txtCNPJSupplier').prop('disabled', value);
        $('#txtNumTelSupplier').prop('disabled', value); $('#txtEndecSupplier').prop('disabled', value);
        $('#txtNumSupplier').prop('disabled', value); $('#txtBairroSupplier').prop('disabled', value);
        $('#txtCEPSupplier').prop('disabled', value); $('#txtCidadeSupplier').prop('disabled', value);
        $('#txtUFSupplier').prop('disabled', value); 
    }
});