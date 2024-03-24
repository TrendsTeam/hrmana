<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="EmployeeSalaryProcessSave.aspx.cs" Inherits="ERP.Modules.HRAndPayRoll.Transactions.EmployeeSalaryProcessSave" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeSalaryProcess %>"></asp:Literal></title>
    <link href="<%=ResolveUrl("~/Styles/daterangepicker.css")%>" rel="stylesheet" />
    <script src="<%=ResolveUrl("~/Scripts/moment.min.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/daterangepicker.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/Modules/HRAndPayRoll/Transactions/EmployeeSalaryProcessSave.js")%>"></script>
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
            <a href="<%=ResolveUrl("~/Modules/HRAndPayRoll/Transactions/EmployeeSalaryProcessList.aspx") %>" title="Employee Salary Process" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeSalaryProcess %>"></asp:Literal></a>
        </li>

        <li class="nav-item d-none d-sm-inline-block">
            <a href="javascript:;" title="Save Employee Salary Process" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveEmployeeSalaryProcess %>"></asp:Literal></a>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveEmployeeSalaryProcess %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveEmployeeSalaryProcess %>"></asp:Literal></h3>
                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                    <i class="fas fa fa-minus"></i>
                                </button>
                            </div>
                        </div>

                        <div class="card-body">
                            <form id="frmMain" runat="server" class="form-horizontal row-border">
                                <asp:ScriptManager ID="smMain" runat="server"></asp:ScriptManager>
                                <asp:HiddenField ID="hfId" runat="server" />
                                <asp:HiddenField ID="hfMonth" runat="server" />
                                <asp:HiddenField ID="hfEmployeeId" runat="server" />

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Department %>"></asp:Literal> :
                                    </label>
                                    <div class="col-md-2 textLeft">
                                        <asp:Label ID="lblDepartment" runat="server"></asp:Label>
                                    </div>
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeName %>"></asp:Literal> :
                                    </label>
                                    <div class="col-md-2 textLeft">
                                        <asp:Label ID="lblEmployeeName" runat="server"></asp:Label>
                                    </div>
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeNo %>"></asp:Literal> :
                                    </label>
                                    <div class="col-md-2 textLeft">
                                        <asp:Label ID="lblEmployeeNo" runat="server"></asp:Label>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Month %>"></asp:Literal> :
                                    </label>
                                    <div class="col-md-2 textLeft">
                                        <asp:Label ID="lblMonth" runat="server"></asp:Label>
                                    </div>
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Year %>"></asp:Literal> :
                                    </label>
                                    <div class="col-md-2 textLeft">
                                        <asp:Label ID="lblYear" runat="server"></asp:Label>
                                    </div>

                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalDays %>"></asp:Literal> :
                                    </label>
                                    <div class="col-md-2 textLeft">
                                        <asp:Label ID="lblTotalDays" runat="server" CssClass="lblTotalDays" Text="0"></asp:Label>
                                    </div>
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalPresentDays %>"></asp:Literal> :
                                    </label>
                                    <div class="col-md-2 textLeft">
                                        <asp:Label ID="lblTotalPresentDays" runat="server" CssClass="lblTotalPresentDays" Text="0"></asp:Label>
                                    </div>
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalHolidays %>"></asp:Literal> :
                                    </label>
                                    <div class="col-md-2 textLeft">
                                        <asp:Label ID="lblTotalHolidays" runat="server" CssClass="lblTotalHolidays" Text="0"></asp:Label>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Leave %>"></asp:Literal> :
                                    </label>
                                    <div class="col-md-6 textLeft">
                                        <asp:HiddenField ID="hfAllowLeave" runat="server" Value="0"></asp:HiddenField>
                                        <asp:HiddenField ID="hfTotalUsedLeave" runat="server" Value="0"></asp:HiddenField>
                                        <asp:HiddenField ID="hfCalculateLeave" runat="server" Value="0"></asp:HiddenField>
                                        <asp:Label ID="lblLeave" runat="server" Text="0" />
                                    </div>
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, LeaveSalary %>"></asp:Literal> :
                                    </label>
                                    <div class="col-md-2 textLeft">
                                        <asp:Label ID="lblTotalPaidLeaveSalary" runat="server" Text="0"></asp:Label>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalOverTimeDays %>"></asp:Literal> :
                                    </label>
                                    <div class="col-md-2 textLeft">
                                        <asp:Label ID="lblTotalOverTimeDays" runat="server" Text="0"></asp:Label>
                                    </div>
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, OverTimeSalary %>"></asp:Literal> :
                                    </label>
                                    <div class="col-md-6 textLeft">
                                        <asp:Label ID="lblTotalOverTimeSalary" runat="server" Text="0"></asp:Label>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Basic %>"></asp:Literal> :
                                    </label>
                                    <div class="col-md-10 textLeft">
                                        <asp:Label ID="lblBasic" Text="0" CssClass="lblBasic" runat="server"></asp:Label>
                                        /
                                <asp:Label ID="lblPaidBasic" Text="0" CssClass="lblPaidBasic" runat="server"></asp:Label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">

                                        <h4><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Allowance %>"></asp:Literal> </h4>

                                        <asp:Repeater ID="rptAllowance" runat="server">
                                            <ItemTemplate>
                                                <div class="form-group row">
                                                    <label class="col-md-4">
                                                        <%#Eval("AllowanceName") %>
                                                        <br />
                                                        <span class="redFont"><%#Convert.ToBoolean(Eval("IsConsider"))?"Consider":"" %></span>
                                                    </label>
                                                    <div class="col-md-8 textLeft">
                                                        <asp:HiddenField ID="hfAllowanceId" runat="server" Value='<%#Eval("AllowanceID") %>' />
                                                        <asp:Label ID="lblAllowance" CssClass="lblAllowance" runat="server" Text='<%#String.Format("{0:0.00}",Eval("Amount")) %>' />
                                                        /
                                                        <asp:Label ID="lblPaidAllowance" runat="server" Text='<%#String.Format("{0:0.00}",Eval("PaidAmount")) %>'></asp:Label>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalAllowance %>"></asp:Literal> :
                                            </label>
                                            <div class="col-md-2 textLeft">
                                                <asp:HiddenField ID="hfTotalAllowance" runat="server" Value="0" ClientIDMode="Static" />
                                                <asp:Label ID="lblTotalAllowance" runat="server" CssClass="lblTotalAllowance" Text="0"></asp:Label>
                                            </div>
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalPaidAllowance %>"></asp:Literal> :
                                            </label>
                                            <div class="col-md-2 textLeft">
                                                <asp:Label ID="lblPaidTotalAllowance" runat="server" CssClass="lblPaidTotalAllowance" Text="0"></asp:Label>
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
                                                        <span class="redFont"><%#Convert.ToBoolean(Eval("IsConsider"))?"Consider":"" %></span>
                                                    </label>
                                                    <div class="col-md-8 textLeft">
                                                        <asp:HiddenField ID="hfDeductionId" runat="server" Value='<%#Eval("DeductionID") %>' />
                                                        <asp:Label ID="lblDeduction" CssClass="lblDeduction" runat="server" Text='<%#String.Format("{0:0.00}",Eval("Amount")) %>' />
                                                        /
                                                        <asp:Label ID="lblPaidDeduction" runat="server" Text='<%#String.Format("{0:0.00}",Eval("PaidAmount")) %>' CssClass="lblPaidDeduction"></asp:Label>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalDeduction %>"></asp:Literal> :
                                            </label>
                                            <div class="col-md-2 textLeft">
                                                <asp:Label ID="lblTotalDeduction" runat="server" CssClass="lblTotalDeduction" Text="0"></asp:Label>
                                            </div>
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalPaidDeduction %>"></asp:Literal> :
                                            </label>
                                            <div class="col-md-2 textLeft">
                                                <asp:Label ID="lblPaidTotalDeduction" runat="server" CssClass="lblPaidTotalDeduction" Text="0"></asp:Label>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="form-group" runat="server">
                                    <div class="col-md-12">
                                        <h4><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, LoanDetail %>"></asp:Literal></h4>

                                        <asp:Repeater ID="rptLoan" runat="server">
                                            <ItemTemplate>
                                                <div class="form-group row">
                                                    <label class="col-md-4">
                                                        <%#Eval("LoanTitle") %>
                                                    </label>
                                                    <div class="col-md-8">
                                                        <asp:HiddenField ID="hfLoanId" runat="server" Value='<%#Eval("EmployeeLoanID") %>' />
                                                        <asp:Label ID="lblPendingLoan" CssClass="lblPendingLoan" runat="server" Text='<%#Eval("PendingLoan") %>' />
                                                        <asp:TextBox ID="txtPaidLoanAmount" MaxLength="12" pendingLoan='<%#Convert.ToInt32(Eval("PendingLoan")) %>' runat="server" Text='<%# String.Format("{0:0.00}",Eval("PaidAmount")) %>' CssClass="form-control txtPaidLoanAmount" onkeypress="return Common.isNumericKey(event,this)" onkeyup="EmployeeSalaryProcessSave.checkPaidLoanAmount(this)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalLoanAmount %>"></asp:Literal> :
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblTotalPaidLoanAmount" runat="server" CssClass="lblTotalPaidLoanAmount" Text="0"></asp:Label>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, NetSalary %>"></asp:Literal> :
                                    </label>
                                    <div class="col-md-2 textLeft">
                                        <asp:Label ID="lblNetSalary" runat="server" CssClass="lblNetSalary" Text="0"></asp:Label>
                                    </div>
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ProfessionalTax %>"></asp:Literal> :
                                    </label>
                                    <div class="col-md-2 textLeft">
                                        <asp:Label ID="lblProfessionalTax" runat="server" CssClass="lblProfessionalTax" Text="0"></asp:Label>
                                    </div>
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, OnHandSalary %>"></asp:Literal> :
                                    </label>
                                    <div class="col-md-2 textLeft">
                                        <asp:HiddenField ID="hfCalculateSalary" Value="0" runat="server" ClientIDMode="Static" />
                                        <asp:Label ID="lblOnHandSalary" runat="server" CssClass="lblOnHandSalary" Text="0"></asp:Label>
                                        <asp:TextBox ID="txtOnHandSalary" runat="server" CssClass="displayNone txtOnHandSalary"></asp:TextBox>
                                        <asp:CompareValidator ID="cvSalary" runat="server" ValueToCompare="0" ControlToValidate="txtOnHandSalary" Display="Dynamic"
                                            ErrorMessage="Must set On Hand Salary grater than 0." CssClass="required" Operator="GreaterThanEqual" Type="Double"></asp:CompareValidator>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, PaidDate %>"></asp:Literal> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-10 date-select">
                                        <input type="text" runat="server" readonly="" id="txtPaidDate" class="form-control txtPaidDate" />
                                        <asp:RequiredFieldValidator ID="rfvPaidDate" SetFocusOnError="true" ControlToValidate="txtPaidDate" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Paid Date." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, IsPaid %>"></asp:Literal> 
                                    </label>
                                    <div class="col-md-10">
                                        <asp:CheckBox ID="chkbxIsPaid" CssClass="checkbox uniform" Checked="true" runat="server" Text="" />
                                    </div>
                                </div>

                                <div class="clearfix"></div>
                                <div class="form-actions">
                                    <a href="/Modules/HRAndPayRoll/Transactions/EmployeeSalaryProcessList.aspx" class="btn pull-right"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Cancel %>"></asp:Literal></a>
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
