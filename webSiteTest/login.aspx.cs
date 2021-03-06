﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    CUserFactory factory = new CUserFactory();
    string loginPassword = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["loginName"] = null;
        if (!IsPostBack) { lblMessage.Visible = false; }
        
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {        
        loginPassword = Request.Form["Passwd"].ToString();
        
        if (factory.loginCheck(Request.Form["loginName"].ToString(), loginPassword))
        {
            Session["loginName"] = Request.Form["loginName"].ToString();
            Response.Redirect("patientSelect.aspx");
        }
        else
        {
            lblMessage.Visible = true;
        }
    }
    protected void btnEnter_Click(object sender, EventArgs e)
    {        
        loginPassword = Request.Form["Passwd"].ToString();

        if (factory.loginCheck(Request.Form["loginName"].ToString(), loginPassword))
        {            
            Session["loginName"] = Request.Form["loginName"].ToString();
            Response.Redirect("backstage/index.aspx");
        }
        else
        {
            lblMessage.Visible = true;
        }
    }
}