<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="EmployeeLoanSave.aspx.cs" Inherits="ERP.Modules.HRAndPayRoll.Transactions.EmployeeLoanSave" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeLoan %>"></asp:Literal></title>
    <link href="<%=ResolveUrl("~/Styles/daterangepicker.css")%>" rel="stylesheet" />
    <script src="<%=ResolveUrl("~/Scripts/moment.min.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/daterangepicker.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/Modules/HRAndPayRoll/Transactions/EmployeeLoanSave.js")%>"></script>
</asp:Content>
<asp:Content ID="cBreadCrumb" ContentPlaceHolderID="cphBreadCrumb" runat="server">
    <ul class="navbar-nav">
        <li class="nav-item d-none d-sm-inline-block">
            <a href="<%=ResolveUrl("~/Modules/Main.aspx") %>" class="nav-link">
                <i class="fa fa-home"></i>
                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Dashboard %>"></asp:Literal>
            </a>
        </li>

        <li class="nav-item d-none d-sm-inline-block">
            <a href="<%=ResolveUrl("~/Modules/HRAndPayRoll/Transactions/EmployeeLoanList.aspx") %>" title="Employee Loan" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeLoan %>"></asp:Literal></a>
        </li>

        <li class="nav-item d-none d-sm-inline-block">
            <a href="javascript:;" title="Save Employee Loan" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveEmployeeLoan %>"></asp:Literal></a>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveEmployeeLoan %>"></asp:Literal></h3>
                </div>
            </div>
        </div>
    </section>

    <section class="content">
        <div class="container-fluid">

            <div class="row">
                <div class="col-md-12">

                    <div class="card card-primary">
                        <div class="card-header border-transparent">
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveEmployeeLoan %>"></asp:Literal></h3>
                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                    <i class="fas fa fa-minus"></i>
                                </button>
                            </div>
                        </div>

                        <div class="card-body">
                            <form id="frmMain" runat="server" class="form-horizontal row-border">
                                <script src="<%=ResolveUrl("~/Scripts/Loader.js")%>"></script>
                                <asp:ScriptManager ID="smMain" runat="server"></asp:ScriptManager>
                                <asp:HiddenField ID="hfId" runat="server" />

                                <asp:UpdatePanel ID="upMain" runat="server">
                                    <ContentTemplate>
                                        <div class="form-group row">
                                            <label class="col-md-2">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Department %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-10">
                                                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvDepartment" InitialValue="" SetFocusOnError="true" ControlToValidate="ddlDepartment" CssClass="required" Display="Dynamic" ErrorMessage="Please select Department." runat="server"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-2">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Employee %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-10">
                                                <asp:DropDownList ID="ddlEmployee" CssClass="form-control" runat="server"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvEmployee" InitialValue="" SetFocusOnError="true" ControlToValidate="ddlEmployee" CssClass="required" Display="Dynamic" ErrorMessage="Please select Employee." runat="server"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Title %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtTitle" MaxLength="100" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvTitle" SetFocusOnError="true" ControlToValidate="txtTitle" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Title." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, LoanDate %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10 date-select">
                                        <input type="text" runat="server" readonly="" id="txtLoanDate" class="form-control txtLoanDate" />
                                        <asp:RequiredFieldValidator ID="rfvLoanDate" SetFocusOnError="true" ControlToValidate="txtLoanDate" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Loan Date." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Amount %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtAmount" runat="server" MaxLength="12" onkeyup="EmployeeLoanSave.CalculateInstallment()" onkeypress="return Common.isNumericKey(event,this);" CssClass="form-control txtAmount"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvAmount" SetFocusOnError="true" ControlToValidate="txtAmount" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Amount." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalMonths %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtTotalMonths" MaxLength="3" onkeyup="EmployeeLoanSave.CalculateInstallment()" onkeypress="return Common.isNumberKey(event)" runat="server" CssClass="form-control txtTotalMonths"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvTotalMonths" SetFocusOnError="true" ControlToValidate="txtTotalMonths" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Total Months." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, InstallmentMonth %>"></asp:Literal>
                                    </label>
                                    <div class="col-md-10">
                                        <div id="lblInstallment" runat="server" class="lblInstallment"></div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ApprovedBy %>"></asp:Literal><span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtApprovedBy" MaxLength="150" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvApprovedBy" SetFocusOnError="true" ControlToValidate="txtApprovedBy" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Approved By." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Description %>"></asp:Literal>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtDescription" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-actions">
                                    <a href="/Modules/HRAndPayRoll/Transactions/EmployeeLoanList.aspx" class="btn pull-right"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Cancel %>"></asp:Literal>
                                    </a>
                                    <asp:Button CssClass="btn btn-success pull-right" ID="btnSave" OnClick="btnSave_Click" runat="server" Text="<%$Resources:GlobalStrings, Save %>" />

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>


