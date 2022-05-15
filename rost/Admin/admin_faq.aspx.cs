using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rost
{
    public partial class admin_faq: System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonAddFAQ_Click(object sender, EventArgs e)
        {
            using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["rostConnectionString"].ConnectionString))
            {
                MyConnection.Open();
                SqlCommand com = new SqlCommand("insert into faq (question,answer) values (@question,@answer)", MyConnection);
                try
                {
                    com.Parameters.AddWithValue("question", TextBoxQ.Text);
                    com.Parameters.AddWithValue("answer", TextBoxA.Text);
                    com.ExecuteNonQuery();
                }
                catch
                { }
                MyConnection.Close();
            }
            GridView1.DataBind();
        }

    }
}