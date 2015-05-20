using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dataBaseTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CUserFactory factory = new CUserFactory();
        List<CUser> userList = new List<CUser>();
        userList = factory.getAll();
        GridView1.DataSource = userList;
        GridView1.DataBind();
    }
}