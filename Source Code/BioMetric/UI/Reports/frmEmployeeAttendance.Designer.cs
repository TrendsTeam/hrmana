namespace BioMetric.UI.Reports
{
    partial class frmEmployeeAttendance
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmEmployeeAttendance));
            this.btnReport = new System.Windows.Forms.Button();
            this.cbMonth = new System.Windows.Forms.ComboBox();
            this.cbYear = new System.Windows.Forms.ComboBox();
            this.rbtnDaily = new System.Windows.Forms.RadioButton();
            this.rbtnWeekly = new System.Windows.Forms.RadioButton();
            this.dtpTo = new System.Windows.Forms.DateTimePicker();
            this.rbtnMonthly = new System.Windows.Forms.RadioButton();
            this.lblTo = new System.Windows.Forms.Label();
            this.dtpFrom = new System.Windows.Forms.DateTimePicker();
            this.txtEmployeeName = new System.Windows.Forms.TextBox();
            this.cbBranchName = new System.Windows.Forms.ComboBox();
            this.lblBranchName = new System.Windows.Forms.Label();
            this.lblEmployee = new System.Windows.Forms.Label();
            this.pnlEmployee = new System.Windows.Forms.Panel();
            this.lblTitle = new System.Windows.Forms.Label();
            this.pnlDate = new System.Windows.Forms.Panel();
            this.btnExist = new System.Windows.Forms.Button();
            this.pnlTitle = new System.Windows.Forms.Panel();
            this.rvReport = new Microsoft.Reporting.WinForms.ReportViewer();
            this.pnlEmployee.SuspendLayout();
            this.pnlDate.SuspendLayout();
            this.pnlTitle.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnReport
            // 
            this.btnReport.BackgroundImage = global::BioMetric.Properties.Resources.BtnBack;
            this.btnReport.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnReport.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnReport.ForeColor = System.Drawing.Color.White;
            this.btnReport.Location = new System.Drawing.Point(274, 14);
            this.btnReport.Name = "btnReport";
            this.btnReport.Size = new System.Drawing.Size(83, 28);
            this.btnReport.TabIndex = 7;
            this.btnReport.Text = "&Report";
            this.btnReport.UseVisualStyleBackColor = true;
            this.btnReport.Click += new System.EventHandler(this.btnReport_Click);
            // 
            // cbMonth
            // 
            this.cbMonth.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbMonth.FormattingEnabled = true;
            this.cbMonth.Location = new System.Drawing.Point(21, 55);
            this.cbMonth.Name = "cbMonth";
            this.cbMonth.Size = new System.Drawing.Size(110, 21);
            this.cbMonth.TabIndex = 5;
            this.cbMonth.Visible = false;
            // 
            // cbYear
            // 
            this.cbYear.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbYear.FormattingEnabled = true;
            this.cbYear.Location = new System.Drawing.Point(143, 55);
            this.cbYear.Name = "cbYear";
            this.cbYear.Size = new System.Drawing.Size(63, 21);
            this.cbYear.TabIndex = 6;
            this.cbYear.Visible = false;
            // 
            // rbtnDaily
            // 
            this.rbtnDaily.AutoSize = true;
            this.rbtnDaily.Location = new System.Drawing.Point(22, 5);
            this.rbtnDaily.Name = "rbtnDaily";
            this.rbtnDaily.Size = new System.Drawing.Size(48, 17);
            this.rbtnDaily.TabIndex = 0;
            this.rbtnDaily.Text = "Daily";
            this.rbtnDaily.UseVisualStyleBackColor = true;
            this.rbtnDaily.CheckedChanged += new System.EventHandler(this.rbtn_CheckedChanged);
            // 
            // rbtnWeekly
            // 
            this.rbtnWeekly.AutoSize = true;
            this.rbtnWeekly.Location = new System.Drawing.Point(84, 5);
            this.rbtnWeekly.Name = "rbtnWeekly";
            this.rbtnWeekly.Size = new System.Drawing.Size(61, 17);
            this.rbtnWeekly.TabIndex = 1;
            this.rbtnWeekly.Text = "Weekly";
            this.rbtnWeekly.UseVisualStyleBackColor = true;
            this.rbtnWeekly.CheckedChanged += new System.EventHandler(this.rbtn_CheckedChanged);
            // 
            // dtpTo
            // 
            this.dtpTo.CustomFormat = "dd/MM/yyyy";
            this.dtpTo.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpTo.Location = new System.Drawing.Point(154, 29);
            this.dtpTo.Name = "dtpTo";
            this.dtpTo.Size = new System.Drawing.Size(102, 20);
            this.dtpTo.TabIndex = 4;
            this.dtpTo.Visible = false;
            // 
            // rbtnMonthly
            // 
            this.rbtnMonthly.AutoSize = true;
            this.rbtnMonthly.Location = new System.Drawing.Point(155, 5);
            this.rbtnMonthly.Name = "rbtnMonthly";
            this.rbtnMonthly.Size = new System.Drawing.Size(62, 17);
            this.rbtnMonthly.TabIndex = 2;
            this.rbtnMonthly.Text = "Monthly";
            this.rbtnMonthly.UseVisualStyleBackColor = true;
            this.rbtnMonthly.CheckedChanged += new System.EventHandler(this.rbtn_CheckedChanged);
            // 
            // lblTo
            // 
            this.lblTo.AutoSize = true;
            this.lblTo.Location = new System.Drawing.Point(131, 34);
            this.lblTo.Name = "lblTo";
            this.lblTo.Size = new System.Drawing.Size(16, 13);
            this.lblTo.TabIndex = 4;
            this.lblTo.Text = "to";
            this.lblTo.Visible = false;
            // 
            // dtpFrom
            // 
            this.dtpFrom.CustomFormat = "dd/MM/yyyy";
            this.dtpFrom.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpFrom.Location = new System.Drawing.Point(22, 29);
            this.dtpFrom.Name = "dtpFrom";
            this.dtpFrom.Size = new System.Drawing.Size(102, 20);
            this.dtpFrom.TabIndex = 3;
            this.dtpFrom.ValueChanged += new System.EventHandler(this.dtpFrom_ValueChanged);
            // 
            // txtEmployeeName
            // 
            this.txtEmployeeName.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.txtEmployeeName.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtEmployeeName.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtEmployeeName.Location = new System.Drawing.Point(72, 6);
            this.txtEmployeeName.Margin = new System.Windows.Forms.Padding(0);
            this.txtEmployeeName.MaxLength = 50;
            this.txtEmployeeName.Name = "txtEmployeeName";
            this.txtEmployeeName.Size = new System.Drawing.Size(383, 22);
            this.txtEmployeeName.TabIndex = 0;
            // 
            // cbBranchName
            // 
            this.cbBranchName.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbBranchName.FormattingEnabled = true;
            this.cbBranchName.Items.AddRange(new object[] {
            "---- Select ----"});
            this.cbBranchName.Location = new System.Drawing.Point(87, 35);
            this.cbBranchName.Name = "cbBranchName";
            this.cbBranchName.Size = new System.Drawing.Size(184, 21);
            this.cbBranchName.TabIndex = 1;
            // 
            // lblBranchName
            // 
            this.lblBranchName.AutoSize = true;
            this.lblBranchName.ForeColor = System.Drawing.Color.Black;
            this.lblBranchName.Location = new System.Drawing.Point(6, 39);
            this.lblBranchName.Name = "lblBranchName";
            this.lblBranchName.Size = new System.Drawing.Size(81, 13);
            this.lblBranchName.TabIndex = 194;
            this.lblBranchName.Text = "Device Name : ";
            // 
            // lblEmployee
            // 
            this.lblEmployee.AutoSize = true;
            this.lblEmployee.ForeColor = System.Drawing.SystemColors.ControlText;
            this.lblEmployee.Location = new System.Drawing.Point(5, 8);
            this.lblEmployee.Name = "lblEmployee";
            this.lblEmployee.Size = new System.Drawing.Size(59, 13);
            this.lblEmployee.TabIndex = 29;
            this.lblEmployee.Text = "Employee :";
            // 
            // pnlEmployee
            // 
            this.pnlEmployee.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnlEmployee.Controls.Add(this.txtEmployeeName);
            this.pnlEmployee.Controls.Add(this.cbBranchName);
            this.pnlEmployee.Controls.Add(this.lblBranchName);
            this.pnlEmployee.Controls.Add(this.lblEmployee);
            this.pnlEmployee.Location = new System.Drawing.Point(2, 36);
            this.pnlEmployee.Name = "pnlEmployee";
            this.pnlEmployee.Size = new System.Drawing.Size(471, 90);
            this.pnlEmployee.TabIndex = 0;
            // 
            // lblTitle
            // 
            this.lblTitle.AutoSize = true;
            this.lblTitle.BackColor = System.Drawing.Color.Transparent;
            this.lblTitle.Font = new System.Drawing.Font("Calibri", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTitle.ForeColor = System.Drawing.Color.Black;
            this.lblTitle.Location = new System.Drawing.Point(9, 10);
            this.lblTitle.Name = "lblTitle";
            this.lblTitle.Size = new System.Drawing.Size(180, 18);
            this.lblTitle.TabIndex = 1;
            this.lblTitle.Text = "View Employee Attendance";
            // 
            // pnlDate
            // 
            this.pnlDate.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnlDate.Controls.Add(this.btnExist);
            this.pnlDate.Controls.Add(this.btnReport);
            this.pnlDate.Controls.Add(this.cbMonth);
            this.pnlDate.Controls.Add(this.cbYear);
            this.pnlDate.Controls.Add(this.rbtnDaily);
            this.pnlDate.Controls.Add(this.rbtnWeekly);
            this.pnlDate.Controls.Add(this.dtpTo);
            this.pnlDate.Controls.Add(this.rbtnMonthly);
            this.pnlDate.Controls.Add(this.lblTo);
            this.pnlDate.Controls.Add(this.dtpFrom);
            this.pnlDate.Location = new System.Drawing.Point(471, 36);
            this.pnlDate.Margin = new System.Windows.Forms.Padding(0);
            this.pnlDate.Name = "pnlDate";
            this.pnlDate.Padding = new System.Windows.Forms.Padding(0, 28, 5, 0);
            this.pnlDate.Size = new System.Drawing.Size(395, 90);
            this.pnlDate.TabIndex = 1;
            // 
            // btnExist
            // 
            this.btnExist.BackgroundImage = global::BioMetric.Properties.Resources.BtnBack;
            this.btnExist.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnExist.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnExist.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnExist.ForeColor = System.Drawing.Color.White;
            this.btnExist.Location = new System.Drawing.Point(275, 49);
            this.btnExist.Name = "btnExist";
            this.btnExist.Size = new System.Drawing.Size(83, 28);
            this.btnExist.TabIndex = 8;
            this.btnExist.Text = "&Exit";
            this.btnExist.UseVisualStyleBackColor = true;
            this.btnExist.Click += new System.EventHandler(this.btnExist_Click);
            // 
            // pnlTitle
            // 
            this.pnlTitle.BackColor = System.Drawing.Color.LightBlue;
            this.pnlTitle.Controls.Add(this.lblTitle);
            this.pnlTitle.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlTitle.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.pnlTitle.Location = new System.Drawing.Point(0, 0);
            this.pnlTitle.Margin = new System.Windows.Forms.Padding(0);
            this.pnlTitle.Name = "pnlTitle";
            this.pnlTitle.Size = new System.Drawing.Size(869, 36);
            this.pnlTitle.TabIndex = 59;
            // 
            // rvReport
            // 
            this.rvReport.Location = new System.Drawing.Point(2, 132);
            this.rvReport.Name = "rvReport";
            this.rvReport.Size = new System.Drawing.Size(864, 495);
            this.rvReport.TabIndex = 61;
            // 
            // frmEmployeeAttendance
            // 
            this.AcceptButton = this.btnReport;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.btnExist;
            this.ClientSize = new System.Drawing.Size(869, 630);
            this.Controls.Add(this.rvReport);
            this.Controls.Add(this.pnlEmployee);
            this.Controls.Add(this.pnlDate);
            this.Controls.Add(this.pnlTitle);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmEmployeeAttendance";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "View Employee Attendance";
            this.Load += new System.EventHandler(this.frmEmployeeAttendance_Load);
            this.pnlEmployee.ResumeLayout(false);
            this.pnlEmployee.PerformLayout();
            this.pnlDate.ResumeLayout(false);
            this.pnlDate.PerformLayout();
            this.pnlTitle.ResumeLayout(false);
            this.pnlTitle.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Button btnReport;
        private System.Windows.Forms.ComboBox cbMonth;
        private System.Windows.Forms.ComboBox cbYear;
        private System.Windows.Forms.RadioButton rbtnDaily;
        private System.Windows.Forms.RadioButton rbtnWeekly;
        private System.Windows.Forms.DateTimePicker dtpTo;
        private System.Windows.Forms.RadioButton rbtnMonthly;
        private System.Windows.Forms.Label lblTo;
        private System.Windows.Forms.DateTimePicker dtpFrom;
        private System.Windows.Forms.TextBox txtEmployeeName;
        public System.Windows.Forms.ComboBox cbBranchName;
        private System.Windows.Forms.Label lblBranchName;
        private System.Windows.Forms.Label lblEmployee;
        private System.Windows.Forms.Panel pnlEmployee;
        private System.Windows.Forms.Label lblTitle;
        private System.Windows.Forms.Panel pnlDate;
        private System.Windows.Forms.Panel pnlTitle;
        private Microsoft.Reporting.WinForms.ReportViewer rvReport;
        private System.Windows.Forms.Button btnExist;
    }
}