using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class guestPage : System.Web.UI.Page
{
    CPatientFactory factory = new CPatientFactory();
    bool isIDNull, isNameNull, isBirthNull;
    
    protected void Page_Load(object sender, EventArgs e)
    {
       divTab.Visible = false;
       List<CPatient> patientList = factory.getAll();
       isIDNull = patientID.Value == "";
       isNameNull = patientName.Value == "";
       isBirthNull = patientBirth.Value == "";
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
         isCurrent();
    }

    private void isCurrent()
    {
        try
        {
            string id = patientID.Value;
            string name = patientName.Value;
            string birth = patientBirth.Value;
            if ((!isIDNull && !isNameNull) || (!isNameNull && !isBirthNull) || (!isBirthNull && !isIDNull))
            {
                if ((!isIDNull && !isNameNull))
                {
                    if ((name.Equals(factory.getByIdCard(id).name)) && (id.Equals(factory.getByIdCard(id).idcard)))
                        divTab.Visible = true;
                    else
                    {
                        divTab.Visible = false;
                        Response.Write("<script>alert('輸入錯誤')</script>");
                    }
                }
                if ((!isNameNull && !isBirthNull))
                {
                    if ((birth.Equals(factory.getByBirthday(birth))) && (name.Equals(factory.getByName(name).name)))
                        divTab.Visible = true;
                    else
                    {
                        divTab.Visible = false;
                        Response.Write("<script>alert('輸入錯誤')</script>");
                    }
                }
                else if ((!isBirthNull && !isIDNull))
                {
                    if ((birth.Equals(factory.getByBirthday(birth))) && (id.Equals(factory.getByIdCard(id).idcard)))
                        divTab.Visible = true;
                    else
                    {
                        divTab.Visible = false;
                        Response.Write("<script>alert('輸入錯誤')</script>");
                    }
                }
            }
            else{ Response.Write("<script>alert('有欄位沒輸入')</script>");  }
        }
        catch (Exception) { }
        
    }
}