using MailKit.Net.Imap;
using MailKit.Net.Smtp;
using MailKit.Security;
using MimeKit;
using System;
using System.Security.Authentication;

namespace rost
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string SendEmail(string Sender, string Contact, string Message)
        {
            //try
            //{
            //    MailMessage mailMessage = new MailMessage();
            //    mailMessage.From = new MailAddress("info@войцеховская.рф");
            //    mailMessage.To.Add(new MailAddress("kigl@yandex.ru"));
            //    mailMessage.Subject = "Сообщение с сайта войцеховская.рф";
            //    mailMessage.IsBodyHtml = true;
            //    mailMessage.Body = "Отправитель: " + Sender + Environment.NewLine + "Контакт:    " + Contact + Environment.NewLine + "Сообщение: " + Message;
            //    SmtpClient client = new SmtpClient("37.140.192.98" );
            //    client.Credentials = new System.Net.NetworkCredential("info@войцеховская.рф", "emm-6HT-BcS-bTy");
            //    //client.EnableSsl = true;
            //    client.Send(mailMessage);
            //    return "Отправлено!";
            //}
            //catch (Exception ex)
            //{
            //    return "Ошибка отправки! "+ex.Message;
            //}

            try
            {
                if ((Sender == string.Empty) || (Contact == string.Empty))
                    return "Укажите \"Имя\" и \"Email/Phone\"";

                var mimeMessage = new MimeMessage();
                mimeMessage.From.Add(new MailboxAddress("home", "info@войцеховская.рф"));
                mimeMessage.To.Add(new MailboxAddress("sender", "sbq@list.ru"));
                mimeMessage.Subject = "Сообщение с сайта войцеховская.рф"; ;
                var bodyBuilder = new BodyBuilder
                {
                    TextBody = "Отправитель: " + Sender + Environment.NewLine + "Контакт:    " + Contact + Environment.NewLine + "Сообщение: " + Message
                };
                mimeMessage.Body = bodyBuilder.ToMessageBody();
                using (var client = new SmtpClient())
                {
                    //client.CheckCertificateRevocation = false;
                    client.ServerCertificateValidationCallback = (s, c, h, e) => true;
                    client.SslProtocols = SslProtocols.Ssl3 | SslProtocols.Tls | SslProtocols.Tls11 | SslProtocols.Tls12 | SslProtocols.Tls13;
                                        var uri = new Uri("smtps://xn--80adaltiyc2a1bj9i.xn--p1ai:465");
                                        client.Connect(uri);
                    //client.Connect("xn--80adaltiyc2a1bj9i.xn--p1ai", 465, SecureSocketOptions.None);
                    //client.AuthenticationMechanisms.Remove("XOAUTH2");
                    // Note: since we don't have an OAuth2 token, disable
                    // the XOAUTH2 authentication mechanism.
                    client.Authenticate("info@xn--80adaltiyc2a1bj9i.xn--p1ai", "13&J31ldz");
                    client.Send(mimeMessage);
                    client.Disconnect(true);
                    return "Отправлено!";
                }
            }
            catch (Exception ex)
            {
                return "Ошибка отправки! " + ex.Message;
            }

        }
        protected void MailSend_Click(object sender, EventArgs e)
        {
            MailSend.Text = SendEmail(Sender.Text, Contact.Text, TextMessage.Text);
        }

        protected void Otzyv_Click(object sender, EventArgs e)
        {
            Otzyv.Text = SendEmail(Sender1.Text, Contact1.Text, TextMessage1.Text);
        }
    }
}