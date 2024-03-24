<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="FinancialYearSave.aspx.cs" Inherits="ERP.Modules.General.FinancialYearSave" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, FinancialYear %>"></asp:Literal></title>
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
            <a href="<%=ResolveUrl("~/Modules/General/FinancialYearList.aspx") %>" title="Financial Year" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, FinancialYear %>"></asp:Literal></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="<%=ResolveUrl("~/Modules/General/FinancialYearSave.aspx") %>" title="Save Financial Year" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveFinancialYear %>"></asp:Literal></a>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveFinancialYear %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveFinancialYear %>"></asp:Literal></h3>
                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                    <i class="fas fa fa-minus"></i>
                                </button>
                            </div>
                        </div>

                        <div class="card-body">
                            <form id="frmMain" runat="server" class="form-horizontal row-border">
                                <asp:ScriptManager ID="smMain" runat="server"></asp:ScriptManager>
                                <script src="<%=ResolveUrl("~/Scripts/Loader.js")%>"></script>
                                <asp:UpdatePanel ID="upMain" runat="server">
                                    <ContentTemplate>
                                        <div class="form-group row">
                                            <label class="col-md-2">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Year %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-10">
                                                <asp:DropDownList ID="ddlYear" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvYear" SetFocusOnError="true" ControlToValidate="ddlYear" CssClass="required" Display="Dynamic" InitialValue="" ErrorMessage="Please select Year." runat="server"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-2">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, FinancialYear %>"></asp:Literal> :
                                            </label>
                                            <div class="col-md-10 textLeft">
                                                <asp:Label ID="lblFinancialYear" runat="server" CssClass="lblFinancialYear"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-2">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, FinancialMonth %>"></asp:Literal><span class="required">*</span>
                                            </label>
                                            <div class="col-md-10">
                                                <asp:DropDownList ID="ddlFinancialMonth" runat="server" CssClass="form-control" AutoPostBack="false">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvFinancialMonth" InitialValue="" SetFocusOnError="true" ControlToValidate="ddlFinancialMonth" CssClass="required" Display="Dynamic" ErrorMessage="Please select Financial Month." runat="server"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                                <div class="form-actions">
                                    <a href="/Modules/General/FinancialYearList.aspx" class="btn pull-right"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Cancel %>"></asp:Literal>
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
