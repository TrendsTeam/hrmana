<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="VisitorSave.aspx.cs" Inherits="ERP.Modules.General.VisitorSave" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title>
        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Visitor %>"></asp:Literal></title>
    <link href="<%=ResolveUrl("~/Styles/daterangepicker.css")%>" rel="stylesheet" />
    <script src="<%=ResolveUrl("~/Scripts/moment.min.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/daterangepicker.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/Modules/General/VisitorSave.js")%>"></script>
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
            <a href="<%=ResolveUrl("~/Modules/General/VisitorList.aspx") %>" title="Allowance" class="nav-link">
                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Visitor %>"></asp:Literal></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="javascript:;" title="Save Visitor" class="nav-link">
                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveVisitor %>"></asp:Literal></a>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3>
                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveVisitor %>"></asp:Literal></h3>
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
                            <h3 class="card-title">
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveVisitor %>"></asp:Literal></h3>
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
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, FullName %>"></asp:Literal>
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtFullName" MaxLength="150" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvFullName" SetFocusOnError="true" ControlToValidate="txtFullName" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Full Name." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, NoOfPerson %>"></asp:Literal>
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:DropDownList ID="ddlNoOfPerson" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="">-- Select --</asp:ListItem>
                                            <asp:ListItem Value="1">1</asp:ListItem>
                                            <asp:ListItem Value="2">2</asp:ListItem>
                                            <asp:ListItem Value="3">3</asp:ListItem>
                                            <asp:ListItem Value="4">4</asp:ListItem>
                                            <asp:ListItem Value="5">5</asp:ListItem>
                                            <asp:ListItem Value="6">6</asp:ListItem>
                                            <asp:ListItem Value="7">7</asp:ListItem>
                                            <asp:ListItem Value="8">8</asp:ListItem>
                                            <asp:ListItem Value="9">9</asp:ListItem>
                                            <asp:ListItem Value="10">10</asp:ListItem>
                                            <asp:ListItem Value="11">More than 10</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvNoOfPerson" SetFocusOnError="true" ControlToValidate="ddlNoOfPerson" CssClass="required" Display="Dynamic" InitialValue="" ErrorMessage="Please select No Of Person." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Email %>"></asp:Literal>
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtEmail" MaxLength="200" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvEmail" SetFocusOnError="true" ControlToValidate="txtEmail" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Email." runat="server"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Please enter valid Email." ControlToValidate="txtEmail" SetFocusOnError="true" Display="Dynamic" CssClass="required" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                        </asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Mobile %>"></asp:Literal>
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtMobile" MaxLength="15" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvMobile" SetFocusOnError="true" ControlToValidate="txtMobile" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Mobile." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Address %>"></asp:Literal>
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox TextMode="MultiLine" ID="txtAddress" MaxLength="1000" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvAddress" SetFocusOnError="true" ControlToValidate="txtAddress" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Address." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, VisitToName %>"></asp:Literal>
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtVisitToName" MaxLength="150" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvVisitToName" SetFocusOnError="true" ControlToValidate="txtVisitToName" CssClass="required" Display="Dynamic" ErrorMessage="Please enter To Name." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, VisitReference %>"></asp:Literal>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtVisitReference" MaxLength="150" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Relation %>"></asp:Literal>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtRelation" MaxLength="50" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Purpose %>"></asp:Literal>
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox TextMode="MultiLine" ID="txtPurpose" MaxLength="500" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPurpose" SetFocusOnError="true" ControlToValidate="txtPurpose" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Purpose." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, VisitInDateTime %>"></asp:Literal>
                                    </label>
                                    <div class="col-md-10 date-select">
                                        <input type="text" runat="server" readonly="" id="txtVisitInDateTime" class="form-control txtVisitInDateTime" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, VisitOutDateTime %>"></asp:Literal>
                                    </label>
                                    <div class="col-md-10 date-select">
                                        <input type="text" runat="server" readonly="" id="txtVisitOutDateTime" class="form-control txtVisitOutDateTime" />
                                    </div>
                                </div>

                                <div class="form-actions">
                                    <a href="/Modules/General/VisitorList.aspx" class="btn pull-right">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Cancel %>"></asp:Literal>
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

