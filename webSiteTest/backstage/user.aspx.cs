using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backstage_user : System.Web.UI.Page
{
    CUserFactory userFactory = new CUserFactory();

    protected void Page_Load(object sender, EventArgs e)
    {
        gvUsers.DataSource = userFactory.getAll();

        BoundField id = new BoundField();
        id.DataField = "id";
        id.HeaderText = "使用者編號";

        BoundField name = new BoundField();
        name.DataField = "name";
        name.HeaderText = "使用者名稱";

        BoundField role_id = new BoundField();
        role_id.DataField = "role_id";
        role_id.HeaderText = "使用者身分編號";

        BoundField account = new BoundField();
        account.DataField = "account";
        account.HeaderText = "使用者帳號";

        BoundField password = new BoundField();
        password.DataField = "password";
        password.HeaderText = "使用者密碼";

        gvUsers.Columns.Add(id);
        gvUsers.Columns.Add(name);
        gvUsers.Columns.Add(role_id);
        gvUsers.Columns.Add(account);
        gvUsers.Columns.Add(password);
        gvUsers.DataBind();
    }
}