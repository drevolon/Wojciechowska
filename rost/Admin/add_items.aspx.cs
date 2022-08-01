
using rost.App_Code;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web.Script.Serialization;
using System.Web.UI.WebControls;


namespace rost.Admin
{
    public class JsonProps
    {
        public List<JProp> Property { get; set; }
        public JsonProps()
        {
            Property = new List<JProp>();
        }
    }

    public class JProp
    {
        public string name { get; set; }
        public string value { get; set; }
    }


    public class JsonImages
    {
        public List<JImg> Images { get; set; }
        public JsonImages()
        {
            Images = new List<JImg>();
        }
    }

    public class JImg
    {
        public string name { get; set; }
        public string items { get; set; }
    }


    public partial class add_items : System.Web.UI.Page
    {

        public bool have_file, have_img;
        public string id_item;
        public byte[] images;
        public String name_images, name_pages, name_menu;
        public String type_images;
        public int size_images;
        public String items;
        public string property;
        public string images_add;
        DataTable dt;


        protected void  CreateDT()
        {
            dt = new DataTable();
            dt.Columns.Add(new DataColumn("FileName", typeof(String)));
            dt.Columns.Add(new DataColumn("item", typeof(String)));
        }

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

                Label LabelItemBase_text = ((Label)e.Row.FindControl("LabelItemBase_text"));

                str = LabelItemBase_text.Text;
                cleanHeader = Regex.Replace(str, @"<(.|\n)*?>", string.Empty);
                LabelItemBase_text.Text = cleanHeader.Length > 100 ? cleanHeader.Substring(0, 100) + "..." : cleanHeader;


                if (((Label)e.Row.FindControl("LabelItemHave_img")).Text == "True")
                {
                    ((Image)e.Row.FindControl("ImageCatalog")).ImageUrl = "./../photoDB.ashx?type_img=" + type_img + "&items=" + items + "&w=" + w + "&h=" + h;
                }
                else
                {
                    ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageCatalog")).Visible = false;
                }

                GridView panProp = (GridView)(e.Row.FindControl("GridPropsList"));

                string DopProps = ((Label)(e.Row.FindControl("LabelProps"))).Text;
                if (DopProps != string.Empty)
                {
                    JsonProps ListProps = (new JavaScriptSerializer()).Deserialize<JsonProps>(DopProps);
                    panProp.DataSource = ListProps.Property;
                    panProp.DataBind();
                }

                GridView panDoc = (GridView)(e.Row.FindControl("GridDocsList"));
                string DopDocs = ((Label)(e.Row.FindControl("LabelDocs"))).Text;
                if (DopDocs != string.Empty)
                {
                    JsonImages ListDocs = (new JavaScriptSerializer()).Deserialize<JsonImages>(DopDocs);
                    panDoc.DataSource = ListDocs.Images;
                    panDoc.DataBind();
                }


            }
            if ((e.Row.RowState & DataControlRowState.Edit) == DataControlRowState.Edit)
            {
                GridView GridProps = (GridView)e.Row.FindControl("GridPropsEdit");
                if (GridProps != null)
                {
                    string jsonString = ((Label)e.Row.FindControl("LabelPropsEdit")).Text;
                    JsonProps ListProps = (new JavaScriptSerializer()).Deserialize<JsonProps>(jsonString);
                    GridProps.DataSource = ListProps.Property;
                    GridProps.DataBind();
                }
                GridView panDoc = (GridView)(e.Row.FindControl("GridDocsEdit"));
                string DopDocs = ((Label)(e.Row.FindControl("LabelDocsEdit"))).Text;
                if (DopDocs != string.Empty)
                {
                    JsonImages ListDocs = (new JavaScriptSerializer()).Deserialize<JsonImages>(DopDocs);
                    JImg jimg = new JImg();
                    jimg.name = string.Empty;
                    jimg.items = string.Empty;
                    ListDocs.Images.Add(jimg);
                    panDoc.DataSource = ListDocs.Images;
                    panDoc.DataBind();
                }


            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            e.OldValues.Remove("id_pages"); e.NewValues.Remove("id_pages");
            e.OldValues.Remove("items"); e.NewValues.Remove("items");

            string have_img = ((Label)GridView1.Rows[e.RowIndex].FindControl("LabelEditHave_img")).Text;

            //Подгрузка изображения

            FileUpload FileUploadImg = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUploadImg");

            String items = ((Label)(GridView1.Rows[e.RowIndex].FindControl("LabelEditItems"))).Text;
            String alt_images = "";

            int id_pages = Convert.ToInt16(((Label)(GridView1.Rows[e.RowIndex].FindControl("LabelEditId_pages"))).Text);

            if (FileUploadImg.HasFile)
            {
                size_images = FileUploadImg.PostedFile.ContentLength;
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

                e.OldValues.Remove("have_img");
                e.NewValues.Remove("have_img");
                e.NewValues.Add("have_img", true);
                have_img = "true";
            }
            GridViewRow GV = ((GridView)sender).Rows[((GridView)sender).EditIndex];

            GridView GridProps = (GridView)GV.FindControl("GridPropsEdit");
            GridView GridDocs = (GridView)GV.FindControl("GridDocsEdit");

            JsonProps jsp = new JsonProps();

            GridViewRowCollection Rs = GridProps.Rows;
            foreach (GridViewRow R in Rs)
            {
                JProp pp = new JProp();
                string name = ((TextBox)R.FindControl("LabelNameEdit")).Text;
                string value = ((TextBox)R.FindControl("TextValueEdit")).Text;
                pp.name = name;
                pp.value = value;
                jsp.Property.Add(pp);
            }

            property = (new JavaScriptSerializer()).Serialize(jsp);

            JsonImages jimg = new JsonImages();

            GridViewRowCollection FRs = GridDocs.Rows;
            foreach (GridViewRow FR in FRs)
            {
                JImg pp = new JImg();
                string name = ((TextBox)FR.FindControl("TextNameDoc")).Text;
                string fitems = ((Label)FR.FindControl("TextItems")).Text;
                FileUpload FU = (FileUpload)FR.FindControl("FUpdateUpload");
                CheckBox delDoc = (CheckBox)FR.FindControl("DelDoc");
                if (!delDoc.Checked)
                {
                    pp.name = name;
                    pp.items = fitems;
                    if (FU.HasFile) pp.items = UploadFileToDB(FU, id_pages);
                    if (pp.items != string.Empty)
                    {
                        jimg.Images.Add(pp);
                    }
                }
            }
            images_add = (new JavaScriptSerializer()).Serialize(jimg);
            e.OldValues.Remove("property"); e.NewValues.Remove("property");
            e.OldValues.Remove("images_add"); e.NewValues.Remove("images_add");
            e.NewValues.Add("property", property);
            e.NewValues.Add("images_add", images_add);


        }

