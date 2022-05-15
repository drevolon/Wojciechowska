using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rost
{
    public partial class logon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonLogon_Click(object sender, EventArgs e)
        {
            if (FormsAuthentication.Authenticate(UsernameTextbox.Text, PasswordTextbox.Text))
                FormsAuthentication.RedirectFromLoginPage(UsernameTextbox.Text, true);
            else
                LabelInfo.Text = "Login failed. Please check your user name and password and try again.";
        }
    }
}