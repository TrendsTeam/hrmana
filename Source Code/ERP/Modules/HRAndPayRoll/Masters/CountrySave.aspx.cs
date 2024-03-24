﻿using ERP.Common;
using ERP.Dal.Implemention;
using ERP.Dal.Interface;
using ERP.Helpers;
using ERP.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ERP.Modules.HRAndPayRoll.Masters
{
    public partial class CountrySave : System.Web.UI.Page
    {
        #region Variables

        private readonly log4net.ILog _Logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        #endregion


        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionHelper.SessionDetail == null)
            {
                Response.Redirect("~/Modules/Login.aspx", false);
            }

            this.Form.DefaultButton = "btnSave";

            SessionHelper.SelectMenuSession = "liCountry_liHR_liHRMasters";

            if (!IsPostBack)
            {
                hfId.Value = Convert.ToString(Guid.Empty);

                if (Request.QueryString["id"] != null)
                {
                    Guid _id;

                    bool _Result = Guid.TryParse(Convert.ToString(Request.QueryString["id"]), out _id);

                    if (_Result)
                    {
                        FillControls(_id);
                    }
                }
            }
        }

        #endregion


        #region Events

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                Country _Country = new Country();

                _Country.CountryID = new Guid(hfId.Value);
                _Country.CountryName = txtCountryName.Text.Trim();
                _Country.Code = txtCountryCode.Text.Trim();

                ICountryService _ICountryService = new CountryService();

                Result<Boolean> _Result = _ICountryService.SaveCountry(_Country, SessionHelper.SessionDetail.UserID);

                if (_Result.IsSuccess)
                {
                    SessionHelper.MessageSession = String.Format(CommonHelper.GetLanguageLabel("SaveSuccessMsg"), CommonHelper.GetLanguageLabel("Country"));

                    IHistoryService _IHistoryService = new HistoryService();

                    if (_Country.CountryID == Guid.Empty)
                    {
                        _IHistoryService.InsertHistory<Country>(_Result.Id, TableType.CountryMaster, OperationType.Insert, _Country, SessionHelper.SessionDetail.UserID);
                    }
                    else
                    {
                        _IHistoryService.InsertHistory<Country>(Convert.ToString(_Country.CountryID), TableType.CountryMaster, OperationType.Update, _Country, SessionHelper.SessionDetail.UserID);
                    }

                    Response.Redirect("~/Modules/HRAndPayRoll/Masters/CountryList.aspx", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "AlreadyExistsMsg", " $(document).ready(function() {Common.ShowToastrMessage(Common.Variable.Warning, Common.Variable.Warning, '" + String.Format(CommonHelper.GetLanguageLabel(_Result.Message), CommonHelper.GetLanguageLabel("Country")) + "');});", true);
                }
            }
            catch (Exception _Exception)
            {
                _Logger.Error(CommonHelper.GetLanguageLabel("ExceptionErrMsg"), _Exception);
                ScriptManager.RegisterStartupScript(this, typeof(Page), "ExceptionMsg", " $(document).ready(function() {Common.ShowToastrMessage(Common.Variable.Error, Common.Variable.Error, '" + CommonHelper.GetLanguageLabel("ExceptionErrMsg") + "');});", true);
            }
        }

        #endregion


        #region Methods

        private void FillControls(Guid p_Id)
        {
            try
            {
                ICountryService _ICountryService = new CountryService();

                Result<Country> _Result = _ICountryService.GetCountryById(p_Id);

                if (_Result.IsSuccess)
                {
                    hfId.Value = Convert.ToString(p_Id);
                    txtCountryName.Text = _Result.Data.CountryName;
                    txtCountryCode.Text = _Result.Data.Code;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "GetFailMsg", "$(document).ready(function() {Common.ShowToastrMessage(Common.Variable.Error, Common.Variable.Error, '" + CommonHelper.GetLanguageLabel(_Result.Message) + "');});", true);
                }
            }
            catch (Exception _Exception)
            {
                _Logger.Error(CommonHelper.GetLanguageLabel("ExceptionErrMsg"), _Exception);
                ScriptManager.RegisterStartupScript(this, typeof(Page), "ExceptionMsg", "$(document).ready(function() {Common.ShowToastrMessage(Common.Variable.Error, Common.Variable.Error, '" + CommonHelper.GetLanguageLabel("ExceptionErrMsg") + "');});", true);
            }
        }

        #endregion
    }
}