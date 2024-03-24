<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="LeaveApplicationList.aspx.cs" Inherits="ERP.Modules.General.LeaveApplicationList" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, LeaveApplication %>"></asp:Literal></title>
    <script src="<%=ResolveUrl("~/Scripts/Modules/General/LeaveApplicationList.js")%>"></script>
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
            <a href="<%=ResolveUrl("~/Modules/General/LeaveApplicationList.aspx") %>" title="Leave Application" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, LeaveApplication %>"></asp:Literal></a>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, LeaveApplication %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, LeaveApplication %>"></asp:Literal></h3>
                            <div class="card-tools">
                                <span class="btn btn-xs">
                                    <i class="fa fa-plus"></i>
                                    <a href="<%=ResolveUrl("~/Modules/General/ApplyLeaveApplication.aspx") %>"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ApplyLeaveApplication %>"></asp:Literal></a>
                                </span>
                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                    <i class="fas fa fa-minus"></i>
                                </button>
                            </div>
                        </div>

                        <div class="card-body">

                            <form id="frmMain" runat="server">
                                <asp:GridView OnPreRender="gvLeaveApplication_PreRender" ID="gvLeaveApplication"
                                    OnRowDataBound="gvLeaveApplication_RowDataBound" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered gvLeaveApplication">
                                    <Columns>
                                        <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, LeaveCategory %>" HeaderStyle-Width="15%" HeaderStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <span class='<%# Convert.ToBoolean(Eval("IsApprove"))?"greenFont":"" %>'><%# Eval("LeaveCategory") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, DateRange %>" HeaderStyle-Width="12%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                            <ItemTemplate>
                                                <%# Eval("StartDate", "{0:MM/dd/yyyy}") %> - <%# Eval("EndDate", "{0:MM/dd/yyyy}") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Leave %>" HeaderStyle-Width="8%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                            <ItemTemplate>
                                                <%# Eval("TotalDay", "{0:0.#}") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Reason %>" HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:Label ID="lblReason" runat="server" Text='<%#Eval("Reason") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Response %>" HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:Label ID="lblResponse" runat="server" Text='<%#Eval("Comments") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Status %>" HeaderStyle-Width="20%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                            <ItemTemplate>
                                                <%#  string.IsNullOrEmpty(Convert.ToString(Eval("Comments")))?Eval("Status"): Eval("Status")+" By "+Eval("ApprovedBy") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Action %>" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                            <ItemTemplate>
                                                <a class="<%# Convert.ToString(Eval("Status"))=="Approve"?"displayNone":""%>" href="<%#"ApplyLeaveApplication.aspx?id="+Eval("EmployeeLeaveCategoryMapID") %>"><i class="fa fa-edit" title="Click to edit apply employee leave"></i></a>&nbsp; 
                                                 <asp:LinkButton ID="btnDelete" runat="server" CommandArgument='<%#Eval("EmployeeLeaveCategoryMapID") %>' OnClick="btnDelete_Click" CssClass='<%# string.IsNullOrEmpty(Convert.ToString(Eval("Comments")))?"btnDelete":"displayNone"%>'><i class="fa fa-remove" title="Click to delete apply employee leave"></i></asp:LinkButton>
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
