using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace root.UC
{
    public partial class BaseGallery2 : System.Web.UI.UserControl
    {
        protected int _items, _count_rom, _width_block, rowsCount = 0, gridviewCountRow;
        protected string _header_block;
        public string overlay = "", modal_form = "", modal_close = "", go = "", _posPhoto = "";
        private bool _showDate = true, _showHeader = true, _showBorder = true;

        /// <summary>
        /// Тип новости, 1-новости главной страницы, 2-кадастровые и т.д.
        /// </summary>
        public int TypeNews
        {
            get { return _items; }
            set { _items = value; }
        }

        protected void DataListGallery_name_SelectedIndexChanged(object sender, EventArgs e)
        {

            int idx = DataListGallery_name.SelectedIndex;
            Label lbl = (Label)DataListGallery_name.Items[idx].FindControl("id_gallery_nameLabel");
            int id = Convert.ToInt32(DataListGallery_name.SelectedValue);

            string id_gallery= lbl.Text;
            BindGrid(id_gallery);
        }



        /// <summary>
        /// Кол-во новостей на странице
        /// </summary>
        public int PagingNews
        {
            get { return _count_rom; }
            set { _count_rom = value; }
        }

        /// <summary>
        /// Ширина блока в px
        /// </summary>
        public int WidthNews
        {
            get { return _width_block; }
            set { _width_block = value; }
        }
        /// <summary>
        /// Заголовок новостного блока
        /// </summary>
        public string HeaderNews
        {
            get { return _header_block; }
            set { _header_block = value; }
        }
        /// <summary>
        /// Показ даты
        /// </summary>
        public bool ShowDate
        {
            get { return _showDate; }
            set { _showDate = value; }
        }
        /// <summary>
        /// Показ даты
        /// </summary>
        public bool ShowHeader
        {
            get { return _showHeader; }
            set { _showHeader = value; }
        }
        /// <summary>
        /// Показать рамку
        /// </summary>
        public bool ShowBorder
        {
            get { return _showBorder; }
            set { _showBorder = value; }
        }
        /// <summary>
        /// Позиция фото
        /// </summary>
        public string PosPhoto
        {
            get
            {
                switch (_posPhoto)
                {
                    case "top":
                        {
                            _posPhoto = "media-top";
                            break;
                        }
                    case "left":
                        {
                            _posPhoto = "media-left";
                            break;
                        }
                }
                return _posPhoto;
            }
            set
            {
                _posPhoto = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["id_pages"] != null && TypeNews == -1)
                {
                    TypeNews = Convert.ToInt16(Request["id_pages"].ToString());
                }

                //BindGrid(TypeNews);

                // LabelHeader.Text = HeaderNews;

                //gridviewCountRow = GridView1.Rows.Count;
            }
        }

        protected void BindGrid(string id)
        {
            object data = null;

            this.SqlDataSourceGallery.SelectParameters[0].DefaultValue = id;
            data = SqlDataSourceGallery.Select(DataSourceSelectArguments.Empty);

            Datalist1.DataSource = data;
            Datalist1.DataBind();
        }
        
        protected void Datalist1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
               (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                //String type_img = "image_low";
                //String type_img = "news_id";
                String type_img = "news";
                String type_img_big = "image_big";
                String id_images = ((Label)e.Item.FindControl("LabelItemId_images")).Text;
                String items = ((Label)e.Item.FindControl("LabelItemItems")).Text;
                //int w = 152;
                // int h = 214;
                //((Encosia.HighslideImage)e.Item.FindControl("ImageCatalog")).ImageUrl = "./../photoDB.ashx?type_img=" + type_img + "&id=" + id_images;
                ((Encosia.HighslideImage)e.Item.FindControl("ImageCatalog")).ImageUrl = "./../photoDB.ashx?type_img=" + type_img + "&items=" + items;
                ((Encosia.HighslideImage)e.Item.FindControl("ImageCatalog")).FullImageURL = "photoDB.ashx?type_img=" + type_img_big + "&items=" + items;
            }
        }

    }
}