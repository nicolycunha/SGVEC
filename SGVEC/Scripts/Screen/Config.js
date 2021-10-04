$(document).ready(function () {
    $("#txtCPF").mask("999.999.999-99");
    $("#txtCpfFunc").mask("999.999.999-99");
    $("#txtRGFunc").mask("99.999.999-9");

    //var myModal = document.getElementById('myModal')
    //var myInput = document.getElementById('myInput')

    //myModal.addEventListener('shown.bs.modal', function () {
    //    myInput.focus();
    //});

    $('#btnSearchEmployee').click(function () {
        $.ajax({
            type: "GET",
            url: "Employee.aspx/teste",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                var teste = 1;
            },
            failure: function (response) {
                alert(response.d);
            }
        });
    });
});