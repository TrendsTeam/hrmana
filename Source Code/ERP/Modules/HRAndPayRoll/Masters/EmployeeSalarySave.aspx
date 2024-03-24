<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true"
    CodeBehind="EmployeeSalarySave.aspx.cs" Inherits="ERP.Modules.HRAndPayRoll.Masters.EmployeeSalarySave" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeSalary %>"></asp:Literal></title>
    <script src="<%=ResolveUrl("~/Scripts/Modules/HRAndPayRoll/Masters/EmployeeSalarySave.js")%>"></script>
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
            <a href="<%=ResolveUrl("~/Modules/HRAndPayRoll/Masters/EmployeeSalaryList.aspx") %>" title="Employee Salary" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeSalary %>"></asp:Literal></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="javascript:;" title="Save Employee Salary" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveEmployeeSalary %>"></asp:Literal></a>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveEmployeeSalary %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveEmployeeSalary %>"></asp:Literal></h3>
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
                                <asp:UpdatePanel ID="upMain" runat="server">
                                    <ContentTemplate>
                                        <div class="form-group row">
                                            <label class="col-md-2">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Department %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-10 textLeft">
                                                <asp:Label ID="lblDepartment" Visible="false" runat="server"></asp:Label>
                                                <asp:DropDownList ID="ddlDepartment" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged" CssClass="form-control">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvDepartment" SetFocusOnError="true" ControlToValidate="ddlDepartment" CssClass="required" Display="Dynamic" InitialValue="" ErrorMessage="Please select Department." runat="server"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-2">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Employee %>"></asp:Literal> <span class="required">*</span>
                                            </label>
                                            <div class="col-md-10 textLeft">
                                                <asp:Label ID="lblEmployee" Visible="false" runat="server"></asp:Label>
                                                <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="form-control">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvEmployee" SetFocusOnError="true" ControlToValidate="ddlEmployee" CssClass="required" Display="Dynamic" InitialValue="" ErrorMessage="Please select Employee." runat="server"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Basic36 %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtBasic" MaxLength="10" runat="server" CssClass="form-control txtBasic" onkeypress="return Common.isNumericKey(event,this)" onkeyup="EmployeeSalarySave.CalculateTotal()"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvBasic" SetFocusOnError="true" ControlToValidate="txtBasic" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Basic." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalSalary %>"></asp:Literal> :
                                    </label>
                                    <div class="col-md-10 textLeft">
                                        <asp:HiddenField ID="hfTotalSalary" runat="server" Value="0" ClientIDMode="Static" />
                                        <asp:Label ID="lblTotalSalary" runat="server" CssClass="lblTotalSalary" Text="0"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <h4><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Allowance %>"></asp:Literal> </h4>

                                        <asp:Repeater ID="rptAllowance" runat="server">
                                            <ItemTemplate>
                                                <div class="form-group row">
                                                    <label class="col-md-4">
                                                        <%#Eval("AllowanceName") %> (<%#Eval("Percentage") %>%)
                                                    <br />
                                                        <span class="redFont"><%#Convert.ToBoolean(Eval("IsConsider"))?"Consider":"" %></span>
                                                    </label>
                                                    <div class="col-md-8">
                                                        <asp:HiddenField ID="hfAllowanceId" runat="server" Value='<%#Eval("AllowanceID") %>' />
                                                        <asp:TextBox ID="txtAllowance" MaxLength="10" runat="server" Text='<%#Eval("Amount") %>' CssClass="form-control txtAllowance" onkeypress="return Common.isNumericKey(event,this)" onkeyup="EmployeeSalarySave.CalculateTotal()"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalAllowance %>"></asp:Literal> :
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:HiddenField ID="hfTotalAllowance" runat="server" Value="0" ClientIDMode="Static" />
                                                <asp:Label ID="lblTotalAllowance" runat="server" CssClass="lblTotalAllowance" Text="0"></asp:Label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <h4><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Deduction %>"></asp:Literal> </h4>

                                        <asp:Repeater ID="rptDeduction" runat="server">
                                            <ItemTemplate>
                                                <div class="form-group row">
                                                    <label class="col-md-4">
                                                        <%#Eval("DeductionName") %>
                                                        <br />
                                                        <span class="redFont"><%#Convert.ToBoolean( Eval("IsConsider"))?"Consider":"" %></span>
                                                    </label>
                                                    <div class="col-md-8">
                                                        <asp:HiddenField ID="hfDeductionId" runat="server" Value='<%#Eval("DeductionID") %>' />
                                                        <asp:TextBox ID="txtDeduction" MaxLength="10" runat="server" Text='<%#Eval("Amount") %>' CssClass="form-control txtDeduction" onkeypress="return Common.isNumericKey(event,this)" onkeyup="EmployeeSalarySave.CalculateTotal()"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalDeduction %>"></asp:Literal> :
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:HiddenField ID="hfTotalDeduction" runat="server" Value="0" ClientIDMode="Static" />
                                                <asp:Label ID="lblTotalDeduction" runat="server" CssClass="lblTotalDeduction" Text="0"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="clearfix"></div>
                                <div class="form-actions">
                                    <a href="/Modules/HRAndPayRoll/Masters/EmployeeSalaryList.aspx" class="btn pull-right"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Cancel %>"></asp:Literal>
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