        protected void SqlDataSourceImagesBase_text_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            int iNpp = 0;
            try
            {
                iNpp = Int32.Parse(TextBoxNpp_text.Text);
            }
            catch
            {
                iNpp = 0;
            }
            e.Cancel = false;
            try
            {
                //id_pages, description_text, header_text, base_text, date_text, items, have_img, visible_blok, prioritet_text, header_text
                e.Command.Parameters["@id_pages"].Value = Request["id_pages"];
                e.Command.Parameters["@description_text"].Value = TextBoxDescription_text.Text;
                e.Command.Parameters["@header_text"].Value = TextBoxHeader_text.Text;
                e.Command.Parameters["@base_text"].Value = TextBoxBase_text.Text;
                e.Command.Parameters["@date_text"].Value = DateTime.Now.Date;
                e.Command.Parameters["@items"].Value = items;
                e.Command.Parameters["@have_img"].Value = have_img;
                e.Command.Parameters["@visible_blok"].Value = true;
                e.Command.Parameters["@npp"].Value = iNpp;
            }
            catch
            {
                //LabelError.Text = ex.Message;
                //LabelError.Visible = true;
                //e.Cancel = true;
            }
        }

        protected void LinkButtonQtyFiles_Click(object sender, EventArgs e)
        {
            int qtyFiles = 0;
            if (!int.TryParse(TextBoxQtyFiles.Text, out qtyFiles)) return;
            int AddDel = dt.Rows.Count - qtyFiles;
            if (AddDel>0)
            {
                for (int i=qtyFiles+AddDel-1; i>=qtyFiles;i--)
                {
                    dt.Rows.RemoveAt(i);
                }
            }
            if (AddDel < 0)
            {
                AddDel = Math.Abs(AddDel);
                for (int i = 0; i < AddDel; i++)
                {
                    dt.Rows.Add();
                }
            }

            ViewState["ListFiles"] = dt;
            GridViewFiles.DataSource = dt;
            GridViewFiles.DataBind();


        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["id_pages"] != null)
                {
                    string id_pages = Request["id_pages"].ToString();

                    LabelHeaderPage.Text = Request["name_pages"].ToString();

                    string jsonString = string.Empty;
                    //@"{Property:[{""name"":""имя1"",""value"":""данные1""},{""name"":""имя2"",""value"":""данные2""},{""name"":""имя3"",""value"":""данные3""}]}";
                    string props = string.Empty;

                    using (SqlConnection sqc = new SqlConnection(ConfigurationManager.ConnectionStrings["rostConnectionString"].ToString()))
                    {
                        sqc.Open();
                        SqlCommand cmd = new SqlCommand("select text_pages from pages where id=" + id_pages,sqc);
                        props = cmd.ExecuteScalar()?.ToString() ?? string.Empty;
                        sqc.Close();
                    }
                    JsonProps ListProps = new JsonProps();
                    string[] aProps = props.Split(';');
                    foreach (string p in aProps)
                    {
                        JProp jp = new JProp();
                        jp.name = p.Trim();
                        jp.value = string.Empty;
                        ListProps.Property.Add(jp);
                    }
                    //JsonProps ListProps = (new JavaScriptSerializer()).Deserialize<JsonProps>(jsonString);

                    GridProps.DataSource = ListProps.Property;
                    GridProps.DataBind();

                }

                CreateDT();
                ViewState["ListFiles"] = dt;
                TextBoxQtyFiles.Text = "0";
            }
            else
            {
                dt = (DataTable)ViewState["ListFiles"];
                GridViewFiles.DataSource = dt;
                GridViewFiles.DataBind();
            }

        }
        
        protected string UploadFileToDB(FileUpload fUploadImg, int id_pages)
        {

            string fitems = string.Empty;
            int size_images = fUploadImg.PostedFile.ContentLength;

            if (fUploadImg.HasFile)
            {
                if (fitems == string.Empty) fitems = Guid.NewGuid().ToString();

                string type_images = fUploadImg.PostedFile.ContentType;
                byte[] fimages = new byte[size_images];
                fUploadImg.PostedFile.InputStream.Read(fimages, 0, size_images);
                int indexOfSlash = fUploadImg.PostedFile.FileName.LastIndexOf("\\") + 1;
                string name_images = fUploadImg.PostedFile.FileName.Substring(indexOfSlash);
                Images objImg = new Images();

                objImg.ImagesUpdate
                    (
                        fitems,
                        id_pages,
                        fimages,
                        name_images,
                        type_images,
                        size_images,
                        ""
                    );

            }
            return fitems;
        }

        protected void LinkButtonInsert_Click(object sender, EventArgs e)
        {

            //OnInserting="SqlDataSourceBaseText_Inserting"
            int id_pages = Convert.ToInt16(Request["id_pages"].ToString());


            JsonProps jsp = new JsonProps();

            GridViewRowCollection Rs = GridProps.Rows;
            foreach (GridViewRow R in Rs)
            {
                JProp pp = new JProp();
                string name = ((Label)R.FindControl("LabelName")).Text;
                string value = ((TextBox)R.FindControl("TextValue")).Text;
                pp.name = name;
                pp.value = value;
                jsp.Property.Add(pp);
            }

            property = (new JavaScriptSerializer()).Serialize(jsp);

            JsonImages jimg = new JsonImages();

            GridViewRowCollection FRs = GridViewFiles.Rows;
            foreach (GridViewRow FR in FRs)
            {
                JImg pp = new JImg();
                string name = ((TextBox)FR.FindControl("TextFileName")).Text;
                FileUpload FU = (FileUpload)FR.FindControl("FInsertUpload");
                pp.name = name;
                pp.items = UploadFileToDB(FU,id_pages);
                jimg.Images.Add(pp);
            }
            images_add = (new JavaScriptSerializer()).Serialize(jimg);

            string alt_images = "";
            items = Guid.NewGuid().ToString();

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

            SqlDataSourceBaseText.Insert();
            GridView1.DataBind();
        }

        protected void SqlDataSourceBaseText_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {

            int iNpp = 0;
            try
            {
                iNpp = Int32.Parse(TextBoxNpp_text.Text);
            }
            catch
            {
                iNpp = 0;
            }

            e.Cancel = false;
            try
            {
                //id_pages, description_text, header_text, base_text, date_text, items, have_img, visible_blok, prioritet_text, header_text
                e.Command.Parameters["@id_pages"].Value = Request["id_pages"];
                e.Command.Parameters["@description_text"].Value = TextBoxDescription_text.Text;//TextBoxDescription_text.Text;
                e.Command.Parameters["@header_text"].Value = TextBoxHeader_text.Text;
                e.Command.Parameters["@base_text"].Value = TextBoxBase_text.Text;
                e.Command.Parameters["@date_text"].Value = DateTime.Now.Date;
                e.Command.Parameters["@items"].Value = items;
                e.Command.Parameters["@have_img"].Value = have_img;
                e.Command.Parameters["@visible_blok"].Value = true;
                e.Command.Parameters["@npp"].Value = iNpp;
                e.Command.Parameters["@property"].Value = property;
                e.Command.Parameters["@images_add"].Value = images_add;
            }
            catch
            {
                //LabelError.Text = ex.Message;
                //LabelError.Visible = true;
                //e.Cancel = true;
            }
        }
    }
}