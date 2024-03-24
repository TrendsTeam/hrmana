<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="ERP.Modules.Profile" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Profile %>"></asp:Literal></title>
    <link href="<%=ResolveUrl("~/Styles/daterangepicker.css")%>" rel="stylesheet" />
    <script src="<%=ResolveUrl("~/Scripts/moment.min.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/daterangepicker.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/Modules/Profile.js")%>"></script>
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
            <a href="<%=ResolveUrl("~/Modules/Profile.aspx") %>" title="Profile" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Profile %>"></asp:Literal></a>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">

    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Profile %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Profile %>"></asp:Literal></h3>
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
                                <asp:HiddenField ID="hfId" runat="server" />

                                <div class="row">

                                    <div class="col-md-6">
                                        <h4><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, PersonalDetails %>"></asp:Literal></h4>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, FirstName %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="txtFirstName" MaxLength="50" runat="server" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvFirstName" SetFocusOnError="true" ControlToValidate="txtFirstName" CssClass="required" Display="Dynamic" ErrorMessage="Please enter First Name." runat="server"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, MiddleName %>"></asp:Literal>
                                            </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="txtMiddleName" MaxLength="50" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, LastName %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="txtLastName" MaxLength="50" runat="server" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvLastName" SetFocusOnError="true" ControlToValidate="txtLastName" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Last Name." runat="server"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, FatherName %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="txtFatherName" MaxLength="150" runat="server" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvFatherName" SetFocusOnError="true" ControlToValidate="txtFatherName" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Father's Name." runat="server"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, DateofBirth %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-8 date-select">
                                                <input type="text" runat="server" readonly="" id="txtBirthDate" class="form-control txtBirthDate" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Gender %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-8">
                                                <label class="radio-inline">
                                                    <asp:RadioButton ID="rbtnMale" runat="server" Text="<%$Resources:GlobalStrings, Male %>" GroupName="Gender" Checked="true" />
                                                </label>
                                                <label class="radio-inline">
                                                    <asp:RadioButton ID="rbtnFeMale" runat="server" Text="<%$Resources:GlobalStrings, FeMale %>" GroupName="Gender" />
                                                </label>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, MaratialStatus %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-8">
                                                <asp:DropDownList ID="ddlMaratialStatus" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="" Text="<%$Resources:GlobalStrings, Select %>"></asp:ListItem>
                                                    <asp:ListItem Value="Married" Text="<%$Resources:GlobalStrings, Married %>"></asp:ListItem>
                                                    <asp:ListItem Value="Un-Married" Text="<%$Resources:GlobalStrings, UnMarried %>"></asp:ListItem>
                                                    <asp:ListItem Value="Widowed" Text="<%$Resources:GlobalStrings, Widowed %>"></asp:ListItem>
                                                    <asp:ListItem Value="Divorced" Text="<%$Resources:GlobalStrings, Divorced %>"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvMaratialStatus" SetFocusOnError="true" ControlToValidate="ddlMaratialStatus" CssClass="required" Display="Dynamic" InitialValue="" ErrorMessage="Please select Maratial Status." runat="server"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Cast %>"></asp:Literal>
                                            </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="txtCast" MaxLength="50" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Photo %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-8">
                                                <div id="divUploadPhoto" runat="server" class="divUploadPhoto" style="display: block;">
                                                    <asp:FileUpload ID="fuPhoto" runat="server" />
                                                    <asp:RequiredFieldValidator ID="rfvPhoto"
                                                        ControlToValidate="fuPhoto" SetFocusOnError="true" runat="server" ErrorMessage="Please select Photo." Display="Dynamic" CssClass="required rfvPhoto"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="revPhoto"
                                                        runat="server" ControlToValidate="fuPhoto"
                                                        ErrorMessage="Please select correct photo extension file."
                                                        ValidationExpression="^([0-9a-zA-Z :\\-_!@$%^&*()])+(.jpeg|.JPEG|.gif|.GIF|.png|.PNG|.JPG|.jpg|.bitmap|.BITMAP)$"
                                                        Display="Dynamic" CssClass="required"></asp:RegularExpressionValidator>
                                                </div>
                                                <div id="divViewPhoto" runat="server" class="divViewPhoto" style="display: none;">
                                                    <asp:HiddenField ID="hfPhoto" runat="server" />
                                                    <img id="imgPhoto" runat="server" alt="Photo" class="viewImage" />
                                                    <a href="javascript:;" id="btnDeletePhoto" class="btn btn-sm btnDeletePhoto"><i class="fa fa-trash" title="Click to delete photo."></i>&nbsp;<asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Delete %>"></asp:Literal></a>
                                                </div>

                                            </div>
                                        </div>

                                    </div>

                                    <div class="col-md-6">
                                        <h4><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ContactDetails %>"></asp:Literal> </h4>

                                        <asp:UpdatePanel ID="upMain" runat="server">
                                            <ContentTemplate>
                                                <div class="form-group row">
                                                    <label class="col-md-4">
                                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Country %>"></asp:Literal> <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-8">
                                                        <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" CssClass="form-control">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="rfvCountry" SetFocusOnError="true" ControlToValidate="ddlCountry" CssClass="required" Display="Dynamic" InitialValue="" ErrorMessage="Please select Country." runat="server"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-md-4">
                                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, State %>"></asp:Literal> <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-8">
                                                        <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="rfvState" SetFocusOnError="true" ControlToValidate="ddlState" CssClass="required" Display="Dynamic" InitialValue="" ErrorMessage="Please select State." runat="server"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, City %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="txtCity" MaxLength="50" runat="server" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvCity" SetFocusOnError="true" ControlToValidate="txtCity" CssClass="required" Display="Dynamic" ErrorMessage="Please enter City." runat="server"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Address %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-8">
                                                <asp:TextBox TextMode="MultiLine" ID="txtAddress" MaxLength="1000" runat="server" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvAddress" SetFocusOnError="true" ControlToValidate="txtAddress" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Address." runat="server"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, PinCode %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="txtPinCode" MaxLength="10" runat="server" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvPinCode" SetFocusOnError="true" ControlToValidate="txtPinCode" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Pin Code." runat="server"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Mobile %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="txtMobile" MaxLength="15" runat="server" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvMobile" SetFocusOnError="true" ControlToValidate="txtMobile" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Mobile." runat="server"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Phone %>"></asp:Literal>
                                            </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="txtPhone" MaxLength="15" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="clearfix"></div>

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
