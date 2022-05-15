using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace rost.App_Code 
{
    public class ClassShopParam
    {
        public string SMTPServer;
        public string SMTPServerPort;
        public string SMTPFrom;
        public string SMTPUSer;
        public string SMTPPass;
        public string SMTPCopyMessage;
        public string Destination;
        public ClassShopParam()
        {
            using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["shop_healthConnectionString"].ConnectionString))
            {

                SqlCommand com = new SqlCommand("select SMTPServer,SMTPServerPort,SMTPFrom,SMTPUSer,SMTPPass,SMTPCopyMessage,Destination from ShopNotice where id=1", MyConnection);
                try
                {
                    MyConnection.Open();
                    SqlDataReader NoticeParam = com.ExecuteReader();
                    if (NoticeParam.HasRows)
                    {
                        NoticeParam.Read();
                        SMTPServer = NoticeParam["SMTPServer"].ToString();
                        SMTPServerPort = NoticeParam["SMTPServerPort"].ToString();
                        SMTPFrom = NoticeParam["SMTPFrom"].ToString();
                        SMTPUSer = NoticeParam["SMTPUSer"].ToString();
                        SMTPPass = NoticeParam["SMTPPass"].ToString();
                        SMTPCopyMessage = NoticeParam["SMTPCopyMessage"].ToString();
                        Destination = NoticeParam["Destination"].ToString();

                    }

                }
                catch
                {
                    SMTPServer = "";
                    SMTPServerPort = "";
                    SMTPFrom = "";
                    SMTPUSer = "";
                    SMTPPass = "";
                    SMTPCopyMessage = "";
                    Destination = "";
                }
            }
        }
    }
}