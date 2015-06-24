﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class test2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CUserFactory userFactory = new CUserFactory();
        List<CUser> allUser = userFactory.getAll();

        string jsonData = JsonConvert.SerializeObject(allUser);

        Label1.Text = jsonData;
    }
}