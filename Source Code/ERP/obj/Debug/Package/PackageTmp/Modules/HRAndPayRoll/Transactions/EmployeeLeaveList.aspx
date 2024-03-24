<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="EmployeeLeaveList.aspx.cs" Inherits="ERP.Modules.HRAndPayRoll.Transactions.EmployeeLeaveList" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeLeave %>"></asp:Literal></title>
    <script src="<%=ResolveUrl("~/Scripts/Modules/HRAndPayRoll/Transactions/EmployeeLeaveList.js")%>"></script>
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
            <a href="<%=ResolveUrl("~/Modules/HRAndPayRoll/Transactions/EmployeeLeaveList.aspx") %>" title="Employee Leave" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeLeave %>"></asp:Literal></a>
        </li>

    </ul>
</asp:Content>
<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeLeave %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeLeave %>"></asp:Literal></h3>
                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                    <i class="fas fa fa-minus"></i>
                                </button>
                            </div>
                        </div>

                        <div class="card-body">
                           <form id="frmMain" runat="server">
                        <asp:GridView OnPreRender="gvEmployeeLeave_PreRender" ID="gvEmployeeLeave" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered gvEmployeeLeave">
                            <Columns>
                                <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, EmployeeName %>" HeaderStyle-Width="12%" HeaderStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <span class='<%# Convert.ToBoolean(Eval("IsApprove"))?"greenFont":"" %>'><%# Eval("EmployeeName") %></span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, EmpNo %>" DataField="EmployeeNo" HeaderStyle-Width="8%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center"/>
                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, LeaveCategory %>" DataField="LeaveCategory" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Left" />
                                <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, DateRange %>" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <%# Eval("StartDate", "{0:MM/dd/yyyy}") %> - <%# Eval("EndDate", "{0:MM/dd/yyyy}") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Leave %>" HeaderStyle-Width="7%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <%# Eval("TotalDay", "{0:0.#}") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, ApplyDate %>" HeaderStyle-Width="8%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <%# Eval("ApplyDate", "{0:yyyy-MM-dd}") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Reason %>" HeaderStyle-Width="15%" HeaderStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblReason" runat="server" Text='<%#Eval("Reason") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Response %>" HeaderStyle-Width="15%" HeaderStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblResponse" runat="server" Text='<%#Eval("Comments") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Status %>" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <%#  string.IsNullOrEmpty(Convert.ToString(Eval("Comments")))?Eval("Status"): Eval("Status")+" By "+Eval("ApprovedBy") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Action %>" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <a class="<%# Convert.ToString(Eval("Status"))=="Approve"?"displayNone":""%>" href="<%#"ReplyEmployeeLeave.aspx?id="+Eval("EmployeeLeaveCategoryMapID") %>"><i class="fa fa-reply" title="Click to reply leave application"></i></a>
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
