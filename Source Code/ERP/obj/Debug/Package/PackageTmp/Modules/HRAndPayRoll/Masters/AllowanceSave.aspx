<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="AllowanceSave.aspx.cs" Inherits="ERP.Modules.HRAndPayRoll.Masters.AllowanceSave" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Allowance %>"></asp:Literal></title>
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
            <a href="<%=ResolveUrl("~/Modules/HRAndPayRoll/Masters/AllowanceList.aspx") %>" title="Allowance" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Allowance %>"></asp:Literal></a>
        </li>
         <li class="nav-item d-none d-sm-inline-block">
            <a href="javascript:;" title="Save Allowance" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveAllowance %>"></asp:Literal></a>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
   <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveAllowance %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveAllowance %>"></asp:Literal></h3>
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
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Allowance %>"></asp:Literal> <span class="required">*</span>
                            </label>
                            <div class="col-md-10">
                                <asp:TextBox ID="txtAllowance" MaxLength="50" runat="server" CssClass="form-control"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="rfvAllowance" SetFocusOnError="true" ControlToValidate="txtAllowance" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Allowance." runat="server"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, IsConsider %>"></asp:Literal>
                            </label>
                            <div class="col-md-10">
                                <label class="checkbox">
                                    <asp:CheckBox ID="chkIsConsider" runat="server" />
                                    <span class="InfoLabel"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, AllowanceConsiderNote %>"></asp:Literal></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-actions">
                            <a href="/Modules/HRAndPayRoll/Masters/AllowanceList.aspx" class="btn pull-right"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Cancel %>"></asp:Literal>
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

