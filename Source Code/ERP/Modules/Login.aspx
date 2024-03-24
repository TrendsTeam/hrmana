<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ERP.Modules.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Login %>"></asp:Literal></title>

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
                <form id="frmLogin" runat="server">
                    <p class="login-box-msg"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, LogIntoyourAccount %>"></asp:Literal></p>

                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtUserName" MaxLength="200" runat="server" placeholder="<%$Resources:GlobalStrings, Username %>" CssClass="form-control"></asp:TextBox>

                        <div class="input-group-append">
                            <div class="input-group-text">
                                <i class="fa fa-envelope"></i>
                            </div>
                        </div>

                        <asp:RequiredFieldValidator ID="rfvUserName" SetFocusOnError="true" ControlToValidate="txtUserName" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Username." runat="server"></asp:RequiredFieldValidator>
                    </div>

                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtPassword" MaxLength="20" TextMode="Password" runat="server" placeholder="<%$Resources:GlobalStrings, Password %>" CssClass="form-control"></asp:TextBox>

                        <div class="input-group-append">
                            <div class="input-group-text">
                                <i class="fa fa-lock"></i>
                            </div>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvPassword" SetFocusOnError="true" ControlToValidate="txtPassword" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Password." runat="server"></asp:RequiredFieldValidator>
                    </div>


                   <%-- <div class="form-group">
                        <asp:DropDownList ID="ddlFinancialYear" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvFinancialYear"
                            ControlToValidate="ddlFinancialYear" SetFocusOnError="true" InitialValue="" runat="server" ErrorMessage="Please select Financial Year." CssClass="required" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>--%>

                    <div class="row">
                        <div class="col-8">
                            <div class="icheck-primary">
                                <asp:CheckBox runat="server" ID="chkRememberMe" Text="<%$Resources:GlobalStrings, RememberMe %>" />
                            </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-4">
                            <asp:LinkButton CssClass="submit btn btn-primary btn-block" ID="btnLogin" runat="server" OnClick="btnLogin_Click"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Log_In %>"></asp:Literal> <i class="fa fa-angle-right"></i></asp:LinkButton>
                        </div>
                        <!-- /.col -->
                    </div>

                </form>

                <p class="mb-1">
                    <a href="/Modules/ForgotPassword.aspx" class="forgot-password-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ForgotPassword %>"></asp:Literal></a>
                </p>

            </div>
        </div>
    </div>
</body>
</html>
