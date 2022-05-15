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
    public partial class add_items_gallery : System.Web.UI.Page
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

                String items = ((Label)e.Row.FindControl("LabelItemItems")).Text;
                String type_img = "image_low";
                int w = 70;
                int h = 70;

                Label LabelItemDescription_text = ((Label)e.Row.FindControl("LabelItemDescription_text"));

                String str = LabelItemDescription_text.Text;
                string cleanHeader = Regex.Replace(str, @"<(.|\n)*?>", string.Empty);
                LabelItemDescription_text.Text = cleanHeader.Length > 60 ? cleanHeader.Substring(0, 60) + "..." : cleanHeader;

                //Label LabelItemBase_text = ((Label)e.Row.FindControl("LabelItemBase_text"));

                //str = LabelItemBase_text.Text;
                //cleanHeader = Regex.Replace(str, @"<(.|\n)*?>", string.Empty);
                //LabelItemBase_text.Text = cleanHeader.Length > 100 ? cleanHeader.Substring(0, 100) + "..." : cleanHeader;


                //if (((Label)e.Row.FindControl("LabelItemHave_img")).Text == "True")
                //{
                    ((Image)e.Row.FindControl("ImageCatalog")).ImageUrl = "./../photoDB.ashx?type_img=" + type_img + "&items=" + items + "&w=" + w + "&h=" + h;
                //}
                //else
                //{
                   // ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageCatalog")).Visible = false;
                //}
            
              
            }
            if ((e.Row.RowState & DataControlRowState.Edit) == DataControlRowState.Edit)
            {

            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            e.OldValues.Remove("id_pages"); e.NewValues.Remove("id_pages");
            e.OldValues.Remove("items"); e.NewValues.Remove("items");
            e.OldValues.Remove("id_gallery_name"); e.NewValues.Remove("id_gallery_name");
            

            //string have_img = ((Label)GridView1.Rows[e.RowIndex].FindControl("LabelEditHave_img")).Text;

            //Подгрузка изображения

            FileUpload FileUploadImg = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUploadImg");
            //String temp = ((Label)(GridView1.Rows[e.RowIndex].FindControl("LabelFileNames"))).Text;
            //CheckBox checkFileDelete = ((CheckBox)(GridView1.Rows[e.RowIndex].FindControl("CheckBoxFileDelete")));

            String items = ((Label)(GridView1.Rows[e.RowIndex].FindControl("LabelEditItemsFile"))).Text;
            if (items == "") items = System.Guid.NewGuid().ToString();
            String alt_images = "";
            int size_images = FileUploadImg.PostedFile.ContentLength;
            int id_pages = -2;// Convert.ToInt16(((Label)(GridView1.Rows[e.RowIndex].FindControl("LabelEditId_pages"))).Text);

            if (FileUploadImg.HasFile)
            {
                type_images = FileUploadImg.PostedFile.ContentType;
                images = new byte[size_images];
                FileUploadImg.PostedFile.InputStream.Read(images, 0, size_images);
                int indexOfSlash = FileUploadImg.PostedFile.FileName.LastIndexOf("\\") + 1;
                name_images = FileUploadImg.PostedFile.FileName.Substring(indexOfSlash);
                Images objImg = new Images();

                objImg.ImagesUpdate
                    (
                        items,
                        id_pages,
                        images,
                        name_images,
                        type_images,
                        size_images,
                        alt_images
                    );

                have_img = true;

            }
            e.OldValues.Remove("items"); e.NewValues.Remove("items"); e.NewValues.Add("items", items);
        }

        protected void SqlDataSourceImagesBase_text_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Cancel = false;
            try
            {
                //id_pages, description_text, header_text, base_text, date_text, items, have_img, visible_blok, prioritet_text, header_text
                e.Command.Parameters["@id_pages"].Value = Request["id_pages"];
                e.Command.Parameters["@description_text"].Value = "Фотогалерея";
                e.Command.Parameters["@header_text"].Value = TextBoxHeader_text.Text;
                e.Command.Parameters["@base_text"].Value =  "Фотогалерея";
                e.Command.Parameters["@date_text"].Value = DateTime.Now.Date;
                e.Command.Parameters["@items"].Value = items;
                e.Command.Parameters["@have_img"].Value = have_img;
                e.Command.Parameters["@visible_blok"].Value = true;
            }
            catch
            {
                //LabelError.Text = ex.Message;
                //LabelError.Visible = true;
                //e.Cancel = true;
            }
        }

        protected void LinkButtonAddGallery_name_Click(object sender, EventArgs e)
        {
            Response.Redirect("add_items_gallery_set.aspx");
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void SqlDataSourceGallery_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Cancel = false;
            try
            {

                e.Command.Parameters["@id_gallery_name"].Value = DropDownListGallery_name.SelectedValue;
                e.Command.Parameters["@photo_desc"].Value = TextBoxHeader_text.Text;
                e.Command.Parameters["@date_img"].Value = DateTime.Now;
                e.Command.Parameters["@items"].Value = ViewState["items"].ToString();
                e.Command.Parameters["@visible_blok"].Value = true;
            }
            catch 
            {
                //LabelError.Text = ex.Message;
                //LabelError.Visible = true;
                //e.Cancel = true;
            }
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

            //RegisterHyperLink.NavigateUrl = "RegisterMed";
            // Включите, когда будет включено подтверждение учетной записи для функции сброса пароля
            //ForgotPasswordHyperLink.NavigateUrl = "Forgot";
            //OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            //var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            //if (!String.IsNullOrEmpty(returnUrl))
            //{
                //RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            //}
        }

        protected void LinkButtonInsert_Click(object sender, EventArgs e)
        {
            have_img = false;
            int id_pages = -2;// Convert.ToInt16(Request["id_pages"].ToString());
            string alt_images = "";
            items = Guid.NewGuid().ToString();
            ViewState["items"]= items;

            //Подгрузка изображения

            //FileUpload FileUploadImg = FileUploadImage;
            size_images = FileUploadImg.PostedFile.ContentLength;

            if (FileUploadImg.HasFile)
            {
                type_images = FileUploadImg.PostedFile.ContentType;
                images = new byte[size_images];
                FileUploadImg.PostedFile.InputStream.Read(images, 0, size_images);
                int indexOfSlash = FileUploadImg.PostedFile.FileName.LastIndexOf("\\") + 1;
                name_images = FileUploadImg.PostedFile.FileName.Substring(indexOfSlash);
                Images objImg = new Images();

                objImg.ImagesUpdate
                    (
                        items,
                        id_pages,
                        images,
                        name_images,
                        type_images,
                        size_images,
                        alt_images
                    );

                have_img = true;

            }

            SqlDataSourceGallery.Insert();
            GridView1.DataBind();
        }

        
    }
}