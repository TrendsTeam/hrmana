<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="EmployeeSalaryProcessList.aspx.cs" Inherits="ERP.Modules.HRAndPayRoll.Transactions.EmployeeSalaryProcessList" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeSalaryProcess %>"></asp:Literal></title>
    <script src="<%=ResolveUrl("~/Scripts/Modules/HRAndPayRoll/Transactions/EmployeeSalaryProcessList.js")%>"></script>
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
    </ul>
</asp:Content>
<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeSalaryProcess %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeSalaryProcess %>"></asp:Literal></h3>
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

                                <asp:UpdatePanel ID="upMain" runat="server">
                                    <ContentTemplate>
                                        <div class="form-group row">
                                            <label class="col-md-2">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Month %>"></asp:Literal> :
                                            </label>
                                            <div class="col-md-10">
                                                <asp:DropDownList ID="ddlMonth" runat="server" CssClass="form-control ddlMonth" AutoPostBack="True" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div id="divSalaryProcess" visible="false" class="form-group" runat="server">
                                            <div class="col-md-12">
                                                <div class="card card-primary card-tabs">
                                                    <ul class="nav nav-tabs">
                                                        <li class="nav-item"><a class="nav-link active" href="#tabCompleted" data-toggle="tab"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Completed %>"></asp:Literal></a></li>
                                                        <li class="nav-item"><a class="nav-link" href="#tabPending" data-toggle="tab"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Pending %>"></asp:Literal></a></li>
                                                    </ul>
                                                    <div class="card-body">
                                                        <div class="tab-content">
                                                            <div class="tab-pane fade show active" id="tabCompleted">
                                                                <asp:GridView ID="gvEmployeeCompletedSalaryProcess" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered gvEmployeeCompletedSalaryProcess">
                                                                    <Columns>

                                                                        <asp:BoundField HeaderText="<%$Resources:GlobalStrings, Department %>" DataField="Department" HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Left" />
                                                                        <asp:BoundField HeaderText="<%$Resources:GlobalStrings, EmployeeName %>" DataField="FullName" HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Left" />
                                                                        <asp:BoundField HeaderText="<%$Resources:GlobalStrings, EmpNo %>" DataField="EmployeeNo" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" />
                                                                        <asp:BoundField HeaderText="<%$Resources:GlobalStrings, PaidBasic %>" DataField="PaidBasic" HeaderStyle-Width="9%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" />
                                                                        <asp:BoundField HeaderText="<%$Resources:GlobalStrings, PaidAllowance %>" DataField="PaidTotalEarning" HeaderStyle-Width="12%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" />
                                                                        <asp:BoundField HeaderText="<%$Resources:GlobalStrings, PaidDeduction %>" DataField="PaidTotalDeduction" HeaderStyle-Width="12%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" />
                                                                        <asp:BoundField HeaderText="<%$Resources:GlobalStrings, TotalPaid %>" DataField="PaidTotalSalary" HeaderStyle-Width="12%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" />
                                                                        <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Action %>" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                                                            <ItemTemplate>

                                                                                <a href="javascript:;" id="btnView" onclick="EmployeeSalaryProcessList.RediectSalarySave('<%#Eval("EmployeeId")%>')" class="btnView"><i class="fa fa-eye" title="Click to View Employee Salary Process"></i></a>

                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <EmptyDataRowStyle BackColor="#F9F9F9" />
                                                                </asp:GridView>
                                                            </div>
                                                            <div class="tab-pane fade" id="tabPending">
                                                                <asp:GridView ID="gvEmployeePendingSalaryProcess" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered gvEmployeePendingSalaryProcess">
                                                                    <Columns>
                                                                        <asp:BoundField HeaderText="<%$Resources:GlobalStrings, Department %>" DataField="Department" HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Left" />
                                                                        <asp:BoundField HeaderText="<%$Resources:GlobalStrings, EmployeeName %>" DataField="FullName" HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Left" />
                                                                        <asp:BoundField HeaderText="<%$Resources:GlobalStrings, EmpNo %>" DataField="EmployeeNo" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" />
                                                                        <asp:BoundField HeaderText="<%$Resources:GlobalStrings, Basic %>" DataField="PaidBasic" HeaderStyle-Width="9%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" />
                                                                        <asp:BoundField HeaderText="<%$Resources:GlobalStrings, TotalAllowance %>" DataField="PaidTotalEarning" HeaderStyle-Width="12%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" />
                                                                        <asp:BoundField HeaderText="<%$Resources:GlobalStrings, TotalDeduction %>" DataField="PaidTotalDeduction" HeaderStyle-Width="12%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" />
                                                                        <asp:BoundField HeaderText="<%$Resources:GlobalStrings, TotalSalary %>" DataField="PaidTotalSalary" HeaderStyle-Width="12%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" />
                                                                        <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Action %>" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                                                            <ItemTemplate>

                                                                                <a href="javascript:;" id="btnEdit" onclick="EmployeeSalaryProcessList.RediectSalarySave('<%#Eval("EmployeeId")%>')" class="btnEdit"><i class="fa fa-edit" title="Click to Edit Employee Salary Process"></i></a>

                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <EmptyDataRowStyle BackColor="#F9F9F9" />
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
