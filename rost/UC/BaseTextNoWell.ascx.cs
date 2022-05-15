using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace root.UC
{
    public partial class BaseTextNoWell : System.Web.UI.UserControl
    {
        protected int _items, _count_rom, _width_block, rowsCount = 0, gridviewCountRow;
        protected string _header_block;
        public string overlay = "", modal_form = "", modal_close = "", go = "";
        private bool _showDate = true, _showHeader = true, _showBorder = true;

        /// <summary>
        /// Тип новости, 1-новости главной страницы, 2-кадастровые и т.д.
        /// </summary>
        public int TypeNews
        {
            get { return _items; }
            set { _items = value; }
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["id_pages"] != null && TypeNews == -1)
                {
                    TypeNews = Convert.ToInt16(Request["id_pages"].ToString());
                }

                BindGrid(TypeNews);
            }
        }

        protected void BindGrid(int type_news)
        {
            object data = null;
            int current_year = DateTime.Now.Year;

            this.SqlDataSourceBaseText.SelectParameters[0].DefaultValue = PagingNews.ToString();
            this.SqlDataSourceBaseText.SelectParameters[1].DefaultValue = type_news.ToString();
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
                String w = "60";
                String h = "55";

                String type_img_big = "image_bigCA";
                String items = ((Label)e.Row.FindControl("LabelItemItems")).Text;

                string id_text = ((Label)e.Row.FindControl("LabelId_text")).Text;

                //((HyperLink)e.Row.FindControl("HyperLinkImg")).NavigateUrl = "~/desc.aspx?id_text=" + id_text;
                ((HyperLink)e.Row.FindControl("HyperLinkText")).NavigateUrl = "~/desc.aspx?id_text=" + id_text;

                if (Request["masterPage"] == "big")
                {
                    ((HyperLink)e.Row.FindControl("HyperLinkText")).NavigateUrl = "~/desc.aspx?id_text=" + id_text + "&masterPage=big"; ;
                    
                }

                //if (((Label)e.Row.FindControl("LabelItemHave_img")).Text == "True")
                //{
                //    ((Image)e.Row.FindControl("ImageItem")).Visible = true;
                //    ((Image)e.Row.FindControl("ImageItem")).ImageUrl = "./../photoDB.ashx?type_img=" + type_img + "&items=" + items;
                //    ((Image)e.Row.FindControl("ImageItem")).ImageUrl = "./../photoDB.ashx?type_img=" + type_img + "&items=" + items;
                //}
                //else
                //{
                //    ((System.Web.UI.WebControls.Image)e.Row.FindControl("ImageItem")).Visible = false;
                //}

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
            if ((e.Row.RowState & DataControlRowState.Edit) == DataControlRowState.Edit)
            {

            }
        }
    }
}