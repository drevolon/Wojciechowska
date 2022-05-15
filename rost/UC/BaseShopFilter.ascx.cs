using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace root.UC
{
    public partial class BaseShopFilter : System.Web.UI.UserControl
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

        protected void ButtonAccept_Click(object sender, EventArgs e)
        {
            string sfiltr = "";
            foreach (GridViewRow r in GridView1.Rows)
            {
                if (r.RowType == DataControlRowType.DataRow &&
                         (r.RowState == DataControlRowState.Normal || r.RowState == DataControlRowState.Alternate))
                {
                    CheckBox CB = (CheckBox)r.FindControl("CHBX");
                    DropDownList D = (DropDownList)r.FindControl("DDL");
                    if (CB.Checked)
                    {
                        sfiltr+= CB.Text + '\n';
                    }

                }
            }
            Session["FILTR"] = sfiltr;
            Response.Redirect(Request.RawUrl);
        }

        protected void ButtonClear_Click(object sender, EventArgs e)
        {
            Session["FILTR"] = "";
            Response.Redirect(Request.RawUrl);

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ButtonAccept_Click(sender, e);
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



                try
                {
                    string sfiltr = Session["FILTR"].ToString();
                    foreach (GridViewRow r in GridView1.Rows)
                    {
                        if (r.RowType == DataControlRowType.DataRow &&
                                 (r.RowState == DataControlRowState.Normal || r.RowState == DataControlRowState.Alternate))
                        {
                            CheckBox CB = (CheckBox)r.FindControl("CHBX");
                            DropDownList D = (DropDownList)r.FindControl("DDL");
                            if (sfiltr.IndexOf(CB.Text + '\n') >= 0)
                            {
                                CB.Checked = true;
                            }
                            else
                            {
                                CB.Checked = false;
                            }
                        }
                    }
                }
                catch
                { }
            }
        }

        protected void BindGrid(int type_news)
        {
            //object data = null;
            //int current_year = DateTime.Now.Year;

            //this.SqlDataSourceBaseText.SelectParameters[0].DefaultValue = PagingNews.ToString();
            //this.SqlDataSourceBaseText.SelectParameters[1].DefaultValue = type_news.ToString();
            //data = SqlDataSourceBaseText.Select(DataSourceSelectArguments.Empty);

            //GridView1.DataSource = data;
            //GridView1.DataBind();
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow &&
               (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
            {

                string tpFilter = ((Label)e.Row.FindControl("LabelYesNo")).Text;
                string GetList = ((Label)e.Row.FindControl("LabelList")).Text;
                CheckBox CB = (CheckBox)e.Row.FindControl("CHBX");
                DropDownList D = (DropDownList)e.Row.FindControl("DDL");

                if (tpFilter == "1")
                {
                    CB.Visible = true;
                    D.Visible = false;
                }
                else
                {
                    CB.Visible = true;
                    D.Visible = false;
                }

            }
            if ((e.Row.RowState & DataControlRowState.Edit) == DataControlRowState.Edit)
            {

            }
        }
    }

}