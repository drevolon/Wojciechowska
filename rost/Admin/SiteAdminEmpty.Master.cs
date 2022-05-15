//using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rost.Admin
{
    public partial class SiteAdminEmpty : System.Web.UI.MasterPage
    {
        protected string navigate_link;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (Request["id_pages"] != null && Request["id_pages"] != "-1")
                //{
                    //DropDownListMenuAdmin.SelectedValue = Request["id_pages"];
               // }
                //else
                //{
                    //DropDownListMenuAdmin.SelectedIndex = 0;
                //}

               // string user_name = "";// Context.User.Identity.GetUserName();
                //if (user_name != "admin@mail.ru")
                //{
                //    Response.Redirect("./../Account/Login?ReturnUrl=%2FAdmin%2Fadd_items");
                //}

            }
        }
        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }

        protected void DropDownListMenuAdmin_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (DropDownListMenuAdmin.SelectedValue != "-1")
            //{
            //    string name_pages = DropDownListMenuAdmin.SelectedItem.ToString();
            //    string id_pages = DropDownListMenuAdmin.SelectedValue;

            //    if (name_pages=="Фотогалерея") navigate_link = "add_items_gallery.aspx?id_pages=" + id_pages + "&name_pages=" + name_pages; else

            //    navigate_link = "add_items.aspx?id_pages=" + id_pages + "&name_pages=" + name_pages;
            //    Response.Redirect(navigate_link);
            //}
            //else
            //{
            //    navigate_link = "default_admin.aspx";
            //    Response.Redirect(navigate_link);
            //}
        }

        protected void DropDownListMenuAdmin_TextChanged(object sender, EventArgs e)
        {
            //string pages_id = DropDownListMenuAdmin.SelectedValue.ToString();
            //string name_pages = DropDownListMenuAdmin.SelectedItem.ToString();
            //string str = "add_items.aspx?id_pages=" + pages_id+ "&name_pages="+ name_pages;
            //Response.Redirect(str);
        }
    }
}