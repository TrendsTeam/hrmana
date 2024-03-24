var VisitorList = ({
    Control: {
        gvVisitor: ".gvVisitor",
        btnDelete: ".btnDelete",
    }
});

$(document).ready(function () {
    $(VisitorList.Control.gvVisitor).dataTable(
        {
            "aoColumnDefs": [
                    { "aTargets": [8], "bSortable": false }
            ]
        }
    );

    $(document).on("click", VisitorList.Control.btnDelete, function () {
        var confirmAns = confirm(Common.ReplacementString(Common.Variable.DeleteConfirm, ['Visitor']));
        if (confirmAns == true)
            return true;
        else
            return false;
    });

});
