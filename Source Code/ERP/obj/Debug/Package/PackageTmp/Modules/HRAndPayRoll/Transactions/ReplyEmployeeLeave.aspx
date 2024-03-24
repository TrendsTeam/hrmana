<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="ReplyEmployeeLeave.aspx.cs" Inherits="ERP.Modules.HRAndPayRoll.Transactions.ReplyEmployeeLeave" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeLeave %>"></asp:Literal></title>
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

        <li class="nav-item d-none d-sm-inline-block">
            <a href="javascript:;" title="Reply Employee Leave" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ReplyEmployeeLeave %>"></asp:Literal></a>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
     <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ReplyEmployeeLeave %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ReplyEmployeeLeave %>"></asp:Literal></h3>
                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                    <i class="fas fa fa-minus"></i>
                                </button>
                            </div>
                        </div>

                        <div class="card-body">
                            <form id="frmMain" runat="server" class="form-horizontal row-border">
                        <asp:HiddenField ID="hfId" runat="server" />

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
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeNo %>"></asp:Literal> :
                            </label>
                            <div class="col-md-10 textLeft">
                                <label runat="server" id="lblEmployeeNo"></label>
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
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, LeaveCategory %>"></asp:Literal> :
                            </label>
                            <div class="col-md-10 textLeft">
                               <label runat="server" id="lblLeaveCategory"></label>
                            </div>
                        </div>
                         <div class="form-group row">
                            <label class="col-md-2">
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, StartDateEndDate %>"></asp:Literal> :
                            </label>
                            <div class="col-md-10 textLeft">
                               <label runat="server" id="lblDateRange"></label>
                            </div>
                        </div>
                         <div class="form-group row">
                            <label class="col-md-2">
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ConsiderHalfLeave %>"></asp:Literal> :
                            </label>
                            <div class="col-md-10">
                                <label class="checkbox-inline">
                                    <asp:CheckBox ID="chkStartDateHalfLeave" runat="server" Text="<%$Resources:GlobalStrings, StartDateHalfLeave %>" Enabled="false" />
                                </label>
                                <label class="checkbox-inline">
                                    <asp:CheckBox ID="chkEndDateHalfLeave" runat="server" Text="<%$Resources:GlobalStrings, EndDateHalfLeave %>" Enabled="false"/>
                                </label>
                            </div>
                        </div>
                         <div class="form-group row">
                            <label class="col-md-2">
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, TotalLeave %>"></asp:Literal> :
                            </label>
                            <div class="col-md-10 textLeft">
                                 <label runat="server" id="lblTotalLeave"></label>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ApplyDate %>"></asp:Literal> :
                            </label>
                            <div class="col-md-10 textLeft">
                                 <label runat="server" id="lblApplyDate"></label>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2">
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Reason %>"></asp:Literal> :
                            </label>
                            <div class="col-md-10 textLeft">
                               <label runat="server" id="lblReason"></label>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Status %>"></asp:Literal> :
                            </label>
                            <div class="col-md-10 textLeft">
                               <label runat="server" id="lblStatus"></label>
                            </div>
                        </div>
                         <div class="form-group row">
                            <label class="col-md-2">
                               <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, IsApprove %>"></asp:Literal> :
                            </label>
                            <div class="col-md-10">
                                <label class="checkbox-inline">
                                    <asp:CheckBox ID="chkIsApprove" runat="server"  />
                                </label>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2">
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Response %>"></asp:Literal> :<span class="red">*</span>
                            </label>
                            <div class="col-md-10 textLeft">
                                <asp:TextBox ID="txtReply" MaxLength="1000" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvReply"
                                            ControlToValidate="txtReply" SetFocusOnError="true" runat="server" ErrorMessage="Please enter Response." CssClass="required" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-actions">
                            <a href="/Modules/HRAndPayRoll/Transactions/EmployeeLeaveList.aspx" class="btn pull-right"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Cancel %>"></asp:Literal>
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


