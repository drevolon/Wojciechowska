using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rost
{
    public partial class descImage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GridView1_RowDataBound(object sender, RepeaterItemEventArgs e)
        {
            String items = ((Label)e.Item.FindControl("LabelItemItems")).Text;


            if (((Label)e.Item.FindControl("LabelItemHave_img")).Text == "True")
            {
                ((Encosia.HighslideImage)e.Item.FindControl("ImageItem")).Visible = true;
                ((Encosia.HighslideImage)e.Item.FindControl("ImageItem")).ImageUrl = "~/photoDB.ashx?type_img=image_lowCA&items=" + items + "&w=1200&h=800";
                ((Encosia.HighslideImage)e.Item.FindControl("ImageItem")).FullImageURL = "~/photoDB.ashx?type_img=image_big&items=" + items;
            }
            else
            {
                ((System.Web.UI.WebControls.Image)e.Item.FindControl("ImageItem")).Visible = false;
                ((Panel)e.Item.FindControl("PanelImageRight")).Visible = false;
            }
        }
    }
}