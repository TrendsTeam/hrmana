var EmployeeSave = ({
    Control: {
        txtBirthDate: ".txtBirthDate",
        txtJoinDate: ".txtJoinDate",
        btnDeletePhoto: ".btnDeletePhoto",
        divUploadPhoto: ".divUploadPhoto",
        divViewPhoto: ".divViewPhoto",
    },
    ShowHideDocument:function(divViewDocument,divUploadDocument)
    {
        $(divViewDocument).hide();
        $(divUploadDocument).show();
    },
});

$(document).ready(function () {
    $(EmployeeSave.Control.txtBirthDate).daterangepicker({ singleDatePicker: true, maxDate: new Date() });
    $(EmployeeSave.Control.txtJoinDate).daterangepicker({ singleDatePicker: true });

    $(document).on("click", EmployeeSave.Control.btnDeletePhoto, function () {
        $(EmployeeSave.Control.divUploadPhoto).show();
        $(EmployeeSave.Control.divViewPhoto).hide();
        ValidatorEnable($("[id$='rfvPhoto']")[0], true);
        ValidatorEnable($("[id$='revPhoto']")[0], true);
    });
});
