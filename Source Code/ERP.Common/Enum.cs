using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ERP.Common
{
    public enum Role
    {
        [Description("c2737ea6-bfe8-401d-ad15-43147de775ca")]
        Administrator = 1,
        [Description("5417f6e8-9dab-4a8c-9c35-cb197193be13")]
        Employee = 2,
    };

    public enum OperationType
    {
        Insert = 1,
        Update = 2,
        Delete = 3,
        Resign = 4,
    };

    public enum TableType
    {
        UserMaster = 1,
        DepartmentMaster = 2,
        EmployeeTypeMaster = 3,
        DesignationMaster = 4,
        LeaveCategoryMaster = 5,
        EmployeeGradeMaster = 6,
        AllowanceMaster = 7,
        DeductionMaster = 8,
        ShiftMaster = 9,
        HolidayMaster = 10,
        EmployeeMaster = 11,
        EmployeeLoan = 12,
        EmployeeSalary = 13,
        EmployeeLeaveCategory = 14,
        CompanyMaster= 15,
        EmployeeAttendance = 16,
        EmployeePaidSalary = 17,
        FinancialYearMaster = 18,
        CountryMaster = 19,
        StateMaster = 20,
        EducationMaster=21,
        VisitMaster = 22,
    };

    public enum EmployeeAttachmentType
    {
        Resume = 1,
        OfferLetter = 2,
        JoiningLetter = 3,
        ContractPaper = 4,
        IDProff = 5,
        OtherDocument = 6,
        ResignLetter = 7,
    };

    public enum UploadFileFolderName
    {
        EmployeePhoto = 1,
        EmployeeDocument = 2,
        CompanyLogo=3,
    };

    public enum AttendanceType
    {
        [Description("Leave")]
        Leave = 1,
        [Description("Weekly Off")]
        WeeklyOff = 2,
        [Description("Holiday")]
        Holiday = 3,
        [Description("Present")]
        Present = 4,
    };

    public enum PunchMethod
    {
        IN = 1,
        OUT = 2,
    }

    public enum ConnectionStatusValue
    {
        Connected = 1,
        DisConnected = 2,
    }

    public enum CultureType
    {
        [Description("en-US")]
        English = 1,
        [Description("ar-AE")]
        Arabic = 2
    };
}
