using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    CUserFactory userFactory = new CUserFactory();
    CRoleFactory roleFactory = new CRoleFactory();
    CPatientFactory patientFactory = new CPatientFactory();

    protected void Page_Load(object sender, EventArgs e)
    {
        foreach (CRole role in roleFactory.getAll())
        {
            roleList.Items.Add(role.name);
            
        }
    }
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        CUser user = new CUser();
        try {
            if (Request.Form["password"].ToString().Equals(Request.Form["passwordComit"].ToString()))
            {
                user.account = Request.Form["userName"].ToString();
                user.password = Request.Form["password"].ToString();
                user.name = Request.Form["lastName"].ToString() + Request.Form["firstName"].ToString();
                user.role_id = roleFactory.getByName(roleList.SelectedItem.Text).id;
                userFactory.addUser(user);
                Response.Write("<script>alert('" + userFactory.message + "')</script>");
            }
            else { Response.Write("<script>alert('輸入不一致的密碼')</script>"); }
        }
        catch (Exception) { Response.Write("<script>alert('有欄位值為null')</script>"); }
        
    }
}