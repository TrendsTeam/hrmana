var VisitorSave = ({
    Control: {
        txtVisitInDateTime: ".txtVisitInDateTime",
        txtVisitOutDateTime: ".txtVisitOutDateTime"
    },
});

$(document).ready(function () {

    $(VisitorSave.Control.txtVisitInDateTime).daterangepicker({
        singleDatePicker: true,
        timePicker: true,        
        locale: {
            format: 'DD/MM/YYYY hh:mm A'
        }
    });

    $(VisitorSave.Control.txtVisitOutDateTime).daterangepicker({
        singleDatePicker: true,
        timePicker: true,
        locale: {
            format: 'DD/MM/YYYY hh:mm A'
        }
    });

});
