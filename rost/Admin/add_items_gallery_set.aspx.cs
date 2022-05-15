using rost.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rost.Admin
{
    public partial class add_items_gallery_set : System.Web.UI.Page
    {

        public bool have_file, have_img;
        public string id_item;
        public byte[] images;
        public String name_images, name_pages, name_menu;
        public String type_images;
        public int size_images;
        public String items;

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow &&
               (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
            {

            }
            if ((e.Row.RowState & DataControlRowState.Edit) == DataControlRowState.Edit)
            {

            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            e.OldValues.Remove("date_gallery");
            e.NewValues.Remove("date_gallery");
            e.NewValues.Add("date_gallery", DateTime.Now.Date);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["id_pages"] != null)
                {
                    LabelHeaderPage.Text = Request["name_pages"].ToString();
                }
            }

        }

        protected void LinkButtonInsert_Click(object sender, EventArgs e)
        {
            this.SqlDataSourceGallery_name.Insert();
            GridView1.DataBind();
        }

        protected void SqlDataSourceBaseText_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Cancel = false;
            try
            {
                e.Command.Parameters["@gallery_name"].Value = TextBoxGallery_name.Text;
                e.Command.Parameters["@date_gallery"].Value = DateTime.Now;
                e.Command.Parameters["@gallery_name_desc"].Value = TextBoxGallery_name_desc.Text;
               // e.Command.Parameters["@id_pages_under"].Value = Convert.ToInt16(ViewState["id_pages_under"].ToString());
            }
            catch
            {
            }
        }
    }
}