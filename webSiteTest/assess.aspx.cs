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
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = 0;
        int i = 0;
        if (Request.QueryString["pid"] != null) {
            id = Convert.ToInt32(Request.QueryString["pid"]);
        }
        CAssess assess = assessFactory.getById(id);
        lblAssessName.Text = assess.name;

        CGroup group = new CGroup();
        group.id = 0;

        foreach (CItem item in assess.items)
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
            
            foreach (CContent content in item.contents)
            {
                RadioButton rdbtn = new RadioButton();
                rdbtn.GroupName = item.id.ToString();
                rdbtn.ID = "rdbtn"+i;
                rdbtn.Text = content.content;

                PlaceHolder1.Controls.Add(new LiteralControl("<span style='padding-right:20px;font-size:large'>"));
                PlaceHolder1.Controls.Add(rdbtn);                
                PlaceHolder1.Controls.Add(new LiteralControl("</span>"));
                if(i%2 == 1)
                {
                    Label lblIsNotChecked = new Label();
                    lblIsNotChecked.ID = "lblChecked" + i;
                    lblIsNotChecked.Text = "*尚未選擇欄位";
                    lblIsNotChecked.Visible = false;
                    PlaceHolder1.Controls.Add(lblIsNotChecked);
                }
                i++;
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
        btnSubmit.Click += btnSubmit_Click;
        btnSubmit.CssClass = "btn btn-primary";
        PlaceHolder1.Controls.Add(btnSubmit);
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
                catch (Exception){}
            }    
            
        }
    }
}