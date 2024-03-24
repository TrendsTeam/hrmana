<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="EmployeeLoanList.aspx.cs" Inherits="ERP.Modules.HRAndPayRoll.Transactions.EmployeeLoanList" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeLoan %>"></asp:Literal></title>
    <script src="<%=ResolveUrl("~/Scripts/Modules/HRAndPayRoll/Transactions/EmployeeLoanList.js")%>"></script>
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
            <a href="<%=ResolveUrl("~/Modules/HRAndPayRoll/Transactions/EmployeeLoanList.aspx") %>" title="Employee Loan" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeLoan %>"></asp:Literal></a>
        </li>

    </ul>
</asp:Content>
<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeLoan %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeLoan %>"></asp:Literal></h3>
                            <div class="card-tools">
                                <span class="btn btn-xs">
                                <i class="fa fa-plus"></i>
                                <a href="<%=ResolveUrl("~/Modules/HRAndPayRoll/Transactions/EmployeeLoanSave.aspx") %>"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, AddEmployeeLoan %>"></asp:Literal></a>
                            </span>
                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                    <i class="fas fa fa-minus"></i>
                                </button>
                            </div>
                        </div>

                        <div class="card-body">
                             <form id="frmMain" runat="server">
                        <asp:GridView OnPreRender="gvEmployeeLoan_PreRender" ID="gvEmployeeLoan" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered gvEmployeeLoan">
                            <Columns>
                                <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, EmployeeName %>" HeaderStyle-Width="15%" HeaderStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <span class='<%# Convert.ToBoolean(Eval("IsComplete"))?"greenFont":"" %>'><%# Eval("EmployeeName") %></span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, Title %>" DataField="LoanTitle" HeaderStyle-Width="15%" HeaderStyle-HorizontalAlign="Left" />
                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, Loan %>" DataField="Amount" HeaderStyle-Width="9%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center"/>
                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, Paid %>" DataField="PaidLoan" HeaderStyle-Width="9%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center"/>
                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, Pending %>" DataField="PendingLoan" HeaderStyle-Width="9%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center"/>
                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, ApprovedBy %>" DataField="ApprovedBy" HeaderStyle-Width="13%" HeaderStyle-HorizontalAlign="Left" />
                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, TotalMonths %>" DataField="TotalMonths" HeaderStyle-Width="12%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center"/>
                                <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, LoanDate %>" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <%# Eval("LoanDate", "{0:MM/dd/yyyy}") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Action %>" HeaderStyle-Width="8%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <a class='<%# Convert.ToBoolean(Eval("PaidLoan"))?"displayNone":"" %>' href="<%#"EmployeeLoanSave.aspx?id="+Eval("EmployeeLoanID") %>"><i class="fa fa-edit" title="Click to edit employee loan"></i></a>&nbsp; 
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandArgument='<%#Eval("EmployeeLoanID") %>' OnClick="btnDelete_Click" CssClass='<%# Convert.ToBoolean(Eval("PaidLoan"))?"btnDelete displayNone":"btnDelete" %>'><i class="fa fa-remove" title="Click to delete employee loan"></i></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataRowStyle BackColor="#F9F9F9" />
                        </asp:GridView>
                    </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
</asp:Content>
