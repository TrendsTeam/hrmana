<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="ERP.Modules.General.Attendance" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Attendance %>"></asp:Literal></title>
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
            <a href="<%=ResolveUrl("~/Modules/General/Attendance.aspx") %>" title="Attendance" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Attendance %>"></asp:Literal></a>
        </li>
    </ul>
</asp:Content>


<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">

    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Attendance %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Attendance %>"></asp:Literal></h3>
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

                                        <div runat="server" id="divAttandanceInformation" visible="false">
                                            <h4><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, AttendanceInformation %>"></asp:Literal> </h4>

                                            <div class="form-group row">
                                                <label class="col-md-2">
                                                    <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalDays %>"></asp:Literal> :
                                                </label>
                                                <div class="col-md-10 textLeft">
                                                    <asp:Label ID="lblTotalDays" runat="server" Text="0"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-2">
                                                    <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalPresent %>"></asp:Literal> :
                                                </label>
                                                <div class="col-md-4 textLeft">
                                                    <asp:Label ID="lblTotalPresent" runat="server" Text="0"></asp:Label>
                                                </div>
                                                <label class="col-md-2">
                                                    <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalLeave %>"></asp:Literal> :
                                                </label>
                                                <div class="col-md-4 textLeft">
                                                    <asp:Label ID="lblTotalLeave" runat="server" Text="0"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-md-2">
                                                    <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalWeeklyOff %>"></asp:Literal> :
                                                </label>
                                                <div class="col-md-4 textLeft">
                                                    <asp:Label ID="lblTotalWeeklyOff" runat="server" Text="0"></asp:Label>
                                                </div>
                                                <label class="col-md-2">
                                                    <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalHoliday %>"></asp:Literal> :
                                                </label>
                                                <div class="col-md-4 textLeft">
                                                    <asp:Label ID="lblTotalHoliday" runat="server" Text="0"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-md-2">
                                                    <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalWorkingHours %>"></asp:Literal> :
                                                </label>
                                                <div class="col-md-4 textLeft">
                                                    <asp:Label ID="lblTotalWorkingHours" runat="server" Text="0"></asp:Label>
                                                </div>
                                                <label class="col-md-2">
                                                    <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalOvertimeHours %>"></asp:Literal> :
                                                </label>
                                                <div class="col-md-4 textLeft">
                                                    <asp:Label ID="lblTotalOvertimeHours" runat="server" Text="0"></asp:Label>
                                                </div>
                                            </div>

                                        </div>

                                        <div runat="server" id="divcolor" visible="false">
                                            <div>
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

                                        <asp:GridView ID="gvEmployeeAttendance" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered gvEmployeeAttendance">
                                            <Columns>
                                                <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Date %>" HeaderStyle-Width="12%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAttendanceDate" CssClass='<%#setClass(Convert.ToInt32(Eval("AttendanceType")))%>' runat="server" Text='<%# Eval("AttendanceDate","{0:MM/dd/yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, InTime %>" DataField="TimeIn" HeaderStyle-Width="12%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" />
                                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, OutTime %>" DataField="TimeOut" HeaderStyle-Width="12%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" />
                                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, WorkingHours %>" DataField="WorkingHours" HeaderStyle-Width="12%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" />
                                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, OvertimeHours %>" DataField="OverTimeHours" HeaderStyle-Width="12%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" />
                                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, Type %>" DataField="AttendanceText" HeaderStyle-Width="12%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" />
                                                <asp:BoundField HeaderText="<%$Resources:GlobalStrings, Description %>" DataField="Description" HeaderStyle-Width="28%" />
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
