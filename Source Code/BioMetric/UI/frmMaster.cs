using BioMetric.UI.Attendance;
using BioMetric.UI.Maintenance;
using BioMetric.UI.Reports;
using ERP.Common;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BioMetric.UI
{
    public partial class frmMaster : Form
    {
        #region Variables

        bool _IsExist = true;

        #endregion


        #region Page events and constructor

        public frmMaster()
        {
            InitializeComponent();
        }

        private void frmMaster_Load(object sender, EventArgs e)
        {
            SetInitialControl();
        }

        private void frmMaster_FormClosing(object sender, FormClosingEventArgs e)
        {
            Properties.Settings.Default.UserId = "";

            if (_IsExist)
            {
                if (MessageBox.Show(Messages.ExitMsg, Messages.MsgBoxTitle, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    Application.ExitThread();
                    Application.Exit();
                }
                else
                {
                    e.Cancel = true;
                }
            }
        }

        #endregion


        #region Button Events

        private void btnLogOff_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show(Messages.LogoffMsg, Messages.MsgBoxTitle, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                LogOff();
            }
        }

        private void tMaster_Tick(object sender, EventArgs e)
        {
            lblTimeNow.Text = "Time Now: " + System.DateTime.Now.ToString("T");
        }

        #endregion


        #region Menu item click events

        private void tsmDevice_Click(object sender, EventArgs e)
        {
            frmDevice _frmDevice = (frmDevice)Application.OpenForms.Cast<Form>().Where(q => q.Name == "frmDevice").FirstOrDefault();
            if (_frmDevice != null)
            {
                _frmDevice.Focus();
            }
            else
            {
                _frmDevice = new frmDevice();
                _frmDevice.Show();
                _frmDevice.Focus();
            }
        }

        private void tsmSendEmployee_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show("Are you sure, you want to send Employee to Device(s)?", Messages.MsgBoxTitle, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    frmSendEmployee _frmSendEmployee = new frmSendEmployee();
                    _frmSendEmployee.ShowInTaskbar = true;
                    _frmSendEmployee.BringToFront();
                    _frmSendEmployee.ShowDialog();
                    if (!string.IsNullOrEmpty(_frmSendEmployee.ErrorMessage.Trim()))
                    {
                        string _Error = _frmSendEmployee.ErrorMessage.Trim();
                        MessageBox.Show(_Error, Messages.MsgBoxTitle, MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1);
                    }
                    else
                    {
                        MessageBox.Show("Employee(s) have been sent successfully!", Messages.MsgBoxTitle, MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1);
                    }
                }
            }
            catch { }

        }

        private void tsmEmployee_Click(object sender, EventArgs e)
        {
            frmEmployeeEnrollment _frmEmployeeEnrollment = (frmEmployeeEnrollment)Application.OpenForms.Cast<Form>().Where(q => q.Name == "frmEmployeeEnrollment").FirstOrDefault();
            if (_frmEmployeeEnrollment != null)
            {
                _frmEmployeeEnrollment.Focus();
            }
            else
            {
                _frmEmployeeEnrollment = new frmEmployeeEnrollment();
                _frmEmployeeEnrollment.Show();
                _frmEmployeeEnrollment.Focus();
            }
        }

        private void tsmSynchronizeFingerprint_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show("Are you sure, you want to synchronize fingerprint?", Messages.MsgBoxTitle, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    frmSynchronizeFingerPrint _frmSynchronizeFingerPrint = new frmSynchronizeFingerPrint();
                    _frmSynchronizeFingerPrint.ShowInTaskbar = true;
                    _frmSynchronizeFingerPrint.BringToFront();
                    _frmSynchronizeFingerPrint.ShowDialog();
                    if (!string.IsNullOrEmpty(_frmSynchronizeFingerPrint.ErrorMessage.Trim()))
                    {
                        string _Error = _frmSynchronizeFingerPrint.ErrorMessage.Trim();
                        MessageBox.Show(_Error, Messages.MsgBoxTitle, MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1);
                    }
                    else
                    {
                        MessageBox.Show("Fingerprint have been synchronized successfully!", Messages.MsgBoxTitle, MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1);
                    }
                }
            }
            catch { }
        }

        private void tsmCollectFingerprint_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show("Are you sure, you want to collect fingerprint from device(s)?", Messages.MsgBoxTitle, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    frmCollectFingerPrint _frmCollectFingerPrint = new frmCollectFingerPrint();
                    _frmCollectFingerPrint.ShowInTaskbar = true;
                    _frmCollectFingerPrint.BringToFront();
                    _frmCollectFingerPrint.ShowDialog();
                    if (!string.IsNullOrEmpty(_frmCollectFingerPrint.ErrorMessage.Trim()))
                    {
                        string _Error = _frmCollectFingerPrint.ErrorMessage.Trim();
                        MessageBox.Show(_Error, Messages.MsgBoxTitle, MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1);
                    }
                    else
                    {
                        MessageBox.Show("Fingerprint have been collected successfully!", Messages.MsgBoxTitle, MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1);
                    }
                }
            }
            catch { }
        }

        private void tsmCollectAttendancefromTerminal_Click(object sender, EventArgs e)
        {
            frmCollectAttendance _frmCollectAttendance = (frmCollectAttendance)Application.OpenForms.Cast<Form>().Where(q => q.Name == "frmCollectAttendance").FirstOrDefault();
            if (_frmCollectAttendance != null)
            {
                _frmCollectAttendance.Focus();
            }
            else
            {
                _frmCollectAttendance = new frmCollectAttendance();
                _frmCollectAttendance.Show();
                _frmCollectAttendance.Focus();
            }
        }

        private void tsmEmployeeAttendance_Click(object sender, EventArgs e)
        {
            frmEmployeeAttendance _frmEmployeeAttendance = (frmEmployeeAttendance)Application.OpenForms.Cast<Form>().Where(q => q.Name == "frmEmployeeAttendance").FirstOrDefault();
            if (_frmEmployeeAttendance != null)
            {
                _frmEmployeeAttendance.Focus();
            }
            else
            {
                _frmEmployeeAttendance = new frmEmployeeAttendance();
                _frmEmployeeAttendance.ShowDialog();
                _frmEmployeeAttendance.Focus();
            }
        }

        private void tsmMapEmployee_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show("Are you sure, you want to map employee?", Messages.MsgBoxTitle, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    frmMapEmployee _frmMapEmployee = new frmMapEmployee();
                    _frmMapEmployee.ShowInTaskbar = true;
                    _frmMapEmployee.BringToFront();
                    _frmMapEmployee.ShowDialog();
                    if (!string.IsNullOrEmpty(_frmMapEmployee.ErrorMessage.Trim()))
                    {
                        string _Error = _frmMapEmployee.ErrorMessage.Trim();
                        MessageBox.Show(_Error, Messages.MsgBoxTitle, MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1);
                    }
                    else
                    {
                        MessageBox.Show("Employee have been mapped successfully!", Messages.MsgBoxTitle, MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1);
                    }
                }
            }
            catch { }
        }

        private void tsmRegisterDLL32_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Are you sure, you want to register dll?", Messages.MsgBoxTitle, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                try
                {
                    string FilePath = Application.StartupPath + "\\RequireDLL\\ScriptRegister.bat";

                    #region FOR 32-Bit System

                    #region RUNAS PRINCIPAL

                    WindowsPrincipal pricipal = new WindowsPrincipal(WindowsIdentity.GetCurrent());
                    bool hasAdministrativeRight = pricipal.IsInRole(WindowsBuiltInRole.Administrator);

                    if (hasAdministrativeRight)
                    {
                        #region  ADMINISTRATIVE

                        FileStream fs = new FileStream(FilePath, FileMode.Append, FileAccess.Write);
                        StreamWriter sw = new StreamWriter(fs);
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\commpro.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\comms.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\plcommpro.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\plcomms.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\plrscagent.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\plrscomm.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\pltcpcomm.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\rscagent.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\rscomm.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\tcpcomm.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\usbcomm.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\zkemkeeper.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\zkemsdk.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine("regsvr32  /s zkemkeeper.dll");
                        sw.Close();

                        Process process = new Process();
                        ProcessStartInfo info = new ProcessStartInfo(FilePath);
                        info.UseShellExecute = true;
                        process.StartInfo = info;
                        process.StartInfo.WindowStyle = ProcessWindowStyle.Hidden;
                        process.Start();
                        while (!process.HasExited)
                        {
                            System.Threading.Thread.Sleep(1000);
                        }
                        #endregion
                    }
                    else
                    {
                        #region registerDLLS

                        FileStream fs = new FileStream(FilePath, FileMode.Append, FileAccess.Write);
                        StreamWriter sw = new StreamWriter(fs);
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\commpro.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\comms.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\plcommpro.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\plcomms.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\plrscagent.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\plrscomm.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\pltcpcomm.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\rscagent.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\rscomm.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\tcpcomm.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\usbcomm.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\zkemkeeper.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL\zkemsdk.dll C:\WINDOWS\system32\ /y");
                        sw.WriteLine("regsvr32  /s zkemkeeper.dll");
                        sw.Close();
                        Process process = new Process();
                        ProcessStartInfo info = new ProcessStartInfo(FilePath);
                        info.UseShellExecute = true;
                        info.Verb = "runas";
                        process.StartInfo = info;
                        process.StartInfo.WindowStyle = ProcessWindowStyle.Hidden;
                        process.Start();
                        while (!process.HasExited)
                        {
                            System.Threading.Thread.Sleep(1000);
                        }

                        #endregion
                    }

                    #endregion

                    #endregion

                    MessageBox.Show("Dll have been registered successfully!", Messages.MsgBoxTitle, MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1);
                }
                catch (Exception)
                {
                    MessageBox.Show("Dll have been not registered successfully! Please try again.", Messages.MsgBoxTitle, MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void tsmRegisterDLL64_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Are you sure, you want to register dll?", Messages.MsgBoxTitle, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                try
                {
                    string FilePath = Application.StartupPath + "\\RequireDLL\\Script64Register.bat";

                    #region FOR 64-Bit System

                    #region RUNAS PRINCIPAL

                    WindowsPrincipal pricipal = new WindowsPrincipal(WindowsIdentity.GetCurrent());
                    bool hasAdministrativeRight = pricipal.IsInRole(WindowsBuiltInRole.Administrator);
                    if (hasAdministrativeRight)
                    {
                        #region ADMINISTRATIVE

                        FileStream fs = new FileStream(FilePath, FileMode.Append, FileAccess.Write);
                        StreamWriter sw = new StreamWriter(fs);

                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\commpro.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\comms.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\plcommpro.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\plcomms.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\plrscagent.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\plrscomm.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\pltcpcomm.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\rscagent.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\rscomm.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\tcpcomm.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\usbcomm.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\zkemkeeper.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\zkemsdk.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"%windir%\syswow64\regsvr32.exe %windir%\syswow64\zkemkeeper.dll");
                        sw.Close();

                        Process process = new Process();
                        ProcessStartInfo info = new ProcessStartInfo(FilePath);
                        info.UseShellExecute = true;
                        process.StartInfo = info;
                        process.StartInfo.WindowStyle = ProcessWindowStyle.Hidden;
                        process.Start();
                        while (!process.HasExited)
                        {
                            System.Threading.Thread.Sleep(1000);
                        }
                        #endregion
                    }
                    else
                    {
                        #region registerDLLS

                        FileStream fs = new FileStream(FilePath, FileMode.Append, FileAccess.Write);
                        StreamWriter sw = new StreamWriter(fs);
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\commpro.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\comms.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\plcommpro.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\plcomms.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\plrscagent.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\plrscomm.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\pltcpcomm.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\rscagent.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\rscomm.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\tcpcomm.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\usbcomm.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\zkemkeeper.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"xcopy " + Application.StartupPath + @"\RequireDLL64\zkemsdk.dll c:\windows\syswow64\ /y");
                        sw.WriteLine(@"%windir%\syswow64\regsvr32.exe %windir%\syswow64\zkemkeeper.dll");

                        sw.Close();
                        Process process = new Process();
                        ProcessStartInfo info = new ProcessStartInfo(FilePath);
                        info.UseShellExecute = true;
                        info.Verb = "runas";
                        process.StartInfo = info;
                        process.StartInfo.WindowStyle = ProcessWindowStyle.Hidden;
                        process.Start();
                        while (!process.HasExited)
                        {
                            System.Threading.Thread.Sleep(1000);
                        }

                        #endregion
                    }

                    #endregion

                    #endregion

                    MessageBox.Show("Dll have been registered successfully!", Messages.MsgBoxTitle, MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1);
                }
                catch (Exception)
                {
                    MessageBox.Show("Dll have been not registered successfully! Please try again.", Messages.MsgBoxTitle, MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        #endregion


        #region Private Methods

        private void SetInitialControl()
        {
            lblToday.Text = DateTime.Now.ToString("dddd, MMMM dd, yyyy");
            lblTimeIn.Text = "Time In: " + DateTime.Now.ToLongTimeString();
        }

        public void LogOff()
        {
            _IsExist = false;

            Form[] _ListOfForm = Application.OpenForms.Cast<Form>().Where(q => q.Name != "frmLogin").ToArray();
            foreach (Form _Form in _ListOfForm)
            {
                _Form.Close();
                _Form.Dispose();
            }

            int cnt = Application.OpenForms.Cast<Form>().Where(q => q.Name == "frmLogin").Count();
            if (cnt == 0)
            {
                frmLogin _frmLogin = new frmLogin();
                _frmLogin.epLogin.Clear();
                _frmLogin.BringToFront();
                _frmLogin.ShowDialog();
                _frmLogin.Focus();
            }
            else
            {
                frmLogin _frmLogin = (frmLogin)Application.OpenForms.Cast<Form>().Where(q => q.Name == "frmLogin").FirstOrDefault();
                _frmLogin.epLogin.Clear();
                _frmLogin.Show();
                _frmLogin.Focus();
            }
        }


        #endregion

       

    }
}
