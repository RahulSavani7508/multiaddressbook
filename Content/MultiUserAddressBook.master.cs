using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MultiUserAddressBook : System.Web.UI.MasterPage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        if(Session["UserID"] == null)
        {
            Response.Redirect("~/AdminPanel/Login_Registration/Login.aspx");
        }
        else
        {
            lblDisplayName.Text = Session["UserName"].ToString();
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.RemoveAll();
        Response.Redirect("~/AdminPanel/Login_Registration/Login.aspx");
    }
}
