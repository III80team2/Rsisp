using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class running : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("<script type=\"text/javascript\" var t = 20; > function showTime() { t -= 1;"+
        "document.getElementById('div1').innerHTML = t;if (t == 1) { location.href = 'testAssess.aspx';}setTimeout(\"showTime()\", 1000);}"+
    "showTime();</script>");
    }
}