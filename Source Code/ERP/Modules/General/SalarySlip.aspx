<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="SalarySlip.aspx.cs" Inherits="ERP.Modules.General.SalarySlip" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeSalarySlip %>"></asp:Literal></title>
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
            <a href="<%=ResolveUrl("~/Modules/General/SalarySlip.aspx") %>" title="Employee Salary Slip" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeSalarySlip %>"></asp:Literal></a>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeSalarySlip %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeSalarySlip %>"></asp:Literal></h3>
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

                                <asp:UpdatePanel ID="upMain" runat="server">
                                    <ContentTemplate>
                                        <div class="form-group row">
                                            <label class="col-md-2">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Month %>"></asp:Literal><span class="required">*</span>
                                            </label>
                                            <div class="col-md-10">
                                                <asp:DropDownList ID="ddlMonth" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvMonth" InitialValue="" SetFocusOnError="true" ControlToValidate="ddlMonth" CssClass="required" Display="Dynamic" ErrorMessage="Please select Month." runat="server"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <rsweb:ReportViewer ID="rvReportDetail" runat="server" Width="100%" Height="600px"></rsweb:ReportViewer>
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
