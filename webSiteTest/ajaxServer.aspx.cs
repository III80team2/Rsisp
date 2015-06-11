using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ajaxServer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CAssessFactory assessFactory = new CAssessFactory("lite");
        int formCount = Request.Form.Count;

        if (Request.Form["assessName"] != null)
        {
            CAssess assess = new CAssess();
            assess.name = Request.Form["assessName"];
            assess.items = new List<CItem>();

            for (int i = 1; i < formCount; i++)
            {
                string groupName = "groupName" + i;
                if (Request.Form[groupName] != null)
                {
                    CGroup group = new CGroup();
                    group.name = Request.Form[groupName];

                    for (int j = 1; j < formCount; j++)
                    {
                        string itemNameInGroup = "itemName" + i + "-" + j;
                        if (Request.Form[itemNameInGroup] != null)
                        {
                            CItem item = new CItem();
                            item.name = Request.Form[itemNameInGroup];
                            item.group = group;
                            item.sqlSchemeName = "ItemScore";

                            for (int k = 1; k < formCount; k++)
                            {
                                string contentNameInGroup = "contentName" + i + "-" + j + "-" + k;
                                string contentScoreInGroup = "contentScore" + i + "-" + j + "-" + k;
                                if (Request.Form[contentNameInGroup] != null && Request.Form[contentScoreInGroup] != null)
                                {
                                    CContent content = new CContent();
                                    content.content = Request.Form[contentNameInGroup];
                                    content.score = Convert.ToInt32(Request.Form[contentScoreInGroup]);
                                }
                            }
                            assess.items.Add(item);
                            continue;
                        }

                        string textNameInGroup = "textName" + i + "-" + j;
                        if (Request.Form[textNameInGroup] != null)
                        {
                            CItem item = new CItem();
                            item.name = Request.Form[textNameInGroup];
                            item.group = group;
                            item.sqlSchemeName = "ItemText";
                            assess.items.Add(item);
                            continue;
                        }
                    }
                    continue;
                }

                string itemName = "itemName" + i;
                if (Request.Form[itemName] != null)
                {
                    CItem item = new CItem();
                    item.name = Request.Form[itemName];
                    item.sqlSchemeName = "ItemScore";

                    for (int j = 1; j < formCount; j++)
                    {
                        string contentNameInGroup = "contentName" + i + "-" + j;
                        string contentScoreInGroup = "contentScore" + i + "-" + j;
                        if (Request.Form[contentNameInGroup] != null && Request.Form[contentScoreInGroup] != null)
                        {
                            CContent content = new CContent();
                            content.content = Request.Form[contentNameInGroup];
                            content.score = Convert.ToInt32(Request.Form[contentScoreInGroup]);
                        }
                    }
                    assess.items.Add(item);
                    continue;
                }

                string textName = "textName" + i;
                if (Request.Form[textName] != null)
                {
                    CItem item = new CItem();
                    item.name = Request.Form[textName];
                    item.sqlSchemeName = "ItemText";
                    assess.items.Add(item);
                    continue;
                }
            }
            assessFactory.addAssessStyle(assess);
        }
    }
}