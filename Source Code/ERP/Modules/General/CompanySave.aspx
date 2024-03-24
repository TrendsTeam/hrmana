<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="CompanySave.aspx.cs" Inherits="ERP.Modules.General.CompanySave" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, CompanyDetails %>"></asp:Literal></title>
    <script src="<%=ResolveUrl("~/Scripts/Modules/General/CompanySave.js")%>"></script>
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
            <a href="<%=ResolveUrl("~/Modules/General/CompanySave.aspx") %>" title="Save Company" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveCompany %>"></asp:Literal></a>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveCompany %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveCompany %>"></asp:Literal></h3>
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
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, CompanyName %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtCompanyName" MaxLength="100" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvCompanyName" SetFocusOnError="true" ControlToValidate="txtCompanyName" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Company Name." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Email %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtEmail" MaxLength="200" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvEmail" SetFocusOnError="true" ControlToValidate="txtEmail" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Email." runat="server"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Please enter valid Email." ControlToValidate="txtEmail" SetFocusOnError="true" Display="Dynamic" CssClass="required" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                        </asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <asp:UpdatePanel ID="upMain" runat="server">
                                    <ContentTemplate>
                                        <div class="form-group row">
                                            <label class="col-md-2">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Country %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-10">
                                                <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" CssClass="form-control">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvCountry" SetFocusOnError="true" ControlToValidate="ddlCountry" CssClass="required" Display="Dynamic" InitialValue="" ErrorMessage="Please select Country." runat="server"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-2">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, State %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-10">
                                                <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvState" SetFocusOnError="true" ControlToValidate="ddlState" CssClass="required" Display="Dynamic" InitialValue="" ErrorMessage="Please select State." runat="server"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, City %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtCity" MaxLength="50" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvCity" SetFocusOnError="true" ControlToValidate="txtCity" CssClass="required" Display="Dynamic" ErrorMessage="Please enter City." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Address %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox TextMode="MultiLine" ID="txtAddress" MaxLength="1000" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvAddress" SetFocusOnError="true" ControlToValidate="txtAddress" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Address." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Mobile %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtMobile" MaxLength="15" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvMobile" SetFocusOnError="true" ControlToValidate="txtMobile" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Mobile." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Phone %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtPhone" MaxLength="15" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPhone" SetFocusOnError="true" ControlToValidate="txtPhone" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Phone Number." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, HotlineNo %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtHotlineNo" MaxLength="15" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvHotlineNo" SetFocusOnError="true" ControlToValidate="txtHotlineNo" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Hotline Number." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, FaxNo %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtFaxNo" MaxLength="15" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvFaxNo" SetFocusOnError="true" ControlToValidate="txtFaxNo" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Fax Number." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Website %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtWebSite" MaxLength="500" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvWebSite" SetFocusOnError="true" ControlToValidate="txtWebSite" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Website." runat="server"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revWebSite" runat="server" ErrorMessage="Please enter valid Website." ControlToValidate="txtWebSite" SetFocusOnError="true" Display="Dynamic" CssClass="required"
                                            ValidationExpression="(https?:\/\/(?:www\.|(?!www))[^\s\.]+\.[^\s]{2,}|www\.[^\s]+\.[^\s]{2,})">
                                        </asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Logo %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <div id="divUploadLogo" runat="server" class="divUploadLogo" style="display: block;">
                                            <asp:FileUpload ID="fuLogo" runat="server" />
                                            <asp:RequiredFieldValidator ID="rfvLogo"
                                                ControlToValidate="fuLogo" SetFocusOnError="true" runat="server" ErrorMessage="Please select Logo." Display="Dynamic" CssClass="required rfvLogo"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="revLogo"
                                                runat="server" ControlToValidate="fuLogo"
                                                ErrorMessage="Please select correct logo extension file."
                                                ValidationExpression="^([0-9a-zA-Z :\\-_!@$%^&*()])+(.jpeg|.JPEG|.gif|.GIF|.png|.PNG|.JPG|.jpg|.bitmap|.BITMAP)$"
                                                Display="Dynamic" CssClass="required"></asp:RegularExpressionValidator>
                                        </div>
                                        <div id="divViewLogo" runat="server" class="divViewLogo" style="display: none;">
                                            <asp:HiddenField ID="hfLogo" runat="server" Value="" />
                                            <img id="imgLogo" runat="server" alt="Logo" class="viewImage" />
                                            <a href="javascript:;" id="btnDeleteLogo" class="btn btn-sm btnDeleteLogo"><i class="fa fa-trash" title="Click to delete logo."></i>&nbsp;Delete</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-12">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SendEmailSettings %>"></asp:Literal>
                                    </label>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, UserEmail %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtUserEmail" MaxLength="250" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvUserEmail" SetFocusOnError="true" ControlToValidate="txtUserEmail" CssClass="required" Display="Dynamic" ErrorMessage="Please enter User Email." runat="server"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revUserEmail" runat="server" ErrorMessage="Please enter valid User Email." ControlToValidate="txtUserEmail" SetFocusOnError="true" Display="Dynamic" CssClass="required" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                        </asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, UserEmailPassword %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtUserEmailPassword" MaxLength="250" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvUserEmailPassword" SetFocusOnError="true" ControlToValidate="txtUserEmailPassword" CssClass="required" Display="Dynamic" ErrorMessage="Please enter User Email Password." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, IsEnableSSL %>"></asp:Literal>
                                    </label>
                                    <div class="col-md-10">
                                        <label class="checkbox">
                                            <asp:CheckBox ID="chkIsEnableSSL" runat="server" />
                                        </label>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SMTPHost %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtSMTPHost" MaxLength="100" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvSMTPHost" SetFocusOnError="true" ControlToValidate="txtSMTPHost" CssClass="required" Display="Dynamic" ErrorMessage="Please enter SMTP Host." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SMTPPort %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtSMTPPort" MaxLength="8" runat="server" CssClass="form-control" onkeypress="return Common.isNumberKey(event)"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvSMTPPort" SetFocusOnError="true" ControlToValidate="txtSMTPPort" CssClass="required" Display="Dynamic" ErrorMessage="Please enter SMTP Port." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, FromEmail %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtFromEmail" MaxLength="250" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvFromEmail" SetFocusOnError="true" ControlToValidate="txtFromEmail" CssClass="required" Display="Dynamic" ErrorMessage="Please enter From Email." runat="server"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revFromEmail" runat="server" ErrorMessage="Please enter valid From Email." ControlToValidate="txtFromEmail" SetFocusOnError="true" Display="Dynamic" CssClass="required" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                        </asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ReceiveApproveEmailIds %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtReceiveEmail" MaxLength="5000" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvReceiveEmail" SetFocusOnError="true" ControlToValidate="txtReceiveEmail" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Receive / Approve Email Ids." runat="server"></asp:RequiredFieldValidator>
                                        <br />
                                        <span class="redFont"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ReceiveEmailNote %>"></asp:Literal></span>
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
