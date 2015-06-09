using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        for (int i = 0; i <= 28;i++ )
        {
            CheckBox rdbtn = new CheckBox();
            rdbtn.ID = "rdbtn"+i;

            PlaceHolder1.Controls.Add(new LiteralControl("<span style='padding-right:20px;font-size:large'>"));
            PlaceHolder1.Controls.Add(rdbtn);
            PlaceHolder1.Controls.Add(new LiteralControl("</span>"));
        }
        //Page.RegisterStartupScript("Show", "<script language=JavaScript>radio('" + "rdbtn" + "');</script>");
    }
}