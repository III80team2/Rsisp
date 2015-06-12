using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class assess : System.Web.UI.Page
{
    CAssessFactory assessFactory = new CAssessFactory();
    public int score = 0;
    List<int> scoreList = new List<int>();
    Label lblIsNotChecked = new Label();
    int rdbtn_id = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        int id = 0;        

        if (Request.QueryString["pid"] != null)
            id = Convert.ToInt32(Request.QueryString["pid"]);
        else
            Response.Redirect(Request.UrlReferrer.ToString());

        CAssess assess = assessFactory.getById(id);
        lblAssessName.Text = assess.name;

        CGroup group = new CGroup();
        group.id = 0;

        int groupCount = 0;
        foreach (CItem item in assess.items)
        {
            if (!item.group.id.Equals(group.id))
            {
                if (groupCount > 0)
                    PlaceHolder1.Controls.Add(new LiteralControl("</div>"));

                group.id = item.group.id;

                Label lblGroupName = new Label();
                lblGroupName.Text = item.group.name;
                lblGroupName.CssClass = "label";

                PlaceHolder1.Controls.Add(new LiteralControl("<div class='panel panel-primary'><div class='panel-heading'>"));
                PlaceHolder1.Controls.Add(lblGroupName);
                PlaceHolder1.Controls.Add(new LiteralControl("</div>"));
                groupCount++;
            }
            addItem(item);            
        }
        PlaceHolder1.Controls.Add(new LiteralControl("</div>"));

        Button btnSubmit = new Button();
        btnSubmit.Text = "送出";
        btnSubmit.Click += btnSubmit_Click;
        btnSubmit.CssClass = "btn btn-primary";
        PlaceHolder1.Controls.Add(btnSubmit);
    }

    private void addItem(CItem item)
    {
        Label lblItemName = new Label();
        lblItemName.Text = item.name;

        PlaceHolder1.Controls.Add(new LiteralControl("<div class='panel-body panel-success'><div class='panel-heading'>"));
        PlaceHolder1.Controls.Add(lblItemName);
        PlaceHolder1.Controls.Add(new LiteralControl("</div><div class='panel-body'>"));

        foreach (CContent content in item.contents)
        {
            RadioButton rdbtn = new RadioButton();
            rdbtn.GroupName = item.id.ToString();
            rdbtn.ID = "rdbtn" + rdbtn_id;
            rdbtn.Text = content.content;

            PlaceHolder1.Controls.Add(new LiteralControl("<span style='font-size:large'>"));
            PlaceHolder1.Controls.Add(rdbtn);
            PlaceHolder1.Controls.Add(new LiteralControl("</span>&nbsp&nbsp&nbsp"));

            if (rdbtn_id % 2 == 1)
            {
                Label lblIsNotChecked = new Label();
                lblIsNotChecked.ID = "lblChecked" + rdbtn_id;
                lblIsNotChecked.Text = "*尚未選擇欄位";
                lblIsNotChecked.Visible = false;
                PlaceHolder1.Controls.Add(lblIsNotChecked);
            }
            rdbtn_id++;
        }
        PlaceHolder1.Controls.Add(new LiteralControl("</div>"));

        if (Regex.IsMatch(item.sqlSchemeName, @"ItemText\d"))
        {
            TextBox tb = new TextBox();
            tb.CssClass = "form-control";
            PlaceHolder1.Controls.Add(tb);
        }

        PlaceHolder1.Controls.Add(new LiteralControl("</div>"));
    }

    private void btnSubmit_Click(object sender, EventArgs e)
    {
        lblIsNotChecked.Visible = false;
        RadioButton[] rbtnAry = new RadioButton[30];
        for (int k = 0; k <= 29; k++)
        {
            rbtnAry[k] = (RadioButton)PlaceHolder1.FindControl("rdbtn" + k);
            if ((rbtnAry[k].Checked) && (rbtnAry[k].Text.Equals("是")))
            {
                score++;
                Label1.Text = score.ToString();
            }

            if (k % 2 == 1)
            {
                try
                {
                    if ((rbtnAry[k].Checked) || (rbtnAry[k - 1].Checked))
                    {

                    }
                    else
                    {
                        Label lblChecked = (Label)PlaceHolder1.FindControl("lblChecked" + k);
                        lblChecked.Visible = true;
                    }
                }
                catch (Exception) { }
            }

        }
    }
}