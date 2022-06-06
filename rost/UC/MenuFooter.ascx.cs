using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rost.UC
{
    public partial class MenuFooter : System.Web.UI.UserControl
    {
        protected int _items;
        protected int _qtyCol;
        protected string _header_block;

        /// <summary>
        /// Тип новости, 1-новости главной страницы, 2-кадастровые и т.д.
        /// </summary>
        public int IdMenu
        {
            get { return _items; }
            set { _items = value; }
        }
        public int qtyCol
        {
            get { return _qtyCol; }
            set { _qtyCol = value; }
        }

        /// <summary>
        /// Кол-во новостей на странице
        /// </summary>


        protected void Page_Load(object sender, EventArgs e)
        {
            string HtmlText = "";
            if (!IsPostBack)
            {
                if (Request["id_menu"] != null && IdMenu == -1)
                {
                    IdMenu = Convert.ToInt16(Request["id_menu"].ToString());
                }
                SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["rostConnectionString"].ToString());
                Conn.Open();

                SqlCommand oCmd = new SqlCommand("select count(*) from Menus where isnull(id_parent,-1)=-1 and id_menu="+_items, Conn);

                int qtyMenuItems = int.Parse(oCmd.ExecuteScalar().ToString());
                int qtyInRow =(int)Math.Ceiling((double)qtyMenuItems / (double)qtyCol);

                if (qtyInRow > 0)
                {
                    DataTable dt = new DataTable();
                    oCmd = new SqlCommand("select p.id, p.name, p.id_parent, item_link, (select count(*) from Menus m where m.id_parent=p.id) HasChild from Menus p where id_menu=" + _items + " and isnull(id_parent,-1)=-1 order by npp", Conn);
                    dt.Load(oCmd.ExecuteReader());
                    int numRow = 0;
                    HtmlText += @" 
                      <div class=""col"">
                        <div class=""footer_begin_menu"">
                          <ul>";
                    foreach (DataRow dr in dt.Rows)
                    {
                        if (numRow > qtyInRow) numRow = 1; // конец заполнения колонки

                        if (numRow == 1) // смена колонки
                        {
                            HtmlText += @"
                          </ul>
                        </div>
                      </div>
                      <div class=""col"">
                        <div class=""footer_begin_menu"">
                          <ul>";
                            numRow = 1;
                        }

                        if (numRow == 0) // первая колонка
                        {
                            numRow = 1;
                        }

                        if (dr["HasChild"].ToString() == "0")
                        {
                            HtmlText += @"                                        <li class=""nav-item"">
                                            <a class=""footer_begin_menu_item"" href=""" + dr["item_link"].ToString() + @""">" + dr["name"].ToString() + @"</a>
                                        </li>
";
                        }
                        else
                        {
                            DataTable dtsm = new DataTable();
                            SqlCommand oCmdsm = new SqlCommand("select id, name, id_parent, item_link from Menus where id_parent=" + dr["id"].ToString(), Conn);
                            dtsm.Load(oCmdsm.ExecuteReader());
                            HtmlText += @"                                        <li class=""nav-item dropdown"">
                                            <a class=""footer_begin_menu_item dropdown-toggle""  role=""button"" data-bs-toggle=""dropdown"" aria-expanded=""false"" href=""" + dr["item_link"].ToString() + @""">" + dr["name"].ToString() + @"</a> 
        <ul class=""dropdown-menu"" aria-labelledby=""navbarDropdown"">
";
                            foreach (DataRow drsm in dtsm.Rows)
                            {
                                HtmlText += @"          <li><a class=""dropdown-item"" href=""" + drsm["item_link"].ToString() + @""">" + drsm["name"].ToString() + @"</a></li>
                                ";
                            }
                            HtmlText += "                              </ul>";

                        }
                        numRow++;
                    }
                    HtmlText += @"
                          </ul>
                        </div>
                      </div>
";

                }

                Conn.Close();
                ContextMenu.Text = HtmlText;
            }
            else
            {
            }
        }
    }
}