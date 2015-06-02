using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    int id = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void ibtnSearch_Click(object sender, ImageClickEventArgs e)
    {
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        CAssessFactory factory = new CAssessFactory();
        string name = (sender as Button).Text;
        id = factory.getId(name);
        Response.Redirect("testAssess.aspx?pid="+id);
    }
}