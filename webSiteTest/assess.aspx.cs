using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Drawing;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class assess : System.Web.UI.Page
{
    string connectionString = WebConfigurationManager.OpenWebConfiguration("/webSiteTest").ConnectionStrings.ConnectionStrings["RsispConnectionString"].ConnectionString;

    CUserFactory userFactory = new CUserFactory();
    CUser user = new CUser();
    CAssessFactory assessFactory = new CAssessFactory();
    CAssess myAssess = new CAssess();
    string patient_id;
    int schedule_id;
    int assessRecord_id;

    public int totalScore = 0;        
    int rdbtn_id = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] != null)
            user = userFactory.getByAccount(Session["loginName"].ToString());
        else
            Response.Redirect("login.aspx");

        int assess_id = 0;

        if (Request.QueryString["pid"] != null && Request.QueryString["aid"] != null && Request.QueryString["sid"] != null)
        {
            assess_id = Convert.ToInt32(Request.QueryString["aid"]);
            patient_id = Request.QueryString["pid"];
            schedule_id = Convert.ToInt32(Request.QueryString["sid"]);
        }
        else
            Response.Redirect(Request.UrlReferrer.ToString());

        myAssess = assessFactory.getById(assess_id);
        lblAssessName.Text = myAssess.name;

        CGroup group = new CGroup();
        group.id = 0;

        int groupCount = 0;
        foreach (CItem item in myAssess.items)
        {
            if (!item.group.id.Equals(group.id))
            {
                if (groupCount > 0)
                    PlaceHolder1.Controls.Add(new LiteralControl("</div>"));

                group.id = item.group.id;

                Label lblGroupName = new Label();
                lblGroupName.Text = item.group.name;
                lblGroupName.CssClass = "label";

                PlaceHolder1.Controls.Add(new LiteralControl("<div class='panel panel-primary' style='font-size:X-large'><div class='panel-heading'>"));
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
        btnSubmit.CssClass = "btn btn-large btn-block btn-success";
        btnSubmit.Height = 60;
        btnSubmit.Font.Size = 18;
        btnSubmit.ForeColor = Color.Black;
        PlaceHolder1.Controls.Add(btnSubmit);
    }

    private void addItem(CItem item)
    {
        Label lblItemName = new Label();
        lblItemName.Text = item.name;

        PlaceHolder1.Controls.Add(new LiteralControl("<div class='panel-success'><div class='panel-heading'>"));
        PlaceHolder1.Controls.Add(lblItemName);
        PlaceHolder1.Controls.Add(new LiteralControl("</div><div class='panel-body'>"));

        foreach (CContent content in item.contents)
        {
            RadioButton rdbtn = new RadioButton();
            rdbtn.GroupName = item.id.ToString();
            rdbtn.ID = "rdbtn" + rdbtn_id;
            rdbtn.Attributes["ID_Content"] = content.id.ToString();
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
            tb.TextMode = TextBoxMode.MultiLine;
            tb.CssClass = "form-control";
            PlaceHolder1.Controls.Add(tb);
        }

        PlaceHolder1.Controls.Add(new LiteralControl("</div>"));
    }

    private void btnSubmit_Click(object sender, EventArgs e)
    {
        readyToInsertRecord();

        int contents_count = 0;
        foreach (CItem item in myAssess.items)
            foreach (CContent content in item.contents)
                contents_count++;

        RadioButton[] rbtnAry = new RadioButton[contents_count];
        for (int k = 0; k < contents_count; k++)
        {
            rbtnAry[k] = (RadioButton)PlaceHolder1.FindControl("rdbtn" + k);
            if (rbtnAry[k].Checked)
            {
                int content_id = Convert.ToInt32(rbtnAry[k].Attributes["ID_Content"]);
                CContent content = assessFactory.getContentById(content_id);
                string schemeName = assessFactory.getItemById(content.item_id).sqlSchemeName;

                insertRecord_Score(schemeName, content.score);

                totalScore += content.score;
                Label1.Text = totalScore.ToString();
            }

            //欄位驗證
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
        CScheduleFactory scheduleFactory = new CScheduleFactory();
        scheduleFactory.setScheduleIsFinishedById(schedule_id);
    }

    private void readyToInsertRecord()
    {
        SqlConnection con = new SqlConnection(connectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(String.Format(@"
                insert into {0}(ID_User, ID_Patient, RecordDate)
                values ('{1}', '{2}', '{3}')
            ", myAssess.sqlTableName, user.id, patient_id, DateTime.Now.ToShortDateString()), con);

        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            string message=ex.Message;
        }

        cmd = new SqlCommand(String.Format(@"
                select ID_{0} 
                from {0} 
                where ID_User = '{1}' and ID_Patient = '{2}' and RecordDate = '{3}'
            ", myAssess.sqlTableName, user.id, patient_id, DateTime.Now.ToShortDateString()), con);
        SqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
            assessRecord_id = (int)reader[0];
        reader.Close();

        con.Close();        
    }

    private void insertRecord_Score(string schemeName, int score)
    {
        SqlConnection con = new SqlConnection(connectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(String.Format(@"
                update {0}
                set {1} = {2}
                where ID_{0} = {3}
            ", myAssess.sqlTableName, schemeName, score, assessRecord_id), con);

        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            string message = ex.Message;
        }

        con.Close();
    }
}