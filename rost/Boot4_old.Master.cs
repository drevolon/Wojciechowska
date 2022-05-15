using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace root
{
    public partial class Boot4 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ClassShopParam pp = new ClassShopParam();
            //string[] lpp = pp.Destination.Split(',');
            //string selectDest = "<select name=\"dest\">";
            //foreach (string p in lpp)
            //{
            //    selectDest += "<option value=\"" + p + "\">" + p + "</option>";
            //}
            //selectDest += "</select>";

            //DestCardHidden.Value = selectDest;

        }
        protected void SendMessageToCheckEmail(string email, string email_link)
        {
            using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["shop_healthConnectionString"].ConnectionString))
            {

                //SqlCommand com = new SqlCommand("select SMTPServer,SMTPServerPort,SMTPFrom,SMTPUSer,SMTPPass,SMTPCopyMessage from ShopNotice where id=1", MyConnection);
                //try
                //{
                //    MyConnection.Open();
                //    SqlDataReader NoticeParam = com.ExecuteReader();
                //    if (NoticeParam.HasRows)
                //    {
                //        NoticeParam.Read();
                //        string SMTPServer = NoticeParam["SMTPServer"].ToString();
                //        string SMTPServerPort = NoticeParam["SMTPServerPort"].ToString();
                //        string SMTPFrom = NoticeParam["SMTPFrom"].ToString();
                //        string SMTPUSer = NoticeParam["SMTPUSer"].ToString();
                //        string SMTPPass = NoticeParam["SMTPPass"].ToString();
                //        string SMTPCopyMessage = NoticeParam["SMTPCopyMessage"].ToString();


                //        // Отправка на почту заказа
                //        MailAddress from = new MailAddress(SMTPFrom, "Pro Healthy Lady");
                //        // кому отправляем
                //        MailAddress to = new MailAddress(email);
                //        // создаем объект сообщения
                //        MailMessage m = new MailMessage(from, to);
                //        // тема письма
                //        m.Subject = "Подписка на новости сайта Pro Healthy Leady";
                //        // текст письма
                //        m.Body = @"Для подтверждения адреса перейдите по ссылке:<br/>
                //            <a href=""" + email_link + @""">" + email_link + "</a>";

                //        // письмо представляет код html
                //        m.IsBodyHtml = true;
                //        SmtpClient client = new SmtpClient();
                //        client.Host = SMTPServer;
                //        client.Port = Convert.ToInt16(SMTPServerPort); // Обратите внимание что порт 587
                //        client.EnableSsl = true;
                //        client.Credentials = new NetworkCredential(SMTPUSer, SMTPPass); // Ваши логин и пароль
                //        client.Send(m);
                //    }
                //}
                //catch { }
            }

        }



        protected void SubScribeButt_Click(object sender, EventArgs e)
        {
            //string eml = SubScribeText.Text;
            //bool correct = true;
            //if (eml.Split('@').Length!=2)
            //{
            //    correct = false;
            //}
            //else
            //{
            //    if (eml.Split('@')[1].Split('.').Length<1)
            //    {
            //        correct = false;
            //    }
            //}
            //if (!correct)
            //{
            //    resSubscribe.Text = "Некорректный адрес email";
            //    resSubscribe.ForeColor = System.Drawing.Color.Red;
            //}
            //else
            //{
            //    ClassSubscribe sbs = new ClassSubscribe();
            //    string GUID = sbs.NewEmailSubscribe(eml);
            //    if (GUID == "")
            //    {
            //        resSubscribe.Text = "данный Email уже подписан";
            //        resSubscribe.ForeColor = System.Drawing.Color.FromArgb(0xe5b3fd);
            //    }
            //    else
            //    {
            //        string s = Request.Url.OriginalString.Replace(Request.FilePath,"");
            //        string elink = s+"/CheckEmail.aspx?key=" + GUID;
            //        SendMessageToCheckEmail(eml, elink);
            //        resSubscribe.Text = "Отправлен запрос для подтверждения email";
            //        resSubscribe.ForeColor = System.Drawing.Color.FromArgb(0xe5b3fd);
            //    }
            //}
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            //string find = TextBoxSearch.Text;
            //if (find.Trim()!="")
            //{
            //    Response.Redirect("~/shop.aspx?find=" + find);
            //}
        }
        protected void ButtonSearch1_Click(object sender, EventArgs e)
        {
            //string find = TextBox1.Text;
            //if (find.Trim() != "")
            //{
            //    Response.Redirect("~/shop.aspx?find=" + find);
            //}
        }
    }
}