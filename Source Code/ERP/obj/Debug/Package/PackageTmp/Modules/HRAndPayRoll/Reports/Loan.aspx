<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="Loan.aspx.cs" Inherits="ERP.Modules.HRAndPayRoll.Reports.Loan" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, LoanReport %>"></asp:Literal></title>
    <link href="<%=ResolveUrl("~/Styles/fSelect.css")%>" rel="stylesheet" />
    <script src="<%=ResolveUrl("~/Scripts/fSelect.js")%>"></script>
    <link href="<%=ResolveUrl("~/Styles/multiselect.css")%>" rel="stylesheet" />
    <script src="<%=ResolveUrl("~/Scripts/multiselect.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/Modules/HRAndPayRoll/Reports/Loan.js")%>"></script>
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
            <a href="<%=ResolveUrl("~/Modules/HRAndPayRoll/Reports/Loan.aspx") %>" title="Loan Report" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, LoanReport %>"></asp:Literal></a>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, LoanReport %>"></asp:Literal></h3>
                </div>
            </div>
        </div>
    </section>
    <section class="content">
        <div class="container-fluid">

            <div class="row">
                <div class="col-md-12">
                    <div class="card card-primary">
                        <div class="card-body">
                            <form id="frmMain" runat="server" class="form-horizontal row-border">
                                <script src="<%=ResolveUrl("~/Scripts/Loader.js")%>"></script>
                                <asp:ScriptManager ID="smMain" runat="server"></asp:ScriptManager>

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Department %>"></asp:Literal><span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvDepartment" InitialValue="" SetFocusOnError="true" ControlToValidate="ddlDepartment" CssClass="required" Display="Dynamic" ErrorMessage="Please select Department." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeName %>"></asp:Literal><span class="required">*</span>
                                    </label>
                                    <div class="col-md-6">
                                        <asp:ListBox SelectionMode="Multiple" ID="lbEmployees" runat="server" CssClass="lbEmployees"></asp:ListBox>
                                        <asp:RequiredFieldValidator ID="rfvEmployees" runat="server" SetFocusOnError="true" InitialValue=""
                                            ControlToValidate="lbEmployees" ErrorMessage="Please select atleast one employee." Display="Dynamic" CssClass="required"
                                            Text="Please select atleast one employee."> 
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Status %>"></asp:Literal> :
                                    </label>
                                    <div class="col-md-10">
                                        <label class="radio-inline">
                                            <asp:RadioButton ID="rbtnAll" runat="server" Text="<%$Resources:GlobalStrings, All %>" GroupName="Status" Checked="true" />
                                        </label>
                                        <label class="radio-inline">
                                            <asp:RadioButton ID="rbtnCompleted" runat="server" Text="<%$Resources:GlobalStrings, Completed %>" GroupName="Status" />
                                        </label>
                                        <label class="radio-inline">
                                            <asp:RadioButton ID="rbtnPending" runat="server" Text="<%$Resources:GlobalStrings, Pending %>" GroupName="Status" />
                                        </label>
                                    </div>
                                </div>

                                <asp:UpdatePanel ID="upMain" runat="server">
                                    <ContentTemplate>
                                        <div class="form-group row">
                                            <label class="col-md-2">
                                            </label>
                                            <div class="col-md-10">
                                                <asp:Button CssClass="btn btn-success" ID="btnGenerateReport" OnClick="btnGenerateReport_Click" runat="server" Text="<%$Resources:GlobalStrings, GenerateReport %>" />

                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <rsweb:ReportViewer ID="rvReportDetail" Visible="true" runat="server" Width="100%" Height="600px"></rsweb:ReportViewer>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
