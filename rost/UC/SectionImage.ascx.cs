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
    public partial class SectionImage : System.Web.UI.UserControl
    {
        protected int _items;
        protected int _w = 0;
        protected int _h = 0;

        public int IdText
        {
            get { return _items; }
            set { _items = value; }
        }
        public int iWidth
        {
            get { return _w; }
            set { _w = value; }
        }
        public int iHeight
        {
            get { return _h; }
            set { _h = value; }
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
                    SqlCommand cmd = new SqlCommand("select items from BaseText where id_text=@id_text", sqc);
                    cmd.Parameters.AddWithValue("id_text", IdText);
                    string items = cmd.ExecuteScalar()?.ToString() ?? string.Empty;

                    if ((iWidth==0)&&(iHeight==0))
                        ImageItem.ImageUrl = "~/photoDB.ashx?type_img=image_bigCA&items=" + items;
                    else
                        ImageItem.ImageUrl = "~/photoDB.ashx?type_img=image_lowCA&items=" + items + "&w="+iWidth.ToString()+"&h="+iHeight.ToString();

                    ImageItem.FullImageURL = "~/photoDB.ashx?type_img=image_bigCA&items=" +items;

                    
                    sqc.Close();
                }


            }
        }

    }
}