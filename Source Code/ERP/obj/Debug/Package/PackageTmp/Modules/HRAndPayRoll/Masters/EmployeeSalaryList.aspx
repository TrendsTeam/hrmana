<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="EmployeeSalaryList.aspx.cs" Inherits="ERP.Modules.HRAndPayRoll.Masters.EmployeeSalaryList" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeSalary %>"></asp:Literal></title>
    <script src="<%=ResolveUrl("~/Scripts/Modules/HRAndPayRoll/Masters/EmployeeSalaryList.js")%>"></script>
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
    </ul>
</asp:Content>
<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
   <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeSalary %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeSalary %>"></asp:Literal></h3>
                            <div class="card-tools">
                                 <span class="btn btn-xs">
                                <i class="fa fa-plus"></i>
                                <a href="<%=ResolveUrl("~/Modules/HRAndPayRoll/Masters/EmployeeSalarySave.aspx") %>"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, AddEmployeeSalary %>"></asp:Literal></a>
                            </span>
                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                    <i class="fas fa fa-minus"></i>
                                </button>
                            </div>
                        </div>

                        <div class="card-body">
                            <form id="frmMain" runat="server">
                        <asp:GridView OnPreRender="gvEmployeeSalary_PreRender" ID="gvEmployeeSalary" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered gvEmployeeSalary">
                            <Columns>
                                <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, EmployeeName %>" HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <span class='<%# Convert.ToBoolean(Eval("IsLeave"))?"redFont":"" %>'><%# Eval("FullName") %></span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, EmpNo %>" DataField="EmployeeNo" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center"/>
                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, Basic %>" DataField="Basic" HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, Allowance %>" DataField="TotalEarning" HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center"/>
                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, Deduction %>" DataField="TotalDeduction" HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center"/>
                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, Total %>" DataField="TotalSalary" HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center"/>
                                <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Action %>" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <a href="<%#"EmployeeSalarySave.aspx?id="+Eval("EmployeeSalaryID") %>"><i class="fa fa-edit" title="Click to edit employee salary"></i></a>
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
