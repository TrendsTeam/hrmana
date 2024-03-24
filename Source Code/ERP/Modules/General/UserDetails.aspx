<%@ Page Title="" Language="C#" MasterPageFile="~/Modules/Main.Master" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" Inherits="ERP.Modules.General.UserDetails" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHead" runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, UserDetails %>"></asp:Literal></title>
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
            <a href="<%=ResolveUrl("~/Modules/General/UserDetails.aspx") %>" title="User Details" class="nav-link"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, UserDetails %>"></asp:Literal></a>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="cBody" ContentPlaceHolderID="cphBody" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h3><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, UserDetails %>"></asp:Literal></h3>
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
                            <h3 class="card-title"><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, UserDetails %>"></asp:Literal></h3>
                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                    <i class="fas fa fa-minus"></i>
                                </button>
                            </div>
                        </div>

                        <div class="card-body">

                            <form id="frmMain" runat="server" class="form-horizontal row-border">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h4><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, PersonalDetails %>"></asp:Literal> </h4>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, FirstName %>"></asp:Literal> 
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblFirstName" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, MiddleName %>"></asp:Literal> 
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblMiddleName" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, LastName %>"></asp:Literal> 
                                            </label>
                                            <div class="col-md-8 textLeft ">
                                                <asp:Label ID="lblLastName" runat="server"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, FatherName %>"></asp:Literal>
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblFatherName" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, DateofBirth %>"></asp:Literal>
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblDateOfBirth" runat="server"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Gender %>"></asp:Literal> 
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblGender" runat="server"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, MaratialStatus %>"></asp:Literal> 
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblMaritalStatus" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Cast %>"></asp:Literal>
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblCast" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Photo %>"></asp:Literal> 
                                            </label>
                                            <div class="col-md-8">
                                                <img id="imgPhoto" runat="server" alt="Photo" class="viewImage" />
                                            </div>
                                        </div>

                                        <h4><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, OfficialDetails %>"></asp:Literal></h4>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                               <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeType %>"></asp:Literal>  
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblEmployeeType" runat="server"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Department %>"></asp:Literal> 
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblDepartment" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Designation %>"></asp:Literal> 
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblDesignation" runat="server"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeGrade %>"></asp:Literal>
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblEmployeeGrade" runat="server"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, JoinDate %>"></asp:Literal> 
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblJoinDate" runat="server"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, PFNumber %>"></asp:Literal>
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblPFNumber" runat="server"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Shift %>"></asp:Literal> 
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblShift" runat="server"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, WorkingDays %>"></asp:Literal> 
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblWorkingDays" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <h4><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ContactDetails %>"></asp:Literal> </h4>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Country %>"></asp:Literal> 
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblCountry" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, State %>"></asp:Literal> 
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblState" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                               <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, City %>"></asp:Literal>   
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblCity" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Address %>"></asp:Literal> 
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblAddress" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, PinCode %>"></asp:Literal> 
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblPinCode" runat="server"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Mobile %>"></asp:Literal> 
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Phone %>"></asp:Literal> 
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblPhone" runat="server"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Email %>"></asp:Literal>  
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                            </div>
                                        </div>

                                        <h4><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, BankInformation %>"></asp:Literal></h4>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, BankName %>"></asp:Literal>
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblBankName" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, BranchName %>"></asp:Literal>
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblBranchName" runat="server"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, AccountName %>"></asp:Literal>
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblAccountName" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, AccountNumber %>"></asp:Literal>
                                            </label>
                                            <div class="col-md-8 textLeft">
                                                <asp:Label ID="lblAccountNumber" runat="server"></asp:Label>
                                            </div>
                                        </div>

                                        <h4><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, EmployeeDocuments %>"></asp:Literal> </h4>

                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Resume %>"></asp:Literal> 
                                            </label>
                                            <div class="col-md-8">
                                                <div id="divViewResume" runat="server" class="divViewResume" style="display: none;">

                                                    <a id="btnViewResume" runat="server" class="btn btn-sm" target="_blank"><i class="fa fa-download"></i>&nbsp;<asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Download %>"></asp:Literal> </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, OfferLetter %>"></asp:Literal> 
                                            </label>
                                            <div class="col-md-8">
                                                <div id="divViewOfferLetter" runat="server" class="divViewOfferLetter" style="display: none;">

                                                    <a id="btnViewOfferLetter" runat="server" class="btn btn-sm" target="_blank"><i class="fa fa-download"></i>&nbsp;<asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Download %>"></asp:Literal> </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, JoiningLetter %>"></asp:Literal> 
                                            </label>
                                            <div class="col-md-8">
                                                <div id="divViewJoiningLetter" runat="server" class="divViewJoiningLetter" style="display: none;">

                                                    <a id="btnViewJoiningLetter" runat="server" class="btn btn-sm" target="_blank"><i class="fa fa-download"></i>&nbsp;<asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Download %>"></asp:Literal> </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ContractPaper %>"></asp:Literal> 
                                            </label>
                                            <div class="col-md-8">
                                                <div id="divViewContractPaper" runat="server" class="divViewContractPaper" style="display: none;">

                                                    <a id="btnViewContractPaper" runat="server" class="btn btn-sm" target="_blank"><i class="fa fa-download"></i>&nbsp;<asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Download %>"></asp:Literal></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, IDProof %>"></asp:Literal>
                                            </label>
                                            <div class="col-md-8">
                                                <div id="divViewIDProff" runat="server" class="divViewIDProff" style="display: none;">

                                                    <a id="btnViewIDProff" runat="server" class="btn btn-sm" target="_blank"><i class="fa fa-download"></i>&nbsp;<asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Download %>"></asp:Literal></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-4">
                                                <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, OtherDocument %>"></asp:Literal>
                                            </label>
                                            <div class="col-md-8">
                                                <div id="divViewOtherDocument" runat="server" class="divViewOtherDocument" style="display: none;">

                                                    <a id="btnViewOtherDocument" runat="server" class="btn btn-sm" target="_blank"><i class="fa fa-download"></i>&nbsp;<asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Download %>"></asp:Literal></a>
                                                </div>
                                            </div>
                                        </div>

                                        <div id="divResignationInformation" runat="server">
                                            <h4><asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ResignationInformation %>"></asp:Literal> </h4>

                                            <div class="form-group row">
                                                <label class="col-md-4">
                                                    <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, ResignLetter %>"></asp:Literal>
                                                </label>
                                                <div class="col-md-8">
                                                    <div id="divResignLetter" runat="server" class="divResignLetter" style="display: none;">
                                                        <a id="btnViewResignLetter" runat="server" class="btn btn-sm" target="_blank"><i class="fa fa-download"></i>&nbsp;<asp:Literal runat="server" Text="<%$Resources:GlobalStrings, Download %>"></asp:Literal></a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-4">
                                                    <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, BranchName %>"></asp:Literal>
                                                </label>
                                                <div class="col-md-8 textLeft">
                                                    <asp:Label ID="Label2" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-4">
                                                    <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, LeaveDate %>"></asp:Literal>
                                                </label>
                                                <div class="col-md-8 textLeft">
                                                    <asp:Label ID="lblLeaveDate" runat="server"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-md-4">
                                                    <asp:Literal runat="server" Text="<%$Resources:GlobalStrings, LeaveDescription %>"></asp:Literal>
                                                </label>
                                                <div class="col-md-8 textLeft">
                                                    <asp:Label ID="lblLeaveDescription" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
