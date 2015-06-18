using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backstage_MasterPage : System.Web.UI.MasterPage
{
    CUserFactory userFactory = new CUserFactory();
    CRoleFactory roleFactory = new CRoleFactory();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] != null)
        {
            lblLoginName.Text = Session["loginName"].ToString();
            if (roleFactory.getById(userFactory.getByAccount(Session["loginName"].ToString()).role_id).name != "系統管理員")
            {                
                Response.Redirect("../login.aspx");
            }
        }
        else
            Response.Redirect("../login.aspx");
    }
}
