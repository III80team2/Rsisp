using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class testAssess : System.Web.UI.Page
{
    CAssessFactory assessFactory = new CAssessFactory();

    protected void Page_Load(object sender, EventArgs e)
    {
        CAssess assess=assessFactory.getById(1);
        lblAssessName.Text = assess.name;

        foreach (CAssess.CItem item in assess.items)
        {
            Label lblItemName = new Label();
            lblItemName.Text = item.name;

            PlaceHolder1.Controls.Add(lblItemName);
            PlaceHolder1.Controls.Add(new LiteralControl("<br />"));

            foreach (CAssess.CItem.CContent content in item.contents)
            {
                RadioButton rdbtn = new RadioButton();
                rdbtn.GroupName = item.id.ToString();
                Label lblContent = new Label();
                lblContent.Text = content.content;

                PlaceHolder1.Controls.Add(rdbtn);
                PlaceHolder1.Controls.Add(lblContent);
                PlaceHolder1.Controls.Add(new LiteralControl("<br />"));
            }
        }
    }
}