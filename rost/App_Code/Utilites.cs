using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;

namespace rost.App_Code
{
    class Utilites
    {
        string SMTPFrom = "robot@rostot.ru";
        string SMTPTo = "sbq@list.ru";//"zelenand@outlook.com";//
        string SMTPServer = "mail.hosting.reg.ru";//"webmail.bibicar59.ru";
        //string SMTPServerPort = "25"; 587 

        string SMTPServerPort = "587";

        string SMTPUSer = "robot@rostot.ru";
        string SMTPPass = "Aa1234Fh";

        public string AddRequest(string _type, string clientName, string clientContact, string clientComments)
        {
            string result = "";
            if ((clientName.Trim() != "") && (clientContact.Trim() != ""))
            {
                using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["rostConnectionString"].ConnectionString))
                {
                    MyConnection.Open();
                    SqlCommand com = new SqlCommand("Insert into Requests (DateReq,TypeReq,isActual,ClientName,ContactInfo,ClientComments,PersonalData,CallBack) values (getdate(),@TypeReq,1,@ClientName,@ContactInfo,@ClientComments,1,1)", MyConnection);
                    try
                    {
                        com.Parameters.AddWithValue("TypeReq", _type);
                        com.Parameters.AddWithValue("ClientName", clientName);
                        com.Parameters.AddWithValue("ContactInfo", clientContact);
                        com.Parameters.AddWithValue("ClientComments", clientComments);
                        com.ExecuteNonQuery();
                        result = "";
                        // Отправка на почту заказа
                        MailAddress from = new MailAddress(SMTPFrom, "ROST");
                        // кому отправляем
                        MailAddress to = new MailAddress(SMTPTo);
                        // создаем объект сообщения
                        MailMessage m = new MailMessage(from, to);
                        // тема письма
                        _type = _type.Substring(0, _type.Length - 1) + "у";
                        m.Subject = "Заявка на " + _type + " от " + DateTime.Now.Date.ToString("dd.MM.yyyy");
                        // текст письма
                        m.Body = " <h2>Заявка на " + _type + " от " + DateTime.Now.Date.ToString("dd.MM.yyyy") + @" </h2>
                            <hr>
                            <h4>Клиент: " + clientName + @"</h4>
                            <h4>Контакт: " + clientContact + @"</h4>
                            <h4>Комментарий: " + clientComments + @" </h4> <hr> ";
                        // письмо представляет код html
                        m.IsBodyHtml = true;
                        SmtpClient client = new SmtpClient();
                        client.Host = SMTPServer;
                        client.Port = Convert.ToInt16(SMTPServerPort); // Обратите внимание что порт 587
                        client.EnableSsl = false;
                        client.Credentials = new NetworkCredential(SMTPUSer, SMTPPass); // Ваши логин и пароль
                        client.Send(m);

                    }
                    catch (Exception ex)
                    {
                        result = $"Ошибка добавления. Ошибка: {ex.Message}";
                    }
                    MyConnection.Close();
                }
            }
            else
            {
                result = "Укажите Ваше имя и контактные данные! ";
            }
            return result;

        }
    }
}
