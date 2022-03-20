using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlTypes;


public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        #region variables
        SqlString strUserName = SqlString.Null;
        SqlString strPassword = SqlString.Null;
        String strErrorMessage = "";
        #endregion variables

        #region server side validation
        if (txtUsername.Text.Trim() == "")
        {
            strErrorMessage += "Enter User Name<br>";
        }
        if (txtPassword.Text.Trim() == "")
        {
            strErrorMessage += "Enter password<br>";
        }
        if (strErrorMessage != "")
        {
            lblMessage.Text = strErrorMessage;
            return;
        }
        #endregion server side validation

        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["MultiUserAddressBookConnectionString"].ConnectionString);
        try
        {
            objConn.Open();
            #region select user/password
            SqlCommand objCmd = new SqlCommand();
            objCmd.Connection = objConn;
            objCmd.CommandType = CommandType.StoredProcedure;

            objCmd.CommandText = "[dbo].[PR_User_SelectByUserNameAndPassword]";

            strUserName = txtUsername.Text.Trim();
            strPassword = txtPassword.Text.Trim();

            objCmd.Parameters.AddWithValue("@UserName", strUserName);
            objCmd.Parameters.AddWithValue("@Password", strPassword);

            SqlDataReader objSDR = objCmd.ExecuteReader();

            if (objSDR.HasRows)
            {
                while (objSDR.Read())
                {
                    if (objSDR["UserID"].Equals(DBNull.Value) != true)
                    {
                        Session["UserID"] = objSDR["UserID"].ToString();
                        Session["UserName"] = txtUsername.Text;

                        Response.Redirect("~/AdminPanel/Country/CountryList.aspx");
                    }
                    
                    break;
                }
            }
            lblMeassage.Text = "invalid ";
            #endregion select user/password
            objConn.Close();  
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
        }
        finally
        {
            objConn.Close();
        }

    }
}