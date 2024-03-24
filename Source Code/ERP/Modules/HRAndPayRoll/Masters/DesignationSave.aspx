<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="DesignationSave.aspx.cs" Inherits="ERP.Modules.HRAndPayRoll.Masters.DesignationSave" %>
<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
     <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Designation %>"></asp:Literal></title>
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
            <a href="<%=ResolveUrl("~/Modules/HRAndPayRoll/Masters/DesignationList.aspx") %>" title="Designation" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Designation %>"></asp:Literal></a>
        </li>
         <li class="nav-item d-none d-sm-inline-block">
            <a href="javascript:;" title="Save Designation" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveDesignation %>"></asp:Literal></a>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
   <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveDesignation %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveDesignation %>"></asp:Literal></h3>
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
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Designation %>"></asp:Literal> <span class="required">*</span>
                            </label>
                            <div class="col-md-10">
                                <asp:TextBox ID="txtDesignation" MaxLength="100" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvDesignation" SetFocusOnError="true" ControlToValidate="txtDesignation" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Designation." runat="server"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-actions">
                            <a href="/Modules/HRAndPayRoll/Masters/DesignationList.aspx" class="btn pull-right"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Cancel %>"></asp:Literal>
                            </a>
                            <asp:Button CssClass="btn btn-success pull-right" ID="btnSave"  runat="server" Text="<%$Resources:GlobalStrings, Save %>" OnClick="btnSave_Click" />

                        </div>
                    </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
   
</asp:Content>
