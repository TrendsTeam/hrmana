<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="EmployeeList.aspx.cs" Inherits="ERP.Modules.HRAndPayRoll.Masters.EmployeeList" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Employee %>"></asp:Literal></title>
    <script src="<%=ResolveUrl("~/Scripts/Modules/HRAndPayRoll/Masters/EmployeeList.js")%>"></script>
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
    </ul>
</asp:Content>
<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
  <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Employee %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Employee %>"></asp:Literal></h3>
                            <div class="card-tools">
                                 <span class="btn btn-xs">
                                <i class="fa fa-plus"></i>
                                <a href="<%=ResolveUrl("~/Modules/HRAndPayRoll/Masters/EmployeeSave.aspx") %>"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, AddEmployee %>"></asp:Literal></a>
                            </span>
                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                    <i class="fas fa fa-minus"></i>
                                </button>
                            </div>
                        </div>

                        <div class="card-body">
                            <form id="frmMain" runat="server">
                        <asp:GridView OnPreRender="gvEmployee_PreRender" ID="gvEmployee" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered gvEmployee">
                            <Columns>
                                <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, FullName %>" HeaderStyle-Width="15%" HeaderStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <span class='<%# Convert.ToBoolean(Eval("IsLeave"))?"redFont":"" %>'><%# Eval("FullName") %></span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, EmpNo %>" DataField="EmployeeNo" HeaderStyle-Width="8%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" />
                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, EmployeeType %>" DataField="EmployeeType" HeaderStyle-Width="12%" HeaderStyle-HorizontalAlign="Left" />
                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, EmployeeGrade %>" DataField="EmployeeGrade" HeaderStyle-Width="12%" HeaderStyle-HorizontalAlign="Left" />
                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, Department %>" DataField="Department" HeaderStyle-Width="11%" HeaderStyle-HorizontalAlign="Left" />
                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, Designation %>" DataField="Designation" HeaderStyle-Width="11%" HeaderStyle-HorizontalAlign="Left" />
                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, Email %>" DataField="Email" HeaderStyle-Width="15%" HeaderStyle-HorizontalAlign="Left" />
                                 <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Resign %>" HeaderStyle-Width="8%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <%# Convert.ToBoolean(Eval("IsLeave"))?"Yes":"No" %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Action %>" HeaderStyle-Width="8%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                       <a class='<%# Convert.ToBoolean(Eval("IsLeave"))?"displayNone":"" %>' href="<%#"EmployeeSave.aspx?id="+Eval("EmployeeID") %>"><i class="fa fa-edit" title="Click to edit employee"></i></a>&nbsp; 
                                      <asp:LinkButton   ID="btnDelete" runat="server" CommandArgument='<%#Eval("EmployeeID") %>' OnClick="btnDelete_Click" CssClass='<%# Convert.ToBoolean(Eval("IsLeave"))?"btnDelete displayNone":"btnDelete" %>'><i class="fa fa-remove" title="Click to delete employee"></i></asp:LinkButton>
                                        &nbsp;<a href="<%#"EmployeeResignSave.aspx?id="+Eval("EmployeeID") %>"><i class="fa fa-times-circle" title="Click to resign employee"></i></a>
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
