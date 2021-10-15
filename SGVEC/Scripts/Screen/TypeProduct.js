$(document).ready(function () {
    $("#txtCode").mask("9999");
    $("#txtCodTypeProduct").mask("9999");

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

    $('#btnSearchTypeProduct').click(function () {
        $('#btnSave').prop('disabled', true);
        $('#btnClearComponents').prop('disabled', true);
        $('#txtNameTpProduct').prop('disabled', true);        
    });

    $('#btnInsertTypeProduct').click(function () {
        $('#txtCodTpProduct').val("");
        $('#txtNameTpProduct').val(""); 
        $('#btnSave').prop('disabled', false);
        $('#btnClearComponents').prop('disabled', false);
        $('#txtNameTpProduct').prop('disabled', false);
    });

    $('#btnUpdateTypeProduct').click(function () {
        $('#btnSave').prop('disabled', false);
        $('#btnClearComponents').prop('disabled', false);
        $('#txtNameTpProduct').prop('disabled', false);
    });

    $('#btnClearComponents').click(function () {
        $('#txtNameTpProduct').val(""); 
    });
});