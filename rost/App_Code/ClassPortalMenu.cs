using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace rost.App_Code
{
    class NameComparer : IComparer<ClassPortalMenu>
    {
        public int Compare(ClassPortalMenu x, ClassPortalMenu y)
        {
            if (x.npp > y.npp)
            {
                return 1;
            }
            else if (x.npp < y.npp)
            {
                return -1;
            }
            return 0;
        }
    }

    class ClassPortalMenu
    {
        public int id_menu;
        public int id;
        public int id_parent;
        public int id_pages;
        public string category;
        public int npp;
        public string Text;
        public List<ClassPortalMenu> SubMenus;

        public ClassPortalMenu()
        {
            SubMenus = new List<ClassPortalMenu>();
        }
        public ClassPortalMenu NewChildObj()
        {
            ClassPortalMenu newObj = new ClassPortalMenu();
            SubMenus.Add(newObj);
            return newObj;
        }

        public ClassPortalMenu FindByID(int id_node)
        {
            ClassPortalMenu Result = null;

            if (id == id_node)
            {
                Result=this;
            }
            else
            {
                foreach (ClassPortalMenu ChildObj in SubMenus)
                {
                    if (ChildObj.id == id_node)
                    {
                        Result=ChildObj;
                        break;
                    }
                    else
                    {
                        Result = ChildObj.FindByID(id_node);
                    }
                }
            }
            return Result;
        }

        public void MenusSort(ClassPortalMenu mnu)
        {
            foreach (ClassPortalMenu smnu in mnu.SubMenus)
            {
                MenusSort(smnu);
            }
            NameComparer nc = new NameComparer();
            mnu.SubMenus.Sort(nc);
        }

        public string UpdateTextMenu(ClassPortalMenu mnu)
        {
            string TextResult = "";
            foreach (ClassPortalMenu smnu in mnu.SubMenus)
            {
                if (smnu.id_pages==0)
                {
                    TextResult = TextResult +
@"     <li class=""dropdown"">
          <a href = ""#"" class=""dropdown-toggle"" data-toggle=""dropdown"">" + smnu.Text + @"<b class=""caret""></b></a>
          <ul class=""dropdown-menu"">
            "+ UpdateTextMenu(smnu)+@"
          </ul>
       </li>";
                }
                else
                {
                    TextResult = TextResult+ "<li><a href = 'Pages.aspx?id_pages=" +smnu.id_pages.ToString()+"&name_pages="+smnu.Text+"'>"+smnu.Text+"</a></li>"+'\n';
                }
            }
            return TextResult;
        }

        public string UpdateTextMenu(ClassPortalMenu mnu, string type_page)
        {
            string TextResult = "";
            foreach (ClassPortalMenu smnu in mnu.SubMenus)
            {
                if (smnu.id_pages == 0)
                {
                    TextResult = TextResult +
@"     <li class=""dropdown"">
          <a href = ""#"" class=""dropdown-toggle"" data-toggle=""dropdown"">" + smnu.Text + @"<b class=""caret""></b></a>
          <ul class=""dropdown-menu"">
            " + UpdateTextMenu(smnu, type_page) + @"
          </ul>
       </li>";
                }
                else
                {
                    //Временная строка - жесткая привязка раздела Библиотека

                    if (smnu.Text == "Библиотека (Студенту)" || smnu.id_pages.ToString() == "46")

                    {
                        TextResult = TextResult + "<li><a href = 'AccessLimited/Library.aspx?id_pages=" + smnu.id_pages.ToString() + "&name_pages=" + smnu.Text + "'>" + smnu.Text + "</a></li>" + '\n';
                    }
                    else
                    {
                        //Основная строка ссылки меню
                        TextResult = TextResult + "<li><a href = 'Pages.aspx?id_pages=" + smnu.id_pages.ToString() + "&name_pages=" + smnu.Text + "&masterPage=" + type_page + "'>" + smnu.Text + "</a></li>" + '\n';
                    }


                }
            }

            return TextResult;
        }


        public string GetTextMenu(int id_menu)
        {
            string TextMenu = "";

            using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["rostConnectionString"].ConnectionString))
            {

                SqlCommand com = new SqlCommand(@"WITH items AS (
    SELECT id, id_parent, npp , name, id_pages
    , 0 AS Level
    , CAST((CONVERT(NVARCHAR(50),id) + '.') AS VARCHAR(2000)) AS Path
    FROM Menus
    WHERE id_parent is null and id_menu = 1

    UNION ALL

    SELECT i.id, i.id_parent, i.npp, i.name , i.id_pages
    , Level + 1
    , CAST((Path + CONVERT(NVARCHAR(50),i.id)+ '.') AS VARCHAR(2000))
    FROM Menus i
    INNER JOIN items itms ON (itms.id = i.id_parent)
    WHERE i.id_menu = 1
)
select po.id,isnull(po.id_parent,0) id_parent,isnull(po.npp,0) npp,po.name,po.Level,po.Path, isnull(po.id_pages,0) id_pages from items po order by po.path, po.npp", MyConnection);
                com.CommandType = CommandType.Text;
                try
                {
                    MyConnection.Open();
                    SqlDataReader reader = com.ExecuteReader(CommandBehavior.CloseConnection);
                    while (reader.Read())
                    {
                        int id = Convert.ToInt16(reader["id"]);
                        int id_parent = Convert.ToInt16(reader["id_parent"]);
                        int id_pages = Convert.ToInt16(reader["id_pages"]);
                        int npp = Convert.ToInt16(reader["npp"]);
                        string name_text = reader["name"].ToString();
                        if (npp > 0)
                        {
                            ClassPortalMenu ch = new ClassPortalMenu();
                            ch.id = id;
                            ch.id_pages = id_pages;
                            ch.id_menu = id_menu;
                            ch.id_parent = id_parent;
                            ch.npp = npp;
                            ch.Text = name_text;
                            ch.id = id;

                            ClassPortalMenu parnt = null;
                            if (id_parent != 0)
                            {
                                parnt = FindByID(id_parent);
                            }
                            else
                            {
                                parnt = this;
                            }

                            if (parnt != null)
                            {
                                parnt.SubMenus.Add(ch);
                            }

                            using (var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["rostConnectionString"].ConnectionString))
                            {
                                var sqlCmd = new SqlCommand(@"select id, isnull(menu_number,0) menu_number, isnull(menu_npp,0) menu_npp, name_pages, id_pages  from pages where menu_number = @id_menu", sqlConn);
                                sqlCmd.CommandType = CommandType.Text;
                                sqlCmd.Parameters.AddWithValue("@id_menu", id);
                                try
                                {
                                    sqlConn.Open();
                                    SqlDataReader readerData = sqlCmd.ExecuteReader(CommandBehavior.CloseConnection);
                                    while (readerData.Read())
                                    {
                                        int dnpp = Convert.ToInt16(readerData["menu_npp"]);
                                        if (dnpp > 0)
                                        {
                                            ClassPortalMenu chNode = ch.NewChildObj();
                                            chNode.id = Convert.ToInt16(readerData["id"]);
                                            chNode.id_parent = id;
                                            chNode.id_menu = id_menu;
                                            chNode.id_pages = Convert.ToInt16(readerData["id_pages"]);
                                            chNode.npp = dnpp;
                                            chNode.Text = readerData["name_pages"].ToString();
                                        }
                                    }
                                    sqlConn.Close();
                                }
                                catch
                                {
                                }
                            }
                        }
                    }
                }
                catch
                { }

                MenusSort(this);

                TextMenu = "<ul class=\"nav navbar-nav\">" + UpdateTextMenu(this) + "</ul>";


                return TextMenu;

            }
        }


        public string GetTextMenu(int id_menu, string type_page)
        {
            string TextMenu = "";

            using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["rostConnectionString"].ConnectionString))
            {

                SqlCommand com = new SqlCommand(@"WITH items AS (
                    SELECT id, id_parent, npp , name, id_pages
                    , 0 AS Level
                    , CAST((CONVERT(NVARCHAR(50),id) + '.') AS VARCHAR(2000)) AS Path
                    FROM Menus
                    WHERE id_parent is null and id_menu = 1

                    UNION ALL

                    SELECT i.id, i.id_parent, i.npp, i.name , i.id_pages
                    , Level + 1
                    , CAST((Path + CONVERT(NVARCHAR(50),i.id)+ '.') AS VARCHAR(2000))
                    FROM Menus i
                    INNER JOIN items itms ON (itms.id = i.id_parent)
                    WHERE i.id_menu = 1
                )
                select po.id,isnull(po.id_parent,0) id_parent,isnull(po.npp,0) npp,po.name,po.Level,po.Path, isnull(po.id_pages,0) id_pages from items po order by po.path, po.npp", MyConnection);
                com.CommandType = CommandType.Text;
                try
                {
                    MyConnection.Open();
                    SqlDataReader reader = com.ExecuteReader(CommandBehavior.CloseConnection);
                    while (reader.Read())
                    {
                        int id = Convert.ToInt16(reader["id"]);
                        int id_parent = Convert.ToInt16(reader["id_parent"]);
                        int id_pages = Convert.ToInt16(reader["id_pages"]);
                        int npp = Convert.ToInt16(reader["npp"]);
                        string name_text = reader["name"].ToString();
                        if (npp > 0)
                        {
                            ClassPortalMenu ch = new ClassPortalMenu();
                            ch.id = id;
                            ch.id_pages = id_pages;
                            ch.id_menu = id_menu;
                            ch.id_parent = id_parent;
                            ch.npp = npp;
                            ch.Text = name_text;
                            ch.id = id;

                            ClassPortalMenu parnt = null;
                            if (id_parent != 0)
                            {
                                parnt = FindByID(id_parent);
                            }
                            else
                            {
                                parnt = this;
                            }

                            if (parnt != null)
                            {
                                parnt.SubMenus.Add(ch);
                            }

                            using (var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["rostConnectionString"].ConnectionString))
                            {
                                var sqlCmd = new SqlCommand(@"select id, isnull(menu_number,0) menu_number, isnull(menu_npp,0) menu_npp, name_pages, id_pages  from pages where menu_number = @id_menu", sqlConn);
                                sqlCmd.CommandType = CommandType.Text;
                                sqlCmd.Parameters.AddWithValue("@id_menu", id);
                                try
                                {
                                    sqlConn.Open();
                                    SqlDataReader readerData = sqlCmd.ExecuteReader(CommandBehavior.CloseConnection);
                                    while (readerData.Read())
                                    {
                                        int dnpp = Convert.ToInt16(readerData["menu_npp"]);
                                        if (dnpp > 0)
                                        {
                                            ClassPortalMenu chNode = ch.NewChildObj();
                                            chNode.id = Convert.ToInt16(readerData["id"]);
                                            chNode.id_parent = id;
                                            chNode.id_menu = id_menu;
                                            chNode.id_pages = Convert.ToInt16(readerData["id_pages"]);
                                            chNode.npp = dnpp;
                                            chNode.Text = readerData["name_pages"].ToString();
                                        }
                                    }
                                    sqlConn.Close();
                                }
                                catch
                                {
                                }
                            }
                        }
                    }
                }
                catch
                { }

                MenusSort(this);

                TextMenu = "<ul class=\"nav navbar-nav\">" + UpdateTextMenu(this, type_page) + "</ul>";


                return TextMenu;

            }
        }

        public string CreateMenuCategory()
        {
            string TextMenu = "";

            using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["rostConnectionString"].ConnectionString))
            {

                SqlCommand com = new SqlCommand("SELECT DISTINCT Category FROM dbo.ShopData", MyConnection);
                try
                {
                    MyConnection.Open();
                    SqlDataReader readerData = com.ExecuteReader(CommandBehavior.CloseConnection);
                    while (readerData.Read())
                    {
                        TextMenu += @"<a href= ""Pages.aspx?id_pages=99&cat="+readerData["Category"]+@""" class=""list-group-item"">" + readerData["Category"].ToString() + "</a>"+'\r'+'\n';
                    }
                }
                catch
                { }
            }
            return TextMenu;
        }
    }
}
