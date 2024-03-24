﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true"
    CodeBehind="StateSave.aspx.cs" Inherits="ERP.Modules.HRAndPayRoll.Masters.StateSave" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, State %>"></asp:Literal></title>
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
            <a href="<%=ResolveUrl("~/Modules/HRAndPayRoll/Masters/StateList.aspx") %>" title="State" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, State %>"></asp:Literal></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="javascript:;" title="Save State" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveState %>"></asp:Literal></a>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveState %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveState %>"></asp:Literal></h3>
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
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Country %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvCountry" SetFocusOnError="true" ControlToValidate="ddlCountry" CssClass="required" Display="Dynamic" InitialValue="" ErrorMessage="Please select Country." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, StateName %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtStateName" MaxLength="100" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvStateName" SetFocusOnError="true" ControlToValidate="txtStateName" CssClass="required" Display="Dynamic" ErrorMessage="Please enter State Name." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-actions">
                                    <a href="/Modules/HRAndPayRoll/Masters/StateList.aspx" class="btn pull-right"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Cancel %>"></asp:Literal>
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
