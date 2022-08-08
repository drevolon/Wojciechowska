using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rost.UC
{
    public partial class SectionText : System.Web.UI.UserControl
    {
        protected int _items;

        public int IdText
        {
            get { return _items; }
            set { _items = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["id_text"] != null)
                {
                    IdText = Convert.ToInt16(Request["id_text"].ToString());
                }
                using (SqlConnection sqc = new SqlConnection(ConfigurationManager.ConnectionStrings["rostConnectionString"].ToString()))
                {
                    sqc.Open();
                    SqlCommand cmd = new SqlCommand("select base_text from BaseText where id_text=@id_text", sqc);
                    cmd.Parameters.AddWithValue("id_text", IdText);
                    SectionTextLiteral.Text = cmd.ExecuteScalar()?.ToString() ?? string.Empty;
                    sqc.Close();
                }


            }
        }

    }
}