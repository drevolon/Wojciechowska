using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using rost.App_Code;

namespace rost.UC
{
    public partial class QueryClients : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void submitBtn_Click(object sender, EventArgs e)
        {
            Utilites creq = new Utilites();
            string rez = creq.AddRequest("услугу", ClientName.Text, ClientPhone.Text, ClientComments.Text);
            if (rez == "")
            {
                ClientName.Text = "";
                ClientPhone.Text = "";
                InfoReq.ForeColor = System.Drawing.Color.LightGreen;
                InfoReq.Text = "Заявка отправлена";
            }
            else
            {
                InfoReq.ForeColor = System.Drawing.Color.Red;
                InfoReq.Text = rez;

            }
        }
        protected void pesonalInfo_CheckedChanged(object sender, EventArgs e)
        {
            if (pesonalInfo.Checked)
            {
                submitBtn.Enabled = true;
            }
            else
            {
                submitBtn.Enabled = false;
            }
        }
    } 
    
}