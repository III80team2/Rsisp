using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class testAssess : System.Web.UI.Page
{
    CAssessFactory assessFactory = new CAssessFactory();

    protected void Page_Load(object sender, EventArgs e)
    {
        int id = 0;
        if (Request.QueryString["pid"] != null) {
            id = Convert.ToInt32(Request.QueryString["pid"]);
        }
        CAssess assess = assessFactory.getById(id);
        lblAssessName.Text = assess.name;

        CAssess.CItem.CGroup group = new CAssess.CItem.CGroup();
        group.id = 0;

        foreach (CAssess.CItem item in assess.items)
        {
            if (!item.group.id.Equals(group.id))
            {
                group.id = item.group.id;

                Label lblGroupName = new Label();
                lblGroupName.Text = item.group.name;
                lblGroupName.CssClass = "label label-info";

                PlaceHolder1.Controls.Add(new LiteralControl("<div><h3>"));
                PlaceHolder1.Controls.Add(lblGroupName);
                PlaceHolder1.Controls.Add(new LiteralControl("</h3></div>"));
            }

            Label lblItemName = new Label();
            lblItemName.Text = item.name;

            PlaceHolder1.Controls.Add(new LiteralControl("<div class='form-group'><h4>"));
            PlaceHolder1.Controls.Add(lblItemName);
            PlaceHolder1.Controls.Add(new LiteralControl("</h4>"));

            foreach (CAssess.CItem.CContent content in item.contents)
            {
                RadioButton rdbtn = new RadioButton();
                rdbtn.GroupName = item.id.ToString();
                Label lblContent = new Label();
                lblContent.Text = content.content;

                PlaceHolder1.Controls.Add(new LiteralControl("<div class='radio'>"));
                PlaceHolder1.Controls.Add(rdbtn);
                PlaceHolder1.Controls.Add(lblContent);
                PlaceHolder1.Controls.Add(new LiteralControl("</div>"));
            }

            if (Regex.IsMatch(item.sqlSchemeName, @"ItemText\d"))
            {
                TextBox tb = new TextBox();
                tb.CssClass = "form-control";
                PlaceHolder1.Controls.Add(tb);
            }

            PlaceHolder1.Controls.Add(new LiteralControl("</div>"));
        }

        Button btnSubmit=new Button();
        btnSubmit.Text = "送出";
        btnSubmit.CssClass = "btn btn-primary";
        PlaceHolder1.Controls.Add(btnSubmit);
    }
}