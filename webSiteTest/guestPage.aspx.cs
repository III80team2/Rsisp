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
       if (!IsPostBack) 
       {
           divBirth.Visible = false;
           divID.Visible = false;
       }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
         isCurrent();
    }

    private void isCurrent()
    {
        try
        {
            string idCard = patientID.Value;
            string name = patientName.Value;
            string birth = patientBirth.Value;
            if ((!isIDNull && !isNameNull) || (!isNameNull && !isBirthNull) || (!isBirthNull && !isIDNull))
            {
                if ((!isIDNull && !isNameNull))
                {
                    if ((factory.getByIdCard(idCard) != null) && (factory.getByName(name) != null))
                        divTab.Visible = true;
                    else
                    {
                        divTab.Visible = false;
                        Response.Write("<script>alert('輸入錯誤')</script>");
                    }
                }
                if ((!isNameNull && !isBirthNull))
                {
                    if ((factory.getByBirthday(DateTime.Parse(birth)) != null) && (factory.getByName(name) != null))
                        divTab.Visible = true;
                    else
                    {
                        divTab.Visible = false;
                        Response.Write("<script>alert('輸入錯誤')</script>");
                    }
                }
                else if ((!isBirthNull && !isIDNull))
                {
                    if ((factory.getByBirthday(DateTime.Parse(birth)) != null) && (factory.getByIdCard(idCard) != null))
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
    protected void btnBirth_Click(object sender, EventArgs e)
    {
        if (divID.Visible == true)
            divID.Visible = false;
        divBirth.Visible = true;
    }
    protected void btnID_Click(object sender, EventArgs e)
    {
        if (divBirth.Visible == true)
            divBirth.Visible = false;
        divID.Visible = true;
    }
}