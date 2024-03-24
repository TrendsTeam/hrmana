<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="EmployeeResignSave.aspx.cs" Inherits="ERP.Modules.HRAndPayRoll.Masters.EmployeeResignSave" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeResign %>"></asp:Literal></title>
    <link href="<%=ResolveUrl("~/Styles/daterangepicker.css")%>" rel="stylesheet" />
    <script src="<%=ResolveUrl("~/Scripts/moment.min.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/daterangepicker.js")%>"></script>
    <script src="<%=ResolveUrl("~/Scripts/Modules/HRAndPayRoll/Masters/EmployeeResignSave.js")%>"></script>
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
         <li class="nav-item d-none d-sm-inline-block">
            <a href="javascript:;" title="Save Employee Resign" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveEmployeeResign %>"></asp:Literal></a>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
  <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveEmployeeResign %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, SaveEmployeeResign %>"></asp:Literal></h3>
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
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeName %>"></asp:Literal> 
                            </label>
                            <div class="col-md-10 textLeft">
                                <label id="lblFullName" runat="server"></label>
                            </div>
                        </div>
                       <div class="form-group row">
                            <label class="col-md-2">
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ResignDate %>"></asp:Literal> <span class="required">*</span>
                            </label>
                            <div class="col-md-10">
                                <asp:TextBox ID="txtResignDate" runat="server" ReadOnly="true" CssClass="form-control txtResignDate"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvResignDate" SetFocusOnError="true" ControlToValidate="txtResignDate" CssClass="required" Display="Dynamic" ErrorMessage="Please enter Resign Date." runat="server"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2">
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ResignLetter %>"></asp:Literal>
                            </label>
                            <div class="col-md-10">

                                <div id="divUploadResignLetter" runat="server" class="divUploadResignLetter" style="display: block;">
                                    <asp:FileUpload ID="fuResignLetter" runat="server" />
                                </div>
                                <div id="divViewResignLetter" runat="server" class="divViewResignLetter" style="display: none;">
                                    <asp:HiddenField ID="hfResignLetter" runat="server" />
                                    <a id="btnViewResignLetter" runat="server" class="btn btn-sm" target="_blank"><i class="fa fa-download"></i>&nbsp;Download</a>
                                    <a href="javascript:;" class="btn btn-sm" onclick="EmployeeResignSave.ShowHideDocument('.divViewResignLetter','.divUploadResignLetter');"><i class="fa fa-trash" title="Click to delete resign letter."></i>&nbsp;Delete</a>
                                </div>

                            </div>
                        </div>

                      <div class="form-group row">
                            <label class="col-md-2">
                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Description %>"></asp:Literal> 
                            </label>
                            <div class="col-md-10">
                                <asp:TextBox ID="txtDescription" TextMode="MultiLine" runat="server" CssClass="form-control txtDescription"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-actions">
                            <a href="/Modules/HRAndPayRoll/Masters/EmployeeList.aspx" class="btn pull-right"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Cancel %>"></asp:Literal>
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
