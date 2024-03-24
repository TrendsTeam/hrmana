<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="DeviceAttendance.aspx.cs" Inherits="ERP.Modules.General.DeviceAttendance" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, DeviceAttendance %>"></asp:Literal></title>
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
            <a href="<%=ResolveUrl("~/Modules/General/DeviceAttendance.aspx") %>" title="Device Attendance" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, DeviceAttendance %>"></asp:Literal></a>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, DeviceAttendance %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, DeviceAttendance %>"></asp:Literal></h3>
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
                                                <asp:DropDownList ID="ddlMonth" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <div runat="server" id="divcolor" visible="false">
                                            <div class="widget-content">
                                                <div class="greenFilled margin5 sizeFilled"></div>
                                                <div class="margin5"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Present %>"></asp:Literal></div>
                                                <div class="redFilled margin5 sizeFilled"></div>
                                                <div class="margin5"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Leave %>"></asp:Literal></div>
                                                <div class="cyanFilled margin5 sizeFilled"></div>
                                                <div class="margin5"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Holiday %>"></asp:Literal></div>
                                                <div class="blueFilled margin5 sizeFilled"></div>
                                                <div class="margin5"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, WeeklyOff %>"></asp:Literal></div>
                                                <br />
                                            </div>
                                        </div>

                                        <asp:GridView ID="gvDeviceAttendance" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered gvDeviceAttendance">
                                            <Columns>
                                                <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Date %>" HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAttendanceDate" CssClass='<%#setClass(Convert.ToInt32(Eval("AttendanceType")))%>' runat="server" Text='<%# Eval("AttendanceDateValue") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, Attendances %>" DataField="Attendances" HeaderStyle-Width="40%" HeaderStyle-HorizontalAlign="Left" />
                                                <asp:TemplateField HeaderText="Type" HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAttendanceType" CssClass='<%#setClass(Convert.ToInt32(Eval("AttendanceType")))%>' runat="server" Text='<%# Eval("Type") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, Description %>" DataField="Description" HeaderStyle-Width="30%" HeaderStyle-HorizontalAlign="Left" />
                                            </Columns>
                                            <EmptyDataRowStyle BackColor="#F9F9F9" />
                                        </asp:GridView>
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
