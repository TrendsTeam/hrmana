<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true"
    CodeBehind="EmployeeTypeSave.aspx.cs" Inherits="ERP.Modules.HRAndPayRoll.Masters.EmployeeTypeSave" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeType %>"></asp:Literal></title>
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
            <a href="<%=ResolveUrl("~/Modules/HRAndPayRoll/Masters/EmployeeTypeList.aspx") %>" title="Employee Type" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeType %>"></asp:Literal></a>
        </li>
         <li class="nav-item d-none d-sm-inline-block">
            <a href="javascript:;" title="Save Allowance Type" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveEmployeeType %>"></asp:Literal></a>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
   <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveEmployeeType %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveEmployeeType %>"></asp:Literal></h3>
                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                    <i class="fas fa fa-minus"></i>
                                </button>
                            </div>
                        </div>

                        <div class="card-body">
                             <form id="frmMain" runat="server" class="form-horizontal row-border">
                        <asp:HiddenField ID="hfId" runat="server" />
                        <div class="form-group row">
                            <label class="col-md-2">
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeType %>"></asp:Literal> <span class="required">*</span>
                            </label>
                            <div class="col-md-10">
                                <asp:TextBox ID="txtEmployeeType" MaxLength="50" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmployeeType" SetFocusOnError="true" ControlToValidate="txtEmployeeType" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Employee Type." runat="server"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                       <div class="form-group row">
                            <label class="col-md-2">
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, LeaveMonth %>"></asp:Literal> <span class="required">*</span>
                            </label>
                            <div class="col-md-10">
                                <asp:DropDownList ID="ddlLeave" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0.5">0.5</asp:ListItem>
                                    <asp:ListItem Value="1.0">1.0</asp:ListItem>
                                    <asp:ListItem Value="1.5">1.5</asp:ListItem>
                                    <asp:ListItem Value="2.0">2.0</asp:ListItem>
                                    <asp:ListItem Value="2.5">2.5</asp:ListItem>
                                    <asp:ListItem Value="3.0">3.0</asp:ListItem>
                                    <asp:ListItem Value="3.5">3.5</asp:ListItem>
                                    <asp:ListItem Value="4.0">4.0</asp:ListItem>
                                    <asp:ListItem Value="4.5">4.5</asp:ListItem>
                                    <asp:ListItem Value="5.0">5.0</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-actions">
                            <a href="/Modules/HRAndPayRoll/Masters/EmployeeTypeList.aspx" class="btn pull-right"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Cancel %>"></asp:Literal>
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
