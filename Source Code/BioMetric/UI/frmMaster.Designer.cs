namespace BioMetric.UI
{
    partial class frmMaster
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmMaster));
            this.tMaster = new System.Windows.Forms.Timer(this.components);
            this.msMain = new System.Windows.Forms.MenuStrip();
            this.tsmDevice = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmEmployee = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmMaintenance = new System.Windows.Forms.ToolStripMenuItem();
            this.sendDataToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmSynchronizeFingerprint = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmCollectFingerprint = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmCollectAttendancefromTerminal = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmRegisterDLL32 = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmRegisterDLL64 = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmReports = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmEmployeeAttendance = new System.Windows.Forms.ToolStripMenuItem();
            this.pnlHeader = new System.Windows.Forms.Panel();
            this.tlpRight = new System.Windows.Forms.TableLayoutPanel();
            this.tableLayoutPanel4 = new System.Windows.Forms.TableLayoutPanel();
            this.btnLogOff = new System.Windows.Forms.Button();
            this.panel4 = new System.Windows.Forms.Panel();
            this.tlpDateTime = new System.Windows.Forms.TableLayoutPanel();
            this.lblToday = new System.Windows.Forms.Label();
            this.lblTimeNow = new System.Windows.Forms.Label();
            this.lblTimeIn = new System.Windows.Forms.Label();
            this.pnlLogo = new System.Windows.Forms.Panel();
            this.tsmMapEmployee = new System.Windows.Forms.ToolStripMenuItem();
            this.msMain.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            this.tlpRight.SuspendLayout();
            this.tableLayoutPanel4.SuspendLayout();
            this.panel4.SuspendLayout();
            this.tlpDateTime.SuspendLayout();
            this.SuspendLayout();
            // 
            // tMaster
            // 
            this.tMaster.Enabled = true;
            this.tMaster.Tick += new System.EventHandler(this.tMaster_Tick);
            // 
            // msMain
            // 
            this.msMain.AutoSize = false;
            this.msMain.BackColor = System.Drawing.Color.LightBlue;
            this.msMain.Font = new System.Drawing.Font("Calibri", 11.25F);
            this.msMain.GripStyle = System.Windows.Forms.ToolStripGripStyle.Visible;
            this.msMain.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.msMain.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsmDevice,
            this.tsmEmployee,
            this.tsmMaintenance,
            this.tsmReports});
            this.msMain.LayoutStyle = System.Windows.Forms.ToolStripLayoutStyle.HorizontalStackWithOverflow;
            this.msMain.Location = new System.Drawing.Point(0, 112);
            this.msMain.MinimumSize = new System.Drawing.Size(667, 0);
            this.msMain.Name = "msMain";
            this.msMain.Padding = new System.Windows.Forms.Padding(4, 2, 0, 2);
            this.msMain.Size = new System.Drawing.Size(1315, 43);
            this.msMain.TabIndex = 18;
            this.msMain.Text = "msMain";
            // 
            // tsmDevice
            // 
            this.tsmDevice.Name = "tsmDevice";
            this.tsmDevice.Size = new System.Drawing.Size(73, 39);
            this.tsmDevice.Text = "&Device";
            this.tsmDevice.Click += new System.EventHandler(this.tsmDevice_Click);
            // 
            // tsmEmployee
            // 
            this.tsmEmployee.Name = "tsmEmployee";
            this.tsmEmployee.Size = new System.Drawing.Size(97, 39);
            this.tsmEmployee.Text = "&Employee";
            this.tsmEmployee.Click += new System.EventHandler(this.tsmEmployee_Click);
            // 
            // tsmMaintenance
            // 
            this.tsmMaintenance.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.sendDataToolStripMenuItem,
            this.tsmSynchronizeFingerprint,
            this.tsmCollectFingerprint,
            this.tsmCollectAttendancefromTerminal,
            this.tsmMapEmployee,
            this.tsmRegisterDLL32,
            this.tsmRegisterDLL64});
            this.tsmMaintenance.Name = "tsmMaintenance";
            this.tsmMaintenance.Size = new System.Drawing.Size(122, 39);
            this.tsmMaintenance.Text = "&Maintenance";
            // 
            // sendDataToolStripMenuItem
            // 
            this.sendDataToolStripMenuItem.Image = global::BioMetric.Properties.Resources.upload;
            this.sendDataToolStripMenuItem.Name = "sendDataToolStripMenuItem";
            this.sendDataToolStripMenuItem.Size = new System.Drawing.Size(346, 28);
            this.sendDataToolStripMenuItem.Text = "&Send Employee to Device(s)";
            this.sendDataToolStripMenuItem.Click += new System.EventHandler(this.tsmSendEmployee_Click);
            // 
            // tsmSynchronizeFingerprint
            // 
            this.tsmSynchronizeFingerprint.Image = global::BioMetric.Properties.Resources.refresh;
            this.tsmSynchronizeFingerprint.Name = "tsmSynchronizeFingerprint";
            this.tsmSynchronizeFingerprint.Size = new System.Drawing.Size(346, 28);
            this.tsmSynchronizeFingerprint.Text = "S&ynchronize Fingerprint";
            this.tsmSynchronizeFingerprint.Click += new System.EventHandler(this.tsmSynchronizeFingerprint_Click);
            // 
            // tsmCollectFingerprint
            // 
            this.tsmCollectFingerprint.Image = global::BioMetric.Properties.Resources.download;
            this.tsmCollectFingerprint.Name = "tsmCollectFingerprint";
            this.tsmCollectFingerprint.Size = new System.Drawing.Size(346, 28);
            this.tsmCollectFingerprint.Text = "Collect &Fingerprint";
            this.tsmCollectFingerprint.Click += new System.EventHandler(this.tsmCollectFingerprint_Click);
            // 
            // tsmCollectAttendancefromTerminal
            // 
            this.tsmCollectAttendancefromTerminal.Image = global::BioMetric.Properties.Resources.download;
            this.tsmCollectAttendancefromTerminal.Name = "tsmCollectAttendancefromTerminal";
            this.tsmCollectAttendancefromTerminal.Size = new System.Drawing.Size(346, 28);
            this.tsmCollectAttendancefromTerminal.Text = "&Collect Attendance from Device(s)";
            this.tsmCollectAttendancefromTerminal.Click += new System.EventHandler(this.tsmCollectAttendancefromTerminal_Click);
            // 
            // tsmRegisterDLL32
            // 
            this.tsmRegisterDLL32.Image = global::BioMetric.Properties.Resources.SettingsIcon;
            this.tsmRegisterDLL32.Name = "tsmRegisterDLL32";
            this.tsmRegisterDLL32.Size = new System.Drawing.Size(346, 28);
            this.tsmRegisterDLL32.Text = "Register DLL 32";
            this.tsmRegisterDLL32.Click += new System.EventHandler(this.tsmRegisterDLL32_Click);
            // 
            // tsmRegisterDLL64
            // 
            this.tsmRegisterDLL64.Image = global::BioMetric.Properties.Resources.SettingsIcon;
            this.tsmRegisterDLL64.Name = "tsmRegisterDLL64";
            this.tsmRegisterDLL64.Size = new System.Drawing.Size(346, 28);
            this.tsmRegisterDLL64.Text = "Register DLL 64";
            this.tsmRegisterDLL64.Click += new System.EventHandler(this.tsmRegisterDLL64_Click);
            // 
            // tsmReports
            // 
            this.tsmReports.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsmEmployeeAttendance});
            this.tsmReports.Name = "tsmReports";
            this.tsmReports.Size = new System.Drawing.Size(82, 39);
            this.tsmReports.Text = "&Reports";
            // 
            // tsmEmployeeAttendance
            // 
            this.tsmEmployeeAttendance.Image = global::BioMetric.Properties.Resources.view_detail;
            this.tsmEmployeeAttendance.Name = "tsmEmployeeAttendance";
            this.tsmEmployeeAttendance.Size = new System.Drawing.Size(253, 28);
            this.tsmEmployeeAttendance.Text = "Employee Attendance";
            this.tsmEmployeeAttendance.Click += new System.EventHandler(this.tsmEmployeeAttendance_Click);
            // 
            // pnlHeader
            // 
            this.pnlHeader.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("pnlHeader.BackgroundImage")));
            this.pnlHeader.Controls.Add(this.tlpRight);
            this.pnlHeader.Controls.Add(this.pnlLogo);
            this.pnlHeader.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlHeader.Location = new System.Drawing.Point(0, 0);
            this.pnlHeader.Margin = new System.Windows.Forms.Padding(0);
            this.pnlHeader.Name = "pnlHeader";
            this.pnlHeader.Size = new System.Drawing.Size(1315, 112);
            this.pnlHeader.TabIndex = 17;
            // 
            // tlpRight
            // 
            this.tlpRight.BackColor = System.Drawing.Color.Transparent;
            this.tlpRight.ColumnCount = 1;
            this.tlpRight.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpRight.Controls.Add(this.tableLayoutPanel4, 0, 0);
            this.tlpRight.Controls.Add(this.panel4, 0, 1);
            this.tlpRight.Dock = System.Windows.Forms.DockStyle.Right;
            this.tlpRight.Location = new System.Drawing.Point(714, 0);
            this.tlpRight.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.tlpRight.Name = "tlpRight";
            this.tlpRight.RowCount = 2;
            this.tlpRight.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 60F));
            this.tlpRight.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 40F));
            this.tlpRight.Size = new System.Drawing.Size(601, 112);
            this.tlpRight.TabIndex = 1;
            // 
            // tableLayoutPanel4
            // 
            this.tableLayoutPanel4.ColumnCount = 4;
            this.tableLayoutPanel4.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel4.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 10F));
            this.tableLayoutPanel4.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel4.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel4.Controls.Add(this.btnLogOff, 3, 0);
            this.tableLayoutPanel4.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel4.Location = new System.Drawing.Point(4, 4);
            this.tableLayoutPanel4.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.tableLayoutPanel4.Name = "tableLayoutPanel4";
            this.tableLayoutPanel4.RowCount = 1;
            this.tableLayoutPanel4.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tableLayoutPanel4.Size = new System.Drawing.Size(593, 59);
            this.tableLayoutPanel4.TabIndex = 8;
            // 
            // btnLogOff
            // 
            this.btnLogOff.BackgroundImage = global::BioMetric.Properties.Resources.BtnBack;
            this.btnLogOff.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnLogOff.FlatAppearance.BorderSize = 0;
            this.btnLogOff.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnLogOff.ForeColor = System.Drawing.Color.White;
            this.btnLogOff.Location = new System.Drawing.Point(473, 0);
            this.btnLogOff.Margin = new System.Windows.Forms.Padding(0);
            this.btnLogOff.Name = "btnLogOff";
            this.btnLogOff.Size = new System.Drawing.Size(95, 37);
            this.btnLogOff.TabIndex = 2;
            this.btnLogOff.Text = "&Log Off";
            this.btnLogOff.UseVisualStyleBackColor = true;
            this.btnLogOff.Click += new System.EventHandler(this.btnLogOff_Click);
            // 
            // panel4
            // 
            this.panel4.BackColor = System.Drawing.Color.Transparent;
            this.panel4.Controls.Add(this.tlpDateTime);
            this.panel4.Dock = System.Windows.Forms.DockStyle.Right;
            this.panel4.Location = new System.Drawing.Point(4, 71);
            this.panel4.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(593, 37);
            this.panel4.TabIndex = 2;
            // 
            // tlpDateTime
            // 
            this.tlpDateTime.ColumnCount = 3;
            this.tlpDateTime.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 44F));
            this.tlpDateTime.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 28F));
            this.tlpDateTime.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 28F));
            this.tlpDateTime.Controls.Add(this.lblToday, 0, 0);
            this.tlpDateTime.Controls.Add(this.lblTimeNow, 2, 0);
            this.tlpDateTime.Controls.Add(this.lblTimeIn, 1, 0);
            this.tlpDateTime.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.tlpDateTime.Location = new System.Drawing.Point(0, 12);
            this.tlpDateTime.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.tlpDateTime.Name = "tlpDateTime";
            this.tlpDateTime.RowCount = 1;
            this.tlpDateTime.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpDateTime.Size = new System.Drawing.Size(593, 25);
            this.tlpDateTime.TabIndex = 3;
            // 
            // lblToday
            // 
            this.lblToday.AutoSize = true;
            this.lblToday.Dock = System.Windows.Forms.DockStyle.Right;
            this.lblToday.ForeColor = System.Drawing.Color.White;
            this.lblToday.Location = new System.Drawing.Point(208, 0);
            this.lblToday.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblToday.Name = "lblToday";
            this.lblToday.Size = new System.Drawing.Size(48, 25);
            this.lblToday.TabIndex = 0;
            this.lblToday.Text = "Today";
            // 
            // lblTimeNow
            // 
            this.lblTimeNow.AutoSize = true;
            this.lblTimeNow.Dock = System.Windows.Forms.DockStyle.Right;
            this.lblTimeNow.ForeColor = System.Drawing.Color.White;
            this.lblTimeNow.Location = new System.Drawing.Point(507, 0);
            this.lblTimeNow.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblTimeNow.Name = "lblTimeNow";
            this.lblTimeNow.Size = new System.Drawing.Size(82, 25);
            this.lblTimeNow.TabIndex = 2;
            this.lblTimeNow.Text = "Time Now : ";
            // 
            // lblTimeIn
            // 
            this.lblTimeIn.AutoSize = true;
            this.lblTimeIn.Dock = System.Windows.Forms.DockStyle.Right;
            this.lblTimeIn.ForeColor = System.Drawing.Color.White;
            this.lblTimeIn.Location = new System.Drawing.Point(356, 0);
            this.lblTimeIn.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblTimeIn.Name = "lblTimeIn";
            this.lblTimeIn.Size = new System.Drawing.Size(66, 25);
            this.lblTimeIn.TabIndex = 1;
            this.lblTimeIn.Text = "Time In : ";
            // 
            // pnlLogo
            // 
            this.pnlLogo.BackgroundImage = global::BioMetric.Properties.Resources.Logo;
            this.pnlLogo.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pnlLogo.Location = new System.Drawing.Point(4, 4);
            this.pnlLogo.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.pnlLogo.Name = "pnlLogo";
            this.pnlLogo.Size = new System.Drawing.Size(196, 105);
            this.pnlLogo.TabIndex = 0;
            // 
            // tsmMapEmployee
            // 
            this.tsmMapEmployee.Image = global::BioMetric.Properties.Resources.refresh;
            this.tsmMapEmployee.Name = "tsmMapEmployee";
            this.tsmMapEmployee.Size = new System.Drawing.Size(346, 28);
            this.tsmMapEmployee.Text = "Map Employee";
            this.tsmMapEmployee.Click += new System.EventHandler(this.tsmMapEmployee_Click);
            // 
            // frmMaster
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1315, 672);
            this.Controls.Add(this.msMain);
            this.Controls.Add(this.pnlHeader);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.Name = "frmMaster";
            this.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Show;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "HRM Bio Metric";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmMaster_FormClosing);
            this.Load += new System.EventHandler(this.frmMaster_Load);
            this.msMain.ResumeLayout(false);
            this.msMain.PerformLayout();
            this.pnlHeader.ResumeLayout(false);
            this.tlpRight.ResumeLayout(false);
            this.tableLayoutPanel4.ResumeLayout(false);
            this.panel4.ResumeLayout(false);
            this.tlpDateTime.ResumeLayout(false);
            this.tlpDateTime.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel pnlLogo;
        private System.Windows.Forms.Label lblToday;
        private System.Windows.Forms.Label lblTimeNow;
        private System.Windows.Forms.TableLayoutPanel tlpDateTime;
        private System.Windows.Forms.Label lblTimeIn;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.Button btnLogOff;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel4;
        private System.Windows.Forms.TableLayoutPanel tlpRight;
        private System.Windows.Forms.Panel pnlHeader;
        private System.Windows.Forms.Timer tMaster;
        private System.Windows.Forms.MenuStrip msMain;
        private System.Windows.Forms.ToolStripMenuItem tsmDevice;
        private System.Windows.Forms.ToolStripMenuItem tsmEmployee;
        private System.Windows.Forms.ToolStripMenuItem tsmMaintenance;
        private System.Windows.Forms.ToolStripMenuItem sendDataToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem tsmSynchronizeFingerprint;
        private System.Windows.Forms.ToolStripMenuItem tsmCollectFingerprint;
        private System.Windows.Forms.ToolStripMenuItem tsmCollectAttendancefromTerminal;
        private System.Windows.Forms.ToolStripMenuItem tsmReports;
        private System.Windows.Forms.ToolStripMenuItem tsmEmployeeAttendance;
        private System.Windows.Forms.ToolStripMenuItem tsmRegisterDLL32;
        private System.Windows.Forms.ToolStripMenuItem tsmRegisterDLL64;
        private System.Windows.Forms.ToolStripMenuItem tsmMapEmployee;
    }
}