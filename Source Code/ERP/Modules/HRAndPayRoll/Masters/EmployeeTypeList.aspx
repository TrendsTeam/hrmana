<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="EmployeeTypeList.aspx.cs" Inherits="ERP.Modules.HRAndPayRoll.Masters.EmployeeTypeList" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeType %>"></asp:Literal></title>
    <script src="<%=ResolveUrl("~/Scripts/Modules/HRAndPayRoll/Masters/EmployeeTypeList.js")%>"></script>
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
            <a href="<%=ResolveUrl("~/Modules/HRAndPayRoll/Masters/EmployeeTypeList.aspx") %>" title="Employee Type" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeType %>"></asp:Literal></a>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
   <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeType %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeType %>"></asp:Literal></h3>
                            <div class="card-tools">
                                <span class="btn btn-xs">
                                <i class="fa fa-plus"></i>
                                <a href="<%=ResolveUrl("~/Modules/HRAndPayRoll/Masters/EmployeeTypeSave.aspx") %>"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, AddEmployeeType %>"></asp:Literal></a>
                            </span>
                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                    <i class="fas fa fa-minus"></i>
                                </button>
                            </div>
                        </div>

                        <div class="card-body">
                             <form id="frmMain" runat="server">
                        <asp:GridView OnPreRender="gvEmployeeType_PreRender" ID="gvEmployeeType" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered gvEmployeeType">
                            <Columns>
                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, EmployeeType %>" DataField="EmployeeTypeName" HeaderStyle-Width="60%" HeaderStyle-HorizontalAlign="Left" />
                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, LeaveMonth %>" DataField="NoOfLeavePerMonth" HeaderStyle-Width="30%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center"/>
                                <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Action %>" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <a href="<%#"EmployeeTypeSave.aspx?id="+Eval("EmployeeTypeID") %>"><i class="fa fa-edit" title="Click to edit employee type"></i></a>&nbsp; 
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandArgument='<%#Eval("EmployeeTypeID") %>' OnClick="btnDelete_Click" CssClass="btnDelete"><i class="fa fa-remove" title="Click to delete employee type"></i></asp:LinkButton>
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
