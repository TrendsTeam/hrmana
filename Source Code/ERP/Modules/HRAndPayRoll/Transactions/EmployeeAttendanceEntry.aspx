<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true"
    CodeBehind="EmployeeAttendanceEntry.aspx.cs" Inherits="ERP.Modules.HRAndPayRoll.Transactions.EmployeeAttendanceEntry" %>

<%@ Register Assembly="TimePicker" Namespace="MKB.TimePicker" TagPrefix="cc1" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeAttendance %>"></asp:Literal></title>
    <script src="<%=ResolveUrl("~/Scripts/Modules/HRAndPayRoll/Transactions/EmployeeAttendanceEntry.js")%>"></script>
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
            <a href="<%=ResolveUrl("~/Modules/HRAndPayRoll/Transactions/EmployeeAttendanceEntry.aspx") %>" title="Employee Attendance Entry" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeAttendanceEntry %>"></asp:Literal></a>
        </li>

    </ul>
</asp:Content>
<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
   <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeAttendanceEntry %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeAttendanceEntry %>"></asp:Literal></h3>
                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                    <i class="fas fa fa-minus"></i>
                                </button>
                            </div>
                        </div>

                        <div class="card-body">
                             <form id="frmMain" runat="server" class="form-horizontal row-border">
                        <asp:ScriptManager ID="smMain" runat="server"></asp:ScriptManager>

                      <%--  <script src="<%=ResolveUrl("~/Scripts/Loader.js")%>"></script>
                        
                        <asp:UpdatePanel ID="upMain" runat="server">
                            <ContentTemplate>--%>
                                <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Department %>"></asp:Literal><span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvDepartment" InitialValue="" SetFocusOnError="true" ControlToValidate="ddlDepartment" CssClass="required" Display="Dynamic" ErrorMessage="Please select Department." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                 <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Employee %>"></asp:Literal><span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:DropDownList ID="ddlEmployee" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlEmployee_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvEmployee" InitialValue="" SetFocusOnError="true" ControlToValidate="ddlEmployee" CssClass="required" Display="Dynamic" ErrorMessage="Please select Employee." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                 <div class="form-group row">
                                    <label class="col-md-2">
                                        <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Month %>"></asp:Literal><span class="required">*</span>
                                    </label>
                                    <div class="col-md-10">
                                        <asp:DropDownList ID="ddlMonth" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvMonth" InitialValue="" SetFocusOnError="true" ControlToValidate="ddlMonth" CssClass="required" Display="Dynamic" ErrorMessage="Please select Month." runat="server"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <asp:GridView ID="gvEmployeeAttendance" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered gvEmployeeAttendance">
                                    <Columns>
                                        <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Date %>" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                            <ItemTemplate>
                                                <asp:HiddenField runat="server" ID="hfEmployeeAttendanceId" Value='<%# Eval("EmployeeAttendanceID") %>'/>
                                                <asp:Label ID="lblAttendanceDate" runat="server" Text='<%# Eval("AttendanceDate","{0:MM/dd/yyyy}") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, InTime %>"  HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                            <ItemTemplate>
                                                <cc1:TimeSelector ID="tsTimeIn" Hour='<%# Eval("TimeInHours") %>' Minute='<%# Eval("TimeInMinutes") %>' SelectedTimeFormat="Twelve" AmPm='<%# Eval("TimeInAMPM")=="AM"?MKB.TimePicker.TimeSelector.AmPmSpec.AM:MKB.TimePicker.TimeSelector.AmPmSpec.PM %>' runat="server" DisplaySeconds="false" CssClass="Timer">
                                                </cc1:TimeSelector>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, OutTime %>" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                            <ItemTemplate>
                                                <cc1:TimeSelector ID="tsTimeOut" Hour='<%# Eval("TimeOutHours") %>' Minute='<%# Eval("TimeOutMinutes") %>' SelectedTimeFormat="Twelve" AmPm='<%# Eval("TimeOutAMPM")=="AM"?MKB.TimePicker.TimeSelector.AmPmSpec.AM:MKB.TimePicker.TimeSelector.AmPmSpec.PM %>' runat="server" DisplaySeconds="false" CssClass="Timer">
                                                </cc1:TimeSelector>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, WorkingHours %>" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtWorkingHours" runat="server" onKeyUp="EmployeeAttendanceEntry.checkDecimal(this);" Text='<%# Eval("WorkingHours") %>' Enabled='<%# ((Convert.ToInt32(Eval("AttendanceType"))== 2 || (Convert.ToInt32(Eval("AttendanceType"))== 3 ))? false:true) %>' CssClass="form-control" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, OvertimeHours %>" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtOvertimeHours" runat="server" onKeyUp="EmployeeAttendanceEntry.checkDecimal(this);" Text='<%# Eval("OvertimeHours") %>' CssClass="form-control"/>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Type" HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlAttendanceType" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlAttendanceType_SelectedIndexChanged" Enabled='<%# ((Convert.ToInt32(Eval("AttendanceType"))== 2 || (Convert.ToInt32(Eval("AttendanceType"))== 3 ))? false:true) %>' SelectedValue='<%# Eval("AttendanceType") %>' runat="server">
                                                    <asp:ListItem Value="4" Text="<%$Resources:GlobalStrings, Default %>"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="<%$Resources:GlobalStrings, Holiday %>"></asp:ListItem>
                                                    <asp:ListItem Value="1" Text="<%$Resources:GlobalStrings, Leave %>"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="<%$Resources:GlobalStrings, WeeklyOff %>"></asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Attendance %>" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAttendance" Text='<%# ((Convert.ToInt32(Eval("AttendanceType"))== 4)? "Present":"") %>' Visible='<%# ((Convert.ToInt32(Eval("AttendanceType"))== 4)? true:false) %>' runat="server" />
                                                <asp:DropDownList ID="ddlAttendance" CssClass="form-control" Visible='<%# ((Convert.ToInt32(Eval("AttendanceType"))== 1)? true:false) %>' SelectedValue='<%# Eval("Attendance") %>' runat="server">
                                                    <asp:ListItem Value="1.00">1</asp:ListItem>
                                                    <asp:ListItem Value="0.50">0.5</asp:ListItem>
                                                    <asp:ListItem Value="0.00">0</asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$Resources:GlobalStrings, Description %>" HeaderStyle-Width="25%" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtDescription" runat="server" Text='<%# Eval("Description") %>' CssClass="form-control" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataRowStyle BackColor="#F9F9F9" />
                                </asp:GridView>

                           <%-- </ContentTemplate>
                        </asp:UpdatePanel>--%>

                        <div class="form-actions">
                            <a href="/Modules/Main.aspx" class="btn pull-right"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Cancel %>"></asp:Literal>
                            </a>
                            <asp:Button CssClass="btn btn-success pull-right" ID="btnSave" OnClick="btnSave_Click" runat="server" Text="<%$Resources:GlobalStrings, Save %>" />

                        </div>
                    </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
   
</asp:Content>
