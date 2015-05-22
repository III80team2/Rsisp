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
        if ((!isIDNull && !isNameNull) || (!isNameNull && !isBirthNull) || (!isBirthNull && !isIDNull))
        {
            if ((!isIDNull && !isNameNull))
            {
                string id = patientID.Value;
                string name = patientName.Value;
                if ((factory.getByIdCard(id) != null) && (name.Equals(factory.getByIdCard(id).name)))
                {
                    divTab.Visible = true;
                }
                else { divTab.Visible = false; }
            }
            if ((!isNameNull && !isBirthNull))
            {
                string name = patientName.Value;
                string birth = factory.getByName(name).birthday;
                patientID.Value = factory.getByBirthday(birth).birthday;
                if ((factory.getByBirthday(birth) != null) && (name == "催聖賢"))
                {
                    divTab.Visible = true;
                }
                else { divTab.Visible = false; }
            }
            else if ((!isBirthNull && !isIDNull))
            {
                string id = patientID.Value;
                if (factory.getByIdCard(id) != null)
                {
                    divTab.Visible = true;
                }
                else { divTab.Visible = false; }
            }
            
        }
        else 
        {
            Response.Write("<script>alert('有欄位沒輸入')</script>");
        }
        
    }
}