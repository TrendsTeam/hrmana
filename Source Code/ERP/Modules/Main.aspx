<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="ERP.Modules.Main1" EnableViewState="true" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><%=ERP.Helpers.SessionHelper.CompanyName %></title>
</asp:Content>

<asp:Content ID="cBreadCrumb" ContentPlaceHolderID="cphBreadCrumb" runat="server">
    <ul class="navbar-nav">
        <li class="nav-item d-none d-sm-inline-block">
            <a href="<%=ResolveUrl("~/Modules/Main.aspx") %>" class="nav-link">
                <i class="fa fa-home"></i>
                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Dashboard %>"></asp:Literal>
            </a>
        </li>
    </ul>

</asp:Content>

<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
    <form id="frmMain" runat="server">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-5">
                        <h3>
                            <asp:Label ID="lblEmployeeName" runat="server"></asp:Label></h3>
                    </div>
                    <div class="col-sm-2">
                        <asp:DropDownList ID="ddlLanguage" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-sm-3">
                        <asp:DropDownList ID="ddlFinancialYear" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-sm-2">
                        <asp:LinkButton CssClass="submit btn btn-primary" ID="btnChange" runat="server" OnClick="btnChange_Click" Text="<%$Resources:GlobalStrings, Change %>"></asp:LinkButton>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>

        <section class="content">
            <div class="container-fluid">


                <div id="divEmployee" visible="false" runat="server">
                    <asp:ScriptManager ID="smMain" runat="server"></asp:ScriptManager>
                    <script src="<%=ResolveUrl("~/Scripts/Loader.js")%>"></script>

                    <div class="row">
                        <div class="col-lg-4 col-6">
                            <!-- small box -->
                            <div class="small-box bg-warning">
                                <div class="inner">
                                    <h3>
                                        <asp:Label ID="lblTotalLeave" runat="server"></asp:Label></h3>

                                    <p><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalLeave %>"></asp:Literal></p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-user"></i>
                                </div>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-4 col-6">
                            <!-- small box -->
                            <div class="small-box bg-danger">
                                <div class="inner">
                                    <h3>
                                        <asp:Label ID="lblUsedLeave" runat="server"></asp:Label></h3>
                                    <p><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, UsedLeave %>"></asp:Literal></p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-user"></i>
                                </div>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-4 col-6">
                            <!-- small box -->
                            <div class="small-box bg-success">
                                <div class="inner">
                                    <h3>
                                        <asp:Label ID="lblRemainingLeave" runat="server"></asp:Label></h3>
                                    <p><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, RemainingLeave %>"></asp:Literal></p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-user"></i>
                                </div>
                            </div>
                        </div>
                        <!-- ./col -->

                        <!-- ./col -->
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <asp:UpdatePanel ID="upCalender" runat="server">
                                <ContentTemplate>

                                    <div class="card">
                                        <div class="card-header border-transparent">
                                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Calender %>"></asp:Literal></h3>
                                            <div class="card-tools">
                                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                    <i class="fas fa fa-minus"></i>
                                                </button>
                                            </div>
                                        </div>

                                        <div class="card-body p-0 table-responsive">
                                            <div class="redFilled margin5 sizeFilled"></div>
                                            <div class="margin5"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Leave %>"></asp:Literal></div>
                                            <div class="cyanFilled margin5 sizeFilled"></div>
                                            <div class="margin5"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Holiday %>"></asp:Literal></div>
                                            <div class="blueFilled margin5 sizeFilled"></div>
                                            <div class="margin5"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, WeeklyOff %>"></asp:Literal></div>
                                            <div class="clearfix"></div>

                                            <asp:Calendar ID="Calendar" TitleStyle-BackColor="#F9F9F9" BorderColor="White" Width="100%" runat="server" OnDayRender="Calendar_DayRender"></asp:Calendar>

                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>

                        <div class="col-md-4">

                            <div class="card">
                                <div class="card-header border-transparent">
                                    <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, UpcomingHolidays %>"></asp:Literal></h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa fa-minus"></i>
                                        </button>
                                    </div>
                                </div>

                                <div class="card-body p-0 table-responsive">
                                    <asp:GridView ID="gvHoliday" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered m-0 gvHoliday">
                                        <Columns>
                                            <asp:BoundField HeaderText="<%$Resources:GlobalStrings, Name %>" DataField="Title" HeaderStyle-Width="50%" />
                                            <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Date %>" HeaderStyle-Width="50%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                                <ItemTemplate>
                                                    <%# Eval("StartDate", "{0:MM/dd/yyyy}") %> -  <%# Eval("EndDate", "{0:MM/dd/yyyy}") %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EmptyDataRowStyle BackColor="#F9F9F9" />
                                    </asp:GridView>
                                </div>
                            </div>


                        </div>

                          <div class="col-md-4">
                            <div class="card">
                                <div class="card-header border-transparent">
                                    <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, UpcomingBirthdays %>"></asp:Literal></h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa fa-minus"></i>
                                        </button>
                                    </div>
                                </div>

                                <div class="card-body p-0 table-responsive">
                                    <asp:GridView ID="gvBirthday" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered m-0 gvBirthday">
                                        <Columns>
                                            <asp:BoundField HeaderText="<%$Resources:GlobalStrings, Name %>" DataField="FullName" HeaderStyle-Width="60%" />
                                            <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Date %>" HeaderStyle-Width="40%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                                <ItemTemplate>
                                                    <%# Eval("BirthDate", "{0:MM/dd/yyyy}") %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EmptyDataRowStyle BackColor="#F9F9F9" />
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">

                            <div class="card">
                                <div class="card-header border-transparent">
                                    <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SalaryChart %>"></asp:Literal></h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa fa-minus"></i>
                                        </button>
                                    </div>
                                </div>

                                <div class="card-body">
                                    <asp:Chart ID="ChartSalary" runat="server" Width="900px">
                                        <Series>
                                            <asp:Series Name="SeriesTotal" IsValueShownAsLabel="true"></asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartAreaSalary">
                                                <AxisX Title="<%$Resources:GlobalStrings, Months %>">
                                                    <MajorGrid Enabled="false" />
                                                </AxisX>
                                                <AxisY Title="<%$Resources:GlobalStrings, Salary %>">
                                                    <MajorGrid Enabled="false" />
                                                </AxisY>
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">

                            <div class="card">
                                <div class="card-header border-transparent">
                                    <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, AttendanceChart %>"></asp:Literal></h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa fa-minus"></i>
                                        </button>
                                    </div>
                                </div>

                                <div class="card-body">
                                    <div class="pinkFilled margin5 sizeFilled"></div>
                                    <div class="margin5"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalDays %>"></asp:Literal></div>
                                    <div class="silverFilled margin5 sizeFilled"></div>
                                    <div class="margin5"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, PresentDays %>"></asp:Literal></div>
                                    <div class="blueFilled margin5 sizeFilled"></div>
                                    <div class="margin5"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, WeeklyOff %>"></asp:Literal></div>
                                    <div class="cyanFilled margin5 sizeFilled"></div>
                                    <div class="margin5"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Holiday %>"></asp:Literal></div>
                                    <div class="redFilled margin5 sizeFilled"></div>
                                    <div class="margin5"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Leave %>"></asp:Literal></div>

                                    <div class="clearfix"></div>
                                    <asp:Chart ID="ChartAttendance" runat="server" BackGradientStyle="None" Width="1000px">
                                        <Series>
                                            <asp:Series Name="SeriesTotalDays" Color="Pink" IsValueShownAsLabel="true"></asp:Series>
                                            <asp:Series Name="SeriesPresentDays" Color="Silver" IsValueShownAsLabel="true"></asp:Series>
                                            <asp:Series Name="SeriesWeekluOff" Color="Blue" IsValueShownAsLabel="true"></asp:Series>
                                            <asp:Series Name="SeriesHolidays" Color="Cyan" IsValueShownAsLabel="true"></asp:Series>
                                            <asp:Series Name="SeriesTotalUseLeave" Color="Red" IsValueShownAsLabel="true"></asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartAreaAttendance">
                                                <AxisX Title="<%$Resources:GlobalStrings, Months %>">
                                                    <MajorGrid Enabled="false" />
                                                </AxisX>
                                                <AxisY Title="<%$Resources:GlobalStrings, Days %>">
                                                    <MajorGrid Enabled="false" />
                                                </AxisY>
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>


                <div id="divAdmin" runat="server" visible="false">

                    <div class="row">
                        <div class="col-lg-4 col-6">
                            <!-- small box -->
                            <div class="small-box bg-success">
                                <div class="inner">
                                    <h3>
                                        <asp:Label ID="lblTotalCurrentEmployee" runat="server"></asp:Label></h3>

                                    <p><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalCurrentEmployee %>"></asp:Literal></p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-users"></i>
                                </div>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-4 col-6">
                            <!-- small box -->
                            <div class="small-box bg-danger">
                                <div class="inner">
                                    <h3>
                                        <asp:Label ID="lblTotalResignEmployee" runat="server"></asp:Label></h3>
                                    <p><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalResignEmployee %>"></asp:Literal></p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-users"></i>
                                </div>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-4 col-6">
                            <!-- small box -->
                            <div class="small-box bg-warning">
                                <div class="inner">
                                    <h3>
                                        <asp:Label ID="lblTotalEmployee" runat="server"></asp:Label></h3>
                                    <p><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalEmployee %>"></asp:Literal></p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-users"></i>
                                </div>
                            </div>
                        </div>
                        <!-- ./col -->

                        <!-- ./col -->
                    </div>


                    <div class="row">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header border-transparent">
                                    <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, UpcomingHolidays %>"></asp:Literal></h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa fa-minus"></i>
                                        </button>
                                    </div>
                                </div>

                                <div class="card-body p-0 table-responsive">
                                    <asp:GridView ID="gvAdminHoliday" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered m-0 gvHoliday">
                                        <Columns>
                                            <asp:BoundField HeaderText="<%$Resources:GlobalStrings, Name %>" DataField="Title" HeaderStyle-Width="60%" />
                                            <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Date %>" HeaderStyle-Width="40%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                                <ItemTemplate>
                                                    <%# Eval("StartDate", "{0:MM/dd/yyyy}") %> -  <%# Eval("EndDate", "{0:MM/dd/yyyy}") %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EmptyDataRowStyle BackColor="#F9F9F9" />
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>

                          <div class="col-md-6">
                            <div class="card">
                                <div class="card-header border-transparent">
                                    <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, UpcomingBirthdays %>"></asp:Literal></h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa fa-minus"></i>
                                        </button>
                                    </div>
                                </div>

                                <div class="card-body p-0 table-responsive">
                                    <asp:GridView ID="gvAdminBirthday" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered m-0 gvAdminBirthday">
                                        <Columns>
                                            <asp:BoundField HeaderText="<%$Resources:GlobalStrings, Name %>" DataField="FullName" HeaderStyle-Width="60%" />
                                            <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Date %>" HeaderStyle-Width="40%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                                <ItemTemplate>
                                                    <%# Eval("BirthDate", "{0:MM/dd/yyyy}") %>
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
        </section>
    </form>
</asp:Content>
