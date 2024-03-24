using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ERP.Common
{
    public static class Messages
    {
        public static string MsgBoxTitle = "HRM";
        public static string ExitMsg = "Are you sure you want to exit ?";
        public static string ErrorMsgTitle = "* Please Correct the Following Errors :";
        public static string RequiredMsg = "Please Fill the Required field";
        public static string LogoffMsg = "Are you sure you want to Logoff?";
        public static string FailLogin = "Login failed. Invalid login detail. Please Try Again!";
        public static string ExceptionMsg = "Please try again or Contact to support team.";
        public static string NoRecordMsg = "No record found.";
        public static string SaveSuccessMsg = "Record saved successfully!";
        public static string SelectOneRecordMsg = "Please select atleast one {0}!";
        public static string DeleteMsg = "Are you sure, you want to delete this {0}?";
        public static string DuplicateMsg = "{0} is already exists! Please enter different {0}.";
        public static string ReferenceExistMsg = "{0} reference used in another place, you cannot perform delete action.";
        public static string ApproveMsg = "Are you sure, you want to approve this {0}?";
        public static string ResignMsg = "Are you sure, you want to resign this {0}?";
        public static string ConnectDeviceErrMsg = "Device can not connect, Please try again!";
        public static string DefaultPassword = "123456";
        public static string IsEnableMsg = "Are you sure, you want to {0} this {1}?";
        public static string RecordSaveSuccessMsg = "{0} has been saved successfully.";
    }
}
