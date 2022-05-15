using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace shop_health.App_Code
{
    public class ClassSubscribe
    {
        public string NewEmailSubscribe(string email)
        {
            string GUID = Guid.NewGuid().ToString();
            using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["shop_healthConnectionString"].ConnectionString))
            {

                SqlCommand com = new SqlCommand(@"select id, ""key"", result from Subscribe where Upper(email)='" + email.ToUpper()+"'", MyConnection);
                try
                {
                    MyConnection.Open();
                    SqlDataReader NoticeParam = com.ExecuteReader();
                    if (NoticeParam.HasRows)
                    {
                        NoticeParam.Read();
                        string res = NoticeParam["result"].ToString();
                        if (res=="Подтвержден")
                        {
                            GUID = "";
                        }
                        else
                        {
                            GUID= NoticeParam["key"].ToString();
                        }

                    }
                    else
                    {
                        NoticeParam.Close();
                        SqlCommand comIns = new SqlCommand(@"insert into Subscribe (email,""key"",result) values ('" + email+"','"+GUID+"','')", MyConnection);
                        comIns.ExecuteNonQuery();
                    }
                    MyConnection.Close();
                }
                catch { }
            }
            return GUID;
        }
        public bool CheckEmail(string GUID)
        {
            bool isChecked = false;
            using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["shop_healthConnectionString"].ConnectionString))
            {

                SqlCommand com = new SqlCommand(@"update Subscribe set result='Подтвержден' where ""key""='" + GUID + "'", MyConnection);
                try
                {
                    MyConnection.Open();
                    int colRow = com.ExecuteNonQuery();
                    if (colRow > 0) isChecked = true;
                    MyConnection.Close();
                }
                catch { }
            }
            return isChecked;

        }
    }
}