using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userJson : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CUserFactory userFactory = new CUserFactory();
        List<CUser> allUser = userFactory.getAll();

        string jsonData = JsonConvert.SerializeObject(allUser);

        Response.Clear();
        Response.ContentType = "application/json; charset=utf-8";
        Response.Write(jsonData);
        Response.End();
    }
}