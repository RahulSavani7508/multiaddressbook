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

public partial class Login_Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        #region variable
        SqlString strUserName = SqlString.Null;
        SqlString strPassword = SqlString.Null;
        SqlString strEmail = SqlString.Null;
        SqlString strMobile = SqlString.Null;
        SqlString strDisplayName = SqlString.Null;
        String strErrorMessage = "";
        #endregion variable

        #region server side validation
        if (txtUserName.Text.Trim() == "")
        {
            strErrorMessage += "Enter User Name<br>";
        }
        if (txtPassword.Text.Trim() == "")
        {
            strErrorMessage += "Enter password<br>";
        }
        if (txtMobile.Text.Trim() == "")
        {
            strErrorMessage += "Enter Mobile No<br>";
        }
        if (txtEmail.Text.Trim() == "")
        {
            strErrorMessage += "Enter Email<br>";
        }
        if (txtDisplayName.Text.Trim() == "")
        {
            strErrorMessage += "Enter Display Name<br>";
        }
        if (strErrorMessage != "")
        {
            lblMessage.Text = strErrorMessage;
            return;
        }
        #endregion server side validation
        lblMessage.Text = "Data Save Sucessfully";
        
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["MultiUserAddressBookConnectionString"].ConnectionString);
        try
        {
            objConn.Open();
            #region user insert
            SqlCommand objCmd = objConn.CreateCommand();
            objCmd.CommandType = CommandType.StoredProcedure;

            strUserName = txtUserName.Text.Trim();
            strPassword = txtPassword.Text.Trim();
            strMobile = txtMobile.Text.Trim();
            strEmail = txtEmail.Text.Trim();
            strDisplayName = txtDisplayName.Text.Trim();

            objCmd.Parameters.AddWithValue("@UserName", strUserName);
            objCmd.Parameters.AddWithValue("@Password", strPassword);
            objCmd.Parameters.AddWithValue("@MobileNo", strMobile);
            objCmd.Parameters.AddWithValue("@Email", strEmail);
            objCmd.Parameters.AddWithValue("@DisplayName", strDisplayName);

            objCmd.CommandText = "PR_User_Insert";
            objCmd.ExecuteNonQuery();

            lblMessage.Text = "Data Inserted Sucessfully";
            txtUserName.Text = "";
            txtPassword.Text = "";
            txtMobile.Text = "";
            txtEmail.Text = "";
            txtDisplayName.Text = "";
            txtUserName.Focus();
            Response.Redirect("~/AdminPanel/Login_Registration/Login.aspx");
            #endregion user insert
            objConn.Close();
        }
        catch(Exception ex)
        {
            lblMessage.Text = ex.Message;
        }
        finally
        {
            objConn.Close();
        }

    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtUserName.Text = "";
        txtEmail.Text = "";
        txtMobile.Text = "";
        txtPassword.Text = "";
        lblMessage.Text = "";
         
    }
}