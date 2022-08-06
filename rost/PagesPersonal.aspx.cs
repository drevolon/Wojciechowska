using Encosia;
using rost.Admin;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rost
{
    public partial class PagesPersonal : System.Web.UI.Page
    {
        protected int _id_pages;
        public int IdPages
        {
            get { return _id_pages; }
            set { _id_pages = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["id_pages"] != null)
                {
                    IdPages = Convert.ToInt16(Request["id_pages"].ToString());
                }
                BindGrid(IdPages);
                using (SqlConnection sqc = new SqlConnection(ConfigurationManager.ConnectionStrings["rostConnectionString"].ToString()))
                {
                    sqc.Open();
                    SqlCommand cmd = new SqlCommand("select name_pages from Pages where id_pages=" + IdPages, sqc);
                    TextPages.Text = cmd.ExecuteScalar()?.ToString() ?? string.Empty;
                    sqc.Close();
                }
            }
        }
        protected void BindGrid(int type_news)
        {
            object data = null;
            int current_year = DateTime.Now.Year;
            //int begin_year = current_year - 3;
            //int end_year = current_year + 1;

            //this.SqlDataSourceBaseText.SelectParameters[0].DefaultValue = "01.01." + begin_year;
            SqlDataSourceBaseText.SelectParameters[0].DefaultValue = IdPages.ToString();
            data = SqlDataSourceBaseText.Select(DataSourceSelectArguments.Empty);

            //GridView1.DataSource = data;
            //GridView1.DataBind();
            RptPages.DataSource = data;
            RptPages.DataBind();
        }


        protected void RptPages_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            String w = "200";
            String h = "250";


            HighslideImage ImageItem = (HighslideImage)e.Item.FindControl("ImageItem");
            string items = ((Label)e.Item.FindControl("LabelItems")).Text;

            Literal TitleProps = (Literal)e.Item.FindControl("TitleProps");


            ImageItem.ImageUrl = "~/photoDB.ashx?type_img=image_lowCA&items=" + items + "&w=" + w + "&h=" + h;
            ImageItem.FullImageURL = "~/photoDB.ashx?type_img=image_bigCA&items=" + items;
            GridView panProp = (GridView)e.Item.FindControl("GridPropsList");
            string DopProps = ((Label)(e.Item.FindControl("LabelProps"))).Text;
            if (DopProps != string.Empty)
            {
                JsonProps ListProps = (new JavaScriptSerializer()).Deserialize<JsonProps>(DopProps);
                if (ListProps.Property.Count > 0)
                {
                    TitleProps.Text = ListProps.Property[0].value;
                    ListProps.Property.RemoveAt(0);
                }
                panProp.DataSource = ListProps.Property;
                panProp.DataBind();
            }
        }
    }
}