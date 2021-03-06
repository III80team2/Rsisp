﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backstage_patient : System.Web.UI.Page
{
    CPatientFactory patientFactory = new CPatientFactory();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gvPatients.DataSource = patientFactory.getAll().OrderByDescending(patient => patient.id).ToList();

            BoundField id = new BoundField();
            id.DataField = "id";
            id.HeaderText = "住民編號";

            BoundField name = new BoundField();
            name.DataField = "name";
            name.HeaderText = "住民姓名";

            BoundField idcard = new BoundField();
            idcard.DataField = "idcard";
            idcard.HeaderText = "身分證字號";

            BoundField birthday = new BoundField();
            birthday.DataField = "birthday";
            birthday.HeaderText = "出生日期";
            birthday.DataFormatString = "{0:yyyy/MM/dd}";

            BoundField photoPath = new BoundField();
            photoPath.DataField = "photoPath";
            photoPath.HeaderText = "個人照片路徑";

            gvPatients.Columns.Add(id);
            gvPatients.Columns.Add(name);
            gvPatients.Columns.Add(idcard);
            gvPatients.Columns.Add(birthday);
            gvPatients.Columns.Add(photoPath);
            gvPatients.DataBind();
        }
    }

    protected void gvPatients_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvPatients.PageIndex = e.NewPageIndex;
        gvPatients.DataSource = patientFactory.getAll().OrderByDescending(patient => patient.id).ToList();
        gvPatients.DataBind();
    }
}