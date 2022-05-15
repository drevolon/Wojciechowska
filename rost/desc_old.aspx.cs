using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shop_health
{
    public partial class desc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["id_text"] != null)
                {
                    //BindGrid();
                }
            }
        }
        protected void BindGrid()
        {
            object data = null;
            this.SqlDataSourceBaseText.SelectParameters[0].DefaultValue = Request["id_text"].ToString();
            data = SqlDataSourceBaseText.Select(DataSourceSelectArguments.Empty);

            GridView1.DataSource = data;
            GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow &&
              (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
            {
                String type_img = "image_lowCA"; //"news";
                String w = "250";
                String h = "200";

                String type_img_big = "image_bigCA";
                String items = ((Label)e.Row.FindControl("LabelItemItems")).Text;


                if (((Label)e.Row.FindControl("LabelItemHave_img")).Text == "True")
                {
                    ((Encosia.HighslideImage)e.Row.FindControl("ImageItem")).Visible = true;
                    ((Encosia.HighslideImage)e.Row.FindControl("ImageItem")).ImageUrl = "~/photoDB.ashx?type_img=" + type_img + "&items=" + items + "&w=" + w + "&h=" + h;
                    ((Encosia.HighslideImage)e.Row.FindControl("ImageItem")).FullImageURL = "~/photoDB.ashx?type_img=" + type_img_big + "&items=" + items;
                }
                else
                {
                    ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageItem")).Visible = false;
                    ((Panel)e.Row.FindControl("PanelImageRight")).Visible = false;
                }
            }
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
            e.Item.ItemType == ListItemType.AlternatingItem)
            {
                String id_images = ((Label)e.Item.FindControl("LabelItemId_images")).Text;
                String type_img = "image_low_id";
                String type_img_big = "news_id";
                int w = 70;
                int h = 70;

                ((Encosia.HighslideImage)e.Item.FindControl("ImageCatalog")).ImageUrl = "photoDB.ashx?type_img=" + type_img + "&id=" + id_images + "&w=" + w + "&h=" + h;
                ((Encosia.HighslideImage)e.Item.FindControl("ImageCatalog")).FullImageURL = "photoDB.ashx?type_img=" + type_img_big + "&id=" + id_images;
            }
        }

        protected void DataListFiles_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
            e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string strFileGUIDNames = ((Label)e.Item.FindControl("LabelItemFileGUIDNames")).Text;
                string pathFile = Path.Combine("../Upload/Files", strFileGUIDNames);

                ((HyperLink)e.Item.FindControl("HyperLinkFiles")).NavigateUrl = pathFile;
                if (Request["masterPage"] == "big")
                {
                    ((HyperLink)e.Item.FindControl("HyperLinkFiles")).NavigateUrl = pathFile + "&masterPage=big";
                }
            }
        }
    }
}