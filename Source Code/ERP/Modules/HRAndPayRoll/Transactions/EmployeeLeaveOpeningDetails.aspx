<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="EmployeeLeaveOpeningDetails.aspx.cs" Inherits="ERP.Modules.HRAndPayRoll.Transactions.EmployeeLeaveOpeningDetails" %>
<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, LeaveOpeningDetails %>"></asp:Literal></title>
    <script src="<%=ResolveUrl("~/Scripts/Modules/HRAndPayRoll/Transactions/EmployeeLeaveOpeningDetails.js")%>"></script>
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
            <a href="<%=ResolveUrl("~/Modules/HRAndPayRoll/Transactions/EmployeeLeaveOpeningDetails.aspx") %>" title="Leave Opening Details" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, LeaveOpeningDetails %>"></asp:Literal></a>
        </li>

    </ul>
</asp:Content>
<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
   <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, LeaveOpeningDetails %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, LeaveOpeningDetails %>"></asp:Literal></h3>
                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                    <i class="fas fa fa-minus"></i>
                                </button>
                            </div>
                        </div>

                        <div class="card-body">
                           <form id="frmMain" runat="server">
                        <asp:GridView OnPreRender="gvEmployeeLeaveOpeningDetails_PreRender" ID="gvEmployeeLeaveOpeningDetails" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered gvEmployeeLeaveOpeningDetails">
                            <Columns>
                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, Department %>" DataField="Department" HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Left" />
                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, EmployeeName %>" DataField="FullName" HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Left" />
                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, EmpNo %>" DataField="EmployeeNo" HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center"/>
                                 <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, AllowedLeave %>" HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <%# Eval("TotalAllowLeave", "{0:0.#}") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, UsedLeave %>" HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <%# Eval("TotalUseLeave", "{0:0.#}") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, CalculateLeave %>" HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <%# Eval("RemainingLeave", "{0:0.#}") %>
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

