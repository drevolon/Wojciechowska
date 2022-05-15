﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rost.UC
{
    public partial class UniversalTextFind : System.Web.UI.UserControl
    {
        protected int _items, _count_rom, _width_block, rowsCount = 0, gridviewCountRow, _count_records = 0;
        protected string _header_block, _find;
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


        /// <summary>
        /// Кол-во новостей на странице
        /// </summary>
        public int PagingNews
        {
            get { return _count_rom; }
            set { _count_rom = value; }
        }


        /// <summary>
        /// Кол-во новостей на странице
        /// </summary>
        public int CountNews
        {
            get { return _count_records; }
            set { _count_records = value; }
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

        public string FindNews
        {
            get { return _find; }
            set { _find = value; }
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
                if (Request["mask"] != null )
                {
                    FindNews = Request["mask"].ToString();
                }
                //LHeader.Text = HeaderNews;
                BindGrid(TypeNews, FindNews);
                //HyperLinkHead.NavigateUrl = "~/News.aspx?id_pages=" + TypeNews;


                // LabelHeader.Text = HeaderNews;

                //gridviewCountRow = GridView1.Rows.Count;
            }
            // GridView1.Width = WidthNews;
        }

        protected void BindGrid(int type_news, string findNews)
        {
            object data = null;
            int current_year = DateTime.Now.Year;
            //int begin_year = current_year - 3;
            //int end_year = current_year + 1;

            //this.SqlDataSourceBaseText.SelectParameters[0].DefaultValue = "01.01." + begin_year;
            this.SqlDataSourceBaseText.SelectParameters[0].DefaultValue = type_news.ToString();
            this.SqlDataSourceBaseText.SelectParameters[1].DefaultValue = findNews;
            data = SqlDataSourceBaseText.Select(DataSourceSelectArguments.Empty);

            //GridView1.DataSource = data;
            //GridView1.DataBind();
            Replist1.DataSource = data;
            Replist1.DataBind();
        }
        protected void Replist1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
               (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                String items = ((Label)e.Item.FindControl("LabelItemItems")).Text;
                String type_img = "news_id";
                String id_images = ((Label)e.Item.FindControl("LabelItemId_images")).Text;
                string id_text = ((Label)e.Item.FindControl("LabelId_text")).Text;
                string base_text = ((Label)e.Item.FindControl("LabelItemBase_text")).Text;


                if (base_text != "")
                {
                    ((HyperLink)e.Item.FindControl("HyperLinkImg")).NavigateUrl = "~/desc.aspx?id_text=" + id_text + "&items=" + items;
                    ((HyperLink)e.Item.FindControl("HyperLinkText")).NavigateUrl = "~/desc.aspx?id_text=" + id_text + "&items=" + items;
                }

                if (Request["masterPage"] == "big")
                {
                    ((HyperLink)e.Item.FindControl("HyperLinkImg")).NavigateUrl = "~/desc.aspx?id_text=" + id_text + "&items=" + items + "&masterPage=big";
                    //                    ((HyperLink)e.Item.FindControl("HyperLinkText")).NavigateUrl = "~/desc.aspx?id_text=" + id_text + "&items=" + items + "&masterPage=big";
                }


                //((Panel)e.Item.FindControl("PanelInfoBlock")).CssClass = PosPhoto;



                if (((Label)e.Item.FindControl("LabelItemHave_img")).Text == "True")
                {
                    //((Image)e.Row.FindControl("ImageCatalog")).ImageUrl = "./../photoDB.ashx?type_img=" + type_img + "&items=" + items + "&w=" + w + "&h=" + h;

                    ((Image)e.Item.FindControl("ImageItem")).Visible = true;
                    //                    ((Image)e.Item.FindControl("ImageItem")).ImageUrl = "./../photoDB.ashx?type_img=" + type_img + "&id=" + id_images;
                    //((Image)e.Row.FindControl("ImageItem")).FullImageURL = "photoDB.ashx?type_img=" + type_img_big + "&items=" + items;
                    ((Image)e.Item.FindControl("ImageItem")).ImageUrl = "./../photoDB.ashx?type_img=image_lowCA&items=" + items + "&w=299&h=168";
                }
                else
                {
                    ((System.Web.UI.WebControls.Image)e.Item.FindControl("ImageItem")).Visible = false;
                }


            }

        }
    }
}