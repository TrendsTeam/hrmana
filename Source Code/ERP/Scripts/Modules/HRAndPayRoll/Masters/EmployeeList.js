var EmployeeList = ({
    Control: {
        gvEmployee: ".gvEmployee",
        btnDelete: ".btnDelete",
    }
});

$(document).ready(function () {
    $(EmployeeList.Control.gvEmployee).dataTable(
        {
        "aoColumnDefs": [
                { "aTargets": [8], "bSortable": false }
        ]
        }
    );

    $(document).on("click", EmployeeList.Control.btnDelete, function () {
        var confirmAns = confirm(Common.ReplacementString(Common.Variable.DeleteConfirm, ['Employee']));
        if (confirmAns == true)
            return true;
        else
            return false;
    });
});
