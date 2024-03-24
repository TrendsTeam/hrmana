<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="ERP.Modules.ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ResetPassword %>"></asp:Literal></title>

    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link rel="shortcut icon" type="image/ico" href="~/Images/favicon.ico" />
    <link rel="shortcut icon" href="~/Images/favicon.png" type="image/png" />

    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css' />
    <link href="<%=ResolveUrl("~/Styles/font-awesome.css")%>" rel="stylesheet" />
    <link href="<%=ResolveUrl("~/Styles/adminlte.css")%>" rel="stylesheet" />
    <link href="<%=ResolveUrl("~/Styles/toastr.css")%>" rel="stylesheet" />
    <link href="<%=ResolveUrl("~/Styles/Common.css")%>" rel="stylesheet" />

    <script src="<%=ResolveUrl("~/Scripts/jquery.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.bundle.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/adminlte.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/toastr.min.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/Common.js")%>"></script>

    <!--[if lt IE 9]>
    <script src="<%=ResolveUrl("~/Scripts/html5shiv.js")%>"></script>
    <![endif]-->
</head>
<body class="login hold-transition login-page">
    <div class="login-box">
        <div class="login-logo">
            <strong><%=ERP.Helpers.SessionHelper.CompanyName %></strong>
        </div>

        <div class="card">
            <div class="card-body login-card-body">
                <form id="frmResetPassword" runat="server">
                    <asp:HiddenField ID="hfId" runat="server" />

                    <p class="login-box-msg"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ResetPasswordTitle %>"></asp:Literal></p>

                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtPassword" MaxLength="20" TextMode="Password" placeholder="<%$Resources:GlobalStrings, Password %>" runat="server" CssClass="form-control"></asp:TextBox>
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <i class="fa fa-lock"></i>
                            </div>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvPassword" SetFocusOnError="true" ControlToValidate="txtPassword" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Password." runat="server"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPassword" SetFocusOnError="true" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{8,20}$" ControlToValidate="txtPassword" CssClass="required" Display="Dynamic" ErrorMessage="Password should be alphanumeric characters with minimum of 8 characters and maximum of 20 characters." runat="server"></asp:RegularExpressionValidator>

                    </div>
                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtConfirmPassword" MaxLength="20" TextMode="Password" placeholder="<%$Resources:GlobalStrings, ConfirmPassword %>" runat="server" CssClass="form-control"></asp:TextBox>
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <i class="fa fa-lock"></i>
                            </div>
                        </div>
                        <asp:CompareValidator ID="cvConfirmPassword" SetFocusOnError="true" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" CssClass="required" Display="Dynamic" ErrorMessage="Password and confirm password do not match." runat="server"></asp:CompareValidator>
                    </div>


                    <div class="form-btn-actions">
                        <asp:LinkButton CssClass="submit btn btn-primary pull-left" ID="btnResetPassword" runat="server" OnClick="btnResetPassword_Click"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ResetPassword %>"></asp:Literal> <i class="fa fa-angle-right"></i></asp:LinkButton>
                        <a href="/Modules/Login.aspx" class="btn btn-default pull-right"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Cancel %>"></asp:Literal>
                        </a>
                    </div>
                    <div class="clearfix"></div>
                </form>
            </div>
        </div>

    </div>
</body>
</html>
