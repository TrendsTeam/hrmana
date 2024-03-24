<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="ApplyLeaveApplication.aspx.cs" Inherits="ERP.Modules.General.ApplyLeaveApplication" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, LeaveApplication %>"></asp:Literal></title>
    <link href="<%=ResolveUrl("~/Styles/daterangepicker.css")%>" rel="stylesheet" />
    <script src="<%=ResolveUrl("~/Scripts/moment.min.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/daterangepicker.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/Modules/General/ApplyLeaveApplication.js")%>"></script>
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
         <li class="nav-item d-none d-sm-inline-block">
            <a href="javascript:;" title="Apply Leave Application" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ApplyLeaveApplication %>"></asp:Literal></a>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ApplyLeaveApplication %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ApplyLeaveApplication %>"></asp:Literal></h3>
                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                    <i class="fas fa fa-minus"></i>
                                </button>
                            </div>
                        </div>

                        <div class="card-body">
                             <form id="frmMain" runat="server" class="form-horizontal row-border">
                        <asp:HiddenField ID="hfId" runat="server" />
                        <asp:HiddenField ID="hfStatus" runat="server" Value="" />
                         <asp:HiddenField ID="hfReply" runat="server" Value="" />
                        <div class="form-group row">
                            <label class="col-md-2">
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeName %>"></asp:Literal> :
                            </label>
                            <div class="col-md-10 textLeft">
                                <label runat="server" id="lblEmployeeName"></label>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2">
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Leaves %>"></asp:Literal> :
                            </label>
                            <div class="col-md-10 textLeft">
                                <label runat="server" id="lblLeaves" >0</label>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2">
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, LeaveCategory %>"></asp:Literal> <span class="required">*</span>
                            </label>
                            <div class="col-md-10">
                                <asp:DropDownList ID="ddlLeaveCategory" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvLeaveCategory" SetFocusOnError="true" ControlToValidate="ddlLeaveCategory" CssClass="required" Display="Dynamic" InitialValue="" ErrorMessage="Please select Leave Category." runat="server"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, StartDateEndDate %>"></asp:Literal>
                            </label>
                            <div class="col-md-10 date-select">
                                <input type="text" runat="server" readonly="" id="txtDateRange" class="form-control txtDateRange" />
                                <%--<i class="glyphicon glyphicon-calendar fa fa-calendar"></i>--%>
                            </div>
                        </div>
                         <div class="form-group row">
                            <label class="col-md-2">
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ConsiderHalfLeave %>"></asp:Literal>
                            </label>
                            <div class="col-md-10">
                                <label class="checkbox-inline">
                                    <asp:CheckBox ID="chkStartDateHalfLeave" runat="server" Text="<%$Resources:GlobalStrings, StartDateHalfLeave %>" />
                                </label>
                                <label class="checkbox-inline">
                                    <asp:CheckBox ID="chkEndDateHalfLeave" runat="server" Text="<%$Resources:GlobalStrings, EndDateHalfLeave %>" />
                                </label>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalLeave %>"></asp:Literal> <span class="required">*</span>
                            </label>
                            <div class="col-md-10">
                                <asp:TextBox ID="txtTotalLeave" MaxLength="6" runat="server" CssClass="form-control txtBasic" onkeypress="return Common.isNumericKey(event,this)"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvTotalLeave" SetFocusOnError="true" ControlToValidate="txtTotalLeave" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Total Leave." runat="server"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                       

                        <div class="form-group row">
                            <label class="col-md-2">
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Reason %>"></asp:Literal> <span class="required">*</span>
                            </label>
                            <div class="col-md-10">
                                <asp:TextBox ID="txtReason" MaxLength="1000" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvReason" SetFocusOnError="true" ControlToValidate="txtReason" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Reason." runat="server"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-actions">
                            <a href="/Modules/General/LeaveApplicationList.aspx" class="btn pull-right"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Cancel %>"></asp:Literal>
                            </a>
                            <asp:Button CssClass="btn btn-success pull-right" ID="btnSave" runat="server" Text="<%$Resources:GlobalStrings, Save %>" OnClick="btnSave_Click" />

                        </div>
                    </form>
                          
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
