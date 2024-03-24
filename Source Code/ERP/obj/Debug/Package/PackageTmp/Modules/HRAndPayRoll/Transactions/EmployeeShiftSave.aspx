<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="EmployeeShiftSave.aspx.cs" Inherits="ERP.Modules.HRAndPayRoll.Transactions.EmployeeShiftSave" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeShift %>"></asp:Literal></title>
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
            <a href="<%=ResolveUrl("~/Modules/HRAndPayRoll/Transactions/EmployeeShiftList.aspx") %>" title="Employee Shift" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeShift %>"></asp:Literal></a>
        </li>

        <li class="nav-item d-none d-sm-inline-block">
            <a href="javascript:;" title="Update Employee Shift" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, UpdateEmployeeShift %>"></asp:Literal></a>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, UpdateEmployeeShift %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, UpdateEmployeeShift %>"></asp:Literal></h3>
                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                    <i class="fas fa fa-minus"></i>
                                </button>
                            </div>
                        </div>

                        <div class="card-body">
                            <form id="frmMain" runat="server" class="form-horizontal row-border">
                                <asp:HiddenField ID="hfEmployeeId" runat="server" />

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Department %>"></asp:Literal> :
                                    </label>
                                    <div class="col-md-10 textLeft">
                                        <asp:Label ID="lblDepartment" runat="server"></asp:Label>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeName %>"></asp:Literal> :
                                    </label>
                                    <div class="col-md-10 textLeft">
                                        <asp:Label ID="lblEmployeeName" runat="server"></asp:Label>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Shift %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:DropDownList ID="ddlShift" runat="server" CssClass="form-control">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvShift" SetFocusOnError="true" ControlToValidate="ddlShift" CssClass="required" Display="Dynamic" InitialValue="" ErrorMessage="Please select Shift." runat="server"></asp:RequiredFieldValidator>

                                    </div>
                                </div>

                                <div class="form-actions">
                                    <a href="/Modules/HRAndPayRoll/Transactions/EmployeeShiftList.aspx" class="btn pull-right"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Cancel %>"></asp:Literal></a>
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
