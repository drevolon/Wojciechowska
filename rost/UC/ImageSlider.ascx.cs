using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rost.UC
{
    public partial class ImageSlider : System.Web.UI.UserControl
    {
        protected int _items;
        public int idPages
        {
            get { return _items; }
            set { _items = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["id_pages"] != null && idPages == -1)
                {
                    idPages = Convert.ToInt16(Request["id_pages"].ToString());
                }
                //LHeader.Text = HeaderNews;
                BindGrid(idPages);
                //HyperLinkHead.NavigateUrl = "~/News.aspx?id_pages=" + TypeNews;


                // LabelHeader.Text = HeaderNews;

                //gridviewCountRow = GridView1.Rows.Count;
            }
            // GridView1.Width = WidthNews;
        }

        protected void BindGrid(int type_news)
        {
            object data = null;
            int current_year = DateTime.Now.Year;
            //int begin_year = current_year - 3;
            //int end_year = current_year + 1;

            //this.SqlDataSourceBaseText.SelectParameters[0].DefaultValue = "01.01." + begin_year;
            this.SqlDataSourceBaseText.SelectParameters[0].DefaultValue = "0";
            this.SqlDataSourceBaseText.SelectParameters[1].DefaultValue = type_news.ToString();
            data = SqlDataSourceBaseText.Select(DataSourceSelectArguments.Empty);

            //GridView1.DataSource = data;
            //GridView1.DataBind();
            //RepSlider.DataSource = data;
            //RepSlider.DataBind();
        }

        protected void RepSlider_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
//            if (e.Item.ItemType == ListItemType.Item ||
//                   (e.Item.ItemType == ListItemType.AlternatingItem))
//            {
//                String items = ((Label)e.Item.FindControl("LabelItemItems")).Text;
////                String type_img = "news_id";
////                String id_images = ((Label)e.Item.FindControl("LabelItemId_images")).Text;
////                string id_text = ((Label)e.Item.FindControl("LabelId_text")).Text;
//                //                string base_text = ((Label)e.Item.FindControl("LabelItemBase_text")).Text;


////                ((HyperLink)e.Item.FindControl("HyperLinkImg")).NavigateUrl = "~/descText.aspx?id_text=" + id_text + "&items=" + items;

//  //              if (((Label)e.Item.FindControl("LabelItemHave_img")).Text == "True")
//  //              {
//                    //((Image)e.Row.FindControl("ImageCatalog")).ImageUrl = "./../photoDB.ashx?type_img=" + type_img + "&items=" + items + "&w=" + w + "&h=" + h;

////                    ((Image)e.Item.FindControl("ImageItem")).Visible = true;
//                    //                    ((Image)e.Item.FindControl("ImageItem")).ImageUrl = "./../photoDB.ashx?type_img=" + type_img + "&id=" + id_images;
//                    //((Image)e.Row.FindControl("ImageItem")).FullImageURL = "photoDB.ashx?type_img=" + type_img_big + "&items=" + items;
//                    //((Image)e.Item.FindControl("ImageItem")).ImageUrl = "./../photoDB.ashx?type_img=image_bigCA&items=" + items;
//                //}
//                //else
//                //{
//                //    ((System.Web.UI.WebControls.Image)e.Item.FindControl("ImageItem")).Visible = false;
//                //}


            //}
        }
    }
}