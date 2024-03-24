<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="ERP.Modules.ChangePassword" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ChangePassword %>"></asp:Literal></title>
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
            <a href="<%=ResolveUrl("~/Modules/ChangePassword.aspx") %>" title="Change Password" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ChangePassword %>"></asp:Literal></a>
        </li>
    </ul>

</asp:Content>

<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">

    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ChangePassword %>"></asp:Literal></h3>
                </div>

            </div>
        </div>
        <!-- /.container-fluid -->
    </section>

    <section class="content">
        <div class="container-fluid">

            <div class="row">
                <div class="col-md-12">

                    <div class="card card-primary">
                        <div class="card-header border-transparent">
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ChangePassword %>"></asp:Literal></h3>
                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                    <i class="fas fa fa-minus"></i>
                                </button>
                            </div>
                        </div>

                        <div class="card-body">
                            <form id="frmChangePassword" runat="server" class="form-horizontal row-border">
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, OldPassword %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtOldPassword" MaxLength="20" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvOldPassword" SetFocusOnError="true" ControlToValidate="txtOldPassword" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Old Password." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, NewPassword %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtNewPassword" MaxLength="20" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvNewPassword" SetFocusOnError="true" ControlToValidate="txtNewPassword" CssClass="required" Display="Dynamic" ErrorMessage="Please enter New Password." runat="server"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revNewPassword" SetFocusOnError="true" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{8,20}$" ControlToValidate="txtNewPassword" CssClass="required" Display="Dynamic" ErrorMessage="New Password should be alphanumeric characters with minimum of 8 characters and maximum of 20 characters." runat="server"></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ConfirmPassword %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtConfirmPassword" MaxLength="20" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:CompareValidator ID="cvConfirmPassword" SetFocusOnError="true" ControlToValidate="txtConfirmPassword" ControlToCompare="txtNewPassword" CssClass="required" Display="Dynamic" ErrorMessage="New Password and confirm password do not match." runat="server"></asp:CompareValidator>
                                    </div>
                                </div>

                                <div class="form-actions">
                                    <a href="/Modules/Main.aspx" class="btn pull-right"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Cancel %>"></asp:Literal>
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
