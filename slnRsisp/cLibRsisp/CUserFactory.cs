using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.WebControls;

public class CUserFactory
{
    List<CUser> users=new List<CUser>();

    public CUserFactory()
    {
        loadData();
    }

    private void loadData()
    {
        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = @"Data Source=CR4-04\MSSQLSERVER2013;Initial Catalog=Rsisp;Integrated Security=True";
        sds.SelectCommand = "dbo.getUsers";
        sds.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;

        if (dv.Count > 0)
        {
            for (int i = 0; i < dv.Count; i++)
            {
                CUser user = new CUser();
                user.id = dv.Table.Rows[i]["ID_User"].ToString();
                user.name = dv.Table.Rows[i]["UserName"].ToString();
                user.role = dv.Table.Rows[i]["ID_Role"].ToString();
                user.account = dv.Table.Rows[i]["UserAccount"].ToString();
                user.password = dv.Table.Rows[i]["UserPassword"].ToString();
                users.Add(user);
            }
        }
    }

    public List<CUser> getAll()
    {
        return users;
    }

    public CUser getById(string id)
    {
        for (int i = 0; i < users.Count; i++)
        {
            if (users[i].id == id)            
                return users[i];            
        }
        return null;
    }

    public CUser getByName(string name)
    {
        for (int i = 0; i < users.Count; i++)
        {
            if (users[i].name == name)
                return users[i];
        }
        return null;
    }

    public CUser getByRole(string role)
    {
        for (int i = 0; i < users.Count; i++)
        {
            if (users[i].role == role)
                return users[i];
        }
        return null;
    }

    public CUser getByAccount(string account)
    {
        for (int i = 0; i < users.Count; i++)
        {
            if (users[i].account == account)
                return users[i];
        }
        return null;
    }

    //帳號與密碼驗證
    public bool loginCheck(string account, string password)
    {
        if (password.Equals(this.getByAccount(account).password))
            return true;
        return false;
    }

    public bool isCurrentUser(string userName,string userPassword) 
    {
        List<string> userNameList = new List<string>();
        List<string> passwordList = new List<string>();
        bool result=true;
        
        for (int i = 0; i < users.Count;i++ )
        {
            userNameList.Add(users[i].name);
            passwordList.Add(users[i].password);
        }
        for (int i = 0; i < userNameList.Count; i++)
        {
            if (userName.Equals(userNameList[i]))
            {
                if (userPassword.Equals(passwordList[i]))
                {
                    result = true;
                }
                else {
                    result = false;
                }
            }
            else {
                result = false;
            }
        }
        return result;
    }
}

