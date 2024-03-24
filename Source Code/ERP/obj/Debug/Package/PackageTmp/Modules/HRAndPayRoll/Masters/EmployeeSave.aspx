<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true"
    CodeBehind="EmployeeSave.aspx.cs" Inherits="ERP.Modules.HRAndPayRoll.Masters.EmployeeSave" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Employee %>"></asp:Literal></title>
    <link href="<%=ResolveUrl("~/Styles/daterangepicker.css")%>" rel="stylesheet" />
    <script src="<%=ResolveUrl("~/Scripts/moment.min.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/daterangepicker.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/Modules/HRAndPayRoll/Masters/EmployeeSave.js")%>"></script>

    <script type="text/javascript">
        function ValidateWorkingDays(sender, args) {
            var checkBoxList = document.getElementById("<%=chkListWorkingDays.ClientID %>");
            var checkboxes = checkBoxList.getElementsByTagName("input");
            var isValid = false;
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    isValid = true;
                    break;
                }
            }
            args.IsValid = isValid;
        }
    </script>

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
            <a href="<%=ResolveUrl("~/Modules/HRAndPayRoll/Masters/EmployeeList.aspx") %>" title="Employee" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Employee %>"></asp:Literal></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="javascript:;" title="Save Employee" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveEmployee %>"></asp:Literal></a>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveEmployee %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveEmployee %>"></asp:Literal></h3>
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
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeNo %>"></asp:Literal> :
                                    </label>
                                    <div class="col-md-10 textLeft">
                                        <label runat="server" id="lblEmployeeNo">0</label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <h4><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, PersonalDetails %>"></asp:Literal> </h4>

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
                                                    <a href="javascript:;" id="btnDeletePhoto" class="btn btn-sm btnDeletePhoto"><i class="fa fa-trash" title="Click to delete photo."></i>&nbsp;Delete</a>
                                                </div>

                                            </div>
                                        </div>

                                        <h4><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, OfficialDetails %>"></asp:Literal> </h4>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeType %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-8">
                                                <asp:DropDownList ID="ddlEmployeeType" runat="server" CssClass="form-control">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvEmployeeType" SetFocusOnError="true" ControlToValidate="ddlEmployeeType" CssClass="required" Display="Dynamic" InitialValue="" ErrorMessage="Please select Employee Type." runat="server"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Department %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-8">
                                                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvDepartment" SetFocusOnError="true" ControlToValidate="ddlDepartment" CssClass="required" Display="Dynamic" InitialValue="" ErrorMessage="Please select Department." runat="server"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Designation %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-8">
                                                <asp:DropDownList ID="ddlDesignation" runat="server" CssClass="form-control">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvDesignation" SetFocusOnError="true" ControlToValidate="ddlDesignation" CssClass="required" Display="Dynamic" InitialValue="" ErrorMessage="Please select Designation." runat="server"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeGrade %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-8">
                                                <asp:DropDownList ID="ddlEmployeeGrade" runat="server" CssClass="form-control">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvEmployeeGrade" SetFocusOnError="true" ControlToValidate="ddlEmployeeGrade" CssClass="required" Display="Dynamic" InitialValue="" ErrorMessage="Please select Employee Grade." runat="server"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, JoinDate %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-8 date-select">
                                                <input type="text" runat="server" readonly="" id="txtJoinDate" class="form-control txtJoinDate" />
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, PFNumber %>"></asp:Literal>
                                            </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="txtPFNumber" MaxLength="50" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Shift %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-8">
                                                <asp:DropDownList ID="ddlShift" runat="server" CssClass="form-control">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvShift" SetFocusOnError="true" ControlToValidate="ddlShift" CssClass="required" Display="Dynamic" InitialValue="" ErrorMessage="Please select Shift." runat="server"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                               <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, WorkingDays %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-8">

                                                <asp:CheckBoxList runat="server" ID="chkListWorkingDays" RepeatColumns="3" RepeatDirection="Horizontal" CssClass="checkboxlist">
                                                    <asp:ListItem Value="Sunday" Text="<%$Resources:GlobalStrings, Sunday %>"></asp:ListItem>
                                                    <asp:ListItem Value="Monday" Text="<%$Resources:GlobalStrings, Monday %>" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Value="Tuesday" Text="<%$Resources:GlobalStrings, Tuesday %>" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Value="Wednesday" Text="<%$Resources:GlobalStrings, Wednesday %>" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Value="Thursday" Text="<%$Resources:GlobalStrings, Thursday %>" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Value="Friday" Text="<%$Resources:GlobalStrings, Friday %>" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Value="Saturday" Text="<%$Resources:GlobalStrings, Saturday %>" Selected="True"></asp:ListItem>
                                                </asp:CheckBoxList>
                                                <asp:CustomValidator ID="cvWorkingDays" ErrorMessage="Please select at least one working day."
                                                    ClientValidationFunction="ValidateWorkingDays" runat="server" Display="Dynamic" CssClass="required" />
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

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Email %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="txtEmail" MaxLength="200" runat="server" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvEmail" SetFocusOnError="true" ControlToValidate="txtEmail" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Email." runat="server"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Please enter valid Email." ControlToValidate="txtEmail" SetFocusOnError="true" Display="Dynamic" CssClass="required" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                                </asp:RegularExpressionValidator>
                                                <br />                                               
                                            </div>
                                             <span class="redFont"><b>Note: </b>Username is EmailId & Password is default@123</span>
                                        </div>
                                        

                                        <h4><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, BankInformation %>"></asp:Literal> </h4>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, BankName %>"></asp:Literal>
                                            </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="txtBankName" MaxLength="50" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, BranchName %>"></asp:Literal>
                                            </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="txtBranchName" MaxLength="50" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, AccountName %>"></asp:Literal>
                                            </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="txtAccountName" MaxLength="150" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, AccountNumber %>"></asp:Literal>
                                            </label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="txtAccountNumber" MaxLength="50" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>

                                        <h4><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeDocuments %>"></asp:Literal> </h4>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Resume %>"></asp:Literal>
                                            </label>
                                            <div class="col-md-8">
                                                <div id="divUploadResume" runat="server" class="divUploadResume" style="display: block;">
                                                    <asp:FileUpload ID="fuResume" runat="server" />
                                                </div>
                                                <div id="divViewResume" runat="server" class="divViewResume" style="display: none;">
                                                    <asp:HiddenField ID="hfResume" runat="server" />
                                                    <a id="btnViewResume" runat="server" class="btn btn-sm" target="_blank"><i class="fa fa-download"></i>&nbsp;Download</a>
                                                    <a href="javascript:;" class="btn btn-sm" onclick="EmployeeSave.ShowHideDocument('.divViewResume','.divUploadResume');"><i class="fa fa-trash" title="Click to delete resume."></i>&nbsp;Delete</a>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, OfferLetter %>"></asp:Literal>
                                            </label>
                                            <div class="col-md-8">

                                                <div id="divUploadOfferLetter" runat="server" class="divUploadOfferLetter" style="display: block;">
                                                    <asp:FileUpload ID="fuOfferLetter" runat="server" />
                                                </div>
                                                <div id="divViewOfferLetter" runat="server" class="divViewOfferLetter" style="display: none;">
                                                    <asp:HiddenField ID="hfOfferLetter" runat="server" />
                                                    <a id="btnViewOfferLetter" runat="server" class="btn btn-sm" target="_blank"><i class="fa fa-download"></i>&nbsp;Download</a>
                                                    <a href="javascript:;" class="btn btn-sm" onclick="EmployeeSave.ShowHideDocument('.divViewOfferLetter','.divUploadOfferLetter');"><i class="fa fa-trash" title="Click to delete offer letter."></i>&nbsp;Delete</a>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, JoiningLetter %>"></asp:Literal>
                                            </label>
                                            <div class="col-md-8">
                                                <div id="divUploadJoiningLetter" runat="server" class="divUploadJoiningLetter" style="display: block;">
                                                    <asp:FileUpload ID="fuJoiningLetter" runat="server" />
                                                </div>
                                                <div id="divViewJoiningLetter" runat="server" class="divViewJoiningLetter" style="display: none;">
                                                    <asp:HiddenField ID="hfJoiningLetter" runat="server" />
                                                    <a id="btnViewJoiningLetter" runat="server" class="btn btn-sm" target="_blank"><i class="fa fa-download"></i>&nbsp;Download</a>
                                                    <a href="javascript:;" class="btn btn-sm" onclick="EmployeeSave.ShowHideDocument('.divViewJoiningLetter','.divUploadJoiningLetter');"><i class="fa fa-trash" title="Click to delete joining letter."></i>&nbsp;Delete</a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ContractPaper %>"></asp:Literal>
                                            </label>
                                            <div class="col-md-8">

                                                <div id="divUploadContractPaper" runat="server" class="divUploadContractPaper" style="display: block;">
                                                    <asp:FileUpload ID="fuContractPaper" runat="server" />
                                                </div>
                                                <div id="divViewContractPaper" runat="server" class="divViewContractPaper" style="display: none;">
                                                    <asp:HiddenField ID="hfContractPaper" runat="server" />
                                                    <a id="btnViewContractPaper" runat="server" class="btn btn-sm" target="_blank"><i class="fa fa-download"></i>&nbsp;Download</a>
                                                    <a href="javascript:;" class="btn btn-sm" onclick="EmployeeSave.ShowHideDocument('.divViewContractPaper','.divUploadContractPaper');"><i class="fa fa-trash" title="Click to delete contract paper."></i>&nbsp;Delete</a>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, IDProof %>"></asp:Literal>
                                            </label>
                                            <div class="col-md-8">
                                                <div id="divUploadIDProff" runat="server" class="divUploadIDProff" style="display: block;">
                                                    <asp:FileUpload ID="fuIDProff" runat="server" />
                                                </div>
                                                <div id="divViewIDProff" runat="server" class="divViewIDProff" style="display: none;">
                                                    <asp:HiddenField ID="hfIDProff" runat="server" />
                                                    <a id="btnViewIDProff" runat="server" class="btn btn-sm" target="_blank"><i class="fa fa-download"></i>&nbsp;Download</a>
                                                    <a href="javascript:;" class="btn btn-sm" onclick="EmployeeSave.ShowHideDocument('.divViewIDProff','.divUploadIDProff');"><i class="fa fa-trash" title="Click to delete id proff."></i>&nbsp;Delete</a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, OtherDocument %>"></asp:Literal>
                                            </label>
                                            <div class="col-md-8">

                                                <div id="divUploadOtherDocument" runat="server" class="divUploadOtherDocument" style="display: block;">
                                                    <asp:FileUpload ID="fuOtherDocument" runat="server" />
                                                </div>
                                                <div id="divViewOtherDocument" runat="server" class="divViewOtherDocument" style="display: none;">
                                                    <asp:HiddenField ID="hfOtherDocument" runat="server" />
                                                    <a id="btnViewOtherDocument" runat="server" class="btn btn-sm" target="_blank"><i class="fa fa-download"></i>&nbsp;Download</a>
                                                    <a href="javascript:;" class="btn btn-sm" onclick="EmployeeSave.ShowHideDocument('.divViewOtherDocument','.divUploadOtherDocument');"><i class="fa fa-trash" title="Click to delete other document."></i>&nbsp;Delete</a>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="clearfix"></div>
                                <div class="form-actions">
                                    <a href="/Modules/HRAndPayRoll/Masters/EmployeeList.aspx" class="btn pull-right"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Cancel %>"></asp:Literal>
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
