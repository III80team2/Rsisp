using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    CScheduleFactory factory = new CScheduleFactory();
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = "";
        if (Request.QueryString["pid"] != null)
        {
            id = Request.QueryString["pid"].ToString();
        }
        
        GridView1.DataSource = factory.getByPatientId(id);
        GridView1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //CAssessFactory factory = new CAssessFactory();
        //string name = (sender as Button).Text;
        //id = factory.getId(name);
        //Response.Redirect("testAssess.aspx?pid="+id);
    }
}