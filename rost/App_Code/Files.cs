using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;

namespace rost.App_Code
{
    public class Files
    {
        public Files()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public void FilesInsert
            (

                String fileNames,
                String fileGUIDNames,
                int fileLength,
                String filePath,
                String fileType,
                String fileDate,
                String fileComments,
                String items


            )
        {
            ConnectionStringSettings settings;
            settings = ConfigurationManager.ConnectionStrings["rostConnectionString"];

            SqlConnection myConnection = new SqlConnection(settings.ToString());
            SqlCommand myCommand = new SqlCommand("FilesInsert", myConnection);

            myCommand.CommandType = CommandType.StoredProcedure;


            SqlParameter parameterfileNames = new SqlParameter("@fileNames", SqlDbType.NVarChar, 255);
            parameterfileNames.Value = fileNames;
            myCommand.Parameters.Add(parameterfileNames);

            SqlParameter parameterfileGUIDNames = new SqlParameter("@fileGUIDNames", SqlDbType.NVarChar, 255);
            parameterfileGUIDNames.Value = fileGUIDNames;
            myCommand.Parameters.Add(parameterfileGUIDNames);

            SqlParameter parameterfileLength = new SqlParameter("@fileLength", SqlDbType.Int);
            parameterfileLength.Value = fileLength;
            myCommand.Parameters.Add(parameterfileLength);

            SqlParameter parameterfilePath = new SqlParameter("@filePath", SqlDbType.NVarChar, 255);
            parameterfilePath.Value = filePath;
            myCommand.Parameters.Add(parameterfilePath);

            SqlParameter parameterfileType = new SqlParameter("@fileType", SqlDbType.NVarChar, 50);
            parameterfileType.Value = fileType;
            myCommand.Parameters.Add(parameterfileType);

            SqlParameter parameterfileDate = new SqlParameter("@fileDate", SqlDbType.NVarChar, 20);
            parameterfileDate.Value = fileDate;
            myCommand.Parameters.Add(parameterfileDate);

            SqlParameter parameterfileComments = new SqlParameter("@fileComments", SqlDbType.NVarChar, 255);
            parameterfileComments.Value = fileComments;
            myCommand.Parameters.Add(parameterfileComments);

            SqlParameter parameteritems = new SqlParameter("@items", SqlDbType.NVarChar, 100);
            parameteritems.Value = items;
            myCommand.Parameters.Add(parameteritems);


            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();

        }
        public void FilesUpdate
          (

              String fileNames,
              String fileGUIDNames,
              int fileLength,
              String filePath,
              String fileType,
              String fileDate,
              String fileComments,
              String items


          )
        {
            ConnectionStringSettings settings;
            settings = ConfigurationManager.ConnectionStrings["rostConnectionString"];

            SqlConnection myConnection = new SqlConnection(settings.ToString());
            SqlCommand myCommand = new SqlCommand("FilesUpdate", myConnection);

            myCommand.CommandType = CommandType.StoredProcedure;


            SqlParameter parameterfileNames = new SqlParameter("@fileNames", SqlDbType.NVarChar, 255);
            parameterfileNames.Value = fileNames;
            myCommand.Parameters.Add(parameterfileNames);

            SqlParameter parameterfileGUIDNames = new SqlParameter("@fileGUIDNames", SqlDbType.NVarChar, 255);
            parameterfileGUIDNames.Value = fileGUIDNames;
            myCommand.Parameters.Add(parameterfileGUIDNames);

            SqlParameter parameterfileLength = new SqlParameter("@fileLength", SqlDbType.Int);
            parameterfileLength.Value = fileLength;
            myCommand.Parameters.Add(parameterfileLength);

            SqlParameter parameterfilePath = new SqlParameter("@filePath", SqlDbType.NVarChar, 255);
            parameterfilePath.Value = filePath;
            myCommand.Parameters.Add(parameterfilePath);

            SqlParameter parameterfileType = new SqlParameter("@fileType", SqlDbType.NVarChar, 50);
            parameterfileType.Value = fileType;
            myCommand.Parameters.Add(parameterfileType);

            SqlParameter parameterfileDate = new SqlParameter("@fileDate", SqlDbType.NVarChar, 20);
            parameterfileDate.Value = fileDate;
            myCommand.Parameters.Add(parameterfileDate);

            SqlParameter parameterfileComments = new SqlParameter("@fileComments", SqlDbType.NVarChar, 255);
            parameterfileComments.Value = fileComments;
            myCommand.Parameters.Add(parameterfileComments);

            SqlParameter parameteritems = new SqlParameter("@items", SqlDbType.NVarChar, 100);
            parameteritems.Value = items;
            myCommand.Parameters.Add(parameteritems);


            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();

        }
        public void FilesItemInsert
            (

               int id_files,
                String items


            )
        {
            ConnectionStringSettings settings;
            settings = ConfigurationManager.ConnectionStrings["rostConnectionString"];

            SqlConnection myConnection = new SqlConnection(settings.ToString());
            SqlCommand myCommand = new SqlCommand("FilesItemInsert", myConnection);

            myCommand.CommandType = CommandType.StoredProcedure;


            SqlParameter parameterid_files = new SqlParameter("@id_files", SqlDbType.Int);
            parameterid_files.Value = id_files;
            myCommand.Parameters.Add(parameterid_files);

            SqlParameter parameteritems = new SqlParameter("@items", SqlDbType.NVarChar, 100);
            parameteritems.Value = items;
            myCommand.Parameters.Add(parameteritems);


            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();

        }
        public SqlDataReader FilesSelect
           (
              String items
           )
        {
            ConnectionStringSettings settings;
            settings = ConfigurationManager.ConnectionStrings["rostConnectionString"];

            SqlConnection myConnection = new SqlConnection(settings.ToString());
            SqlCommand myCommand = new SqlCommand("FilesSelect", myConnection);

            myCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter parameteritems = new SqlParameter("@items", SqlDbType.NVarChar, 255);
            parameteritems.Value = items;
            myCommand.Parameters.Add(parameteritems);

            myConnection.Open();

            return myCommand.ExecuteReader(CommandBehavior.CloseConnection);

        }
        public void FilesItemsDelete
           (


               String items


           )
        {
            ConnectionStringSettings settings;
            settings = ConfigurationManager.ConnectionStrings["rostConnectionString"];

            SqlConnection myConnection = new SqlConnection(settings.ToString());
            SqlCommand myCommand = new SqlCommand("FilesItemsDelete", myConnection);

            myCommand.CommandType = CommandType.StoredProcedure;




            SqlParameter parameteritems = new SqlParameter("@items", SqlDbType.NVarChar, 100);
            parameteritems.Value = items;
            myCommand.Parameters.Add(parameteritems);


            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();

        }
        public static void FilesDeleteFromDisk(String items)
        {

            String filePath = "";
            String fileNames = "";

            Files objFiles = new Files();
            SqlDataReader readerFiles = objFiles.FilesSelect(items);

            readerFiles.Read();

            try
            {
                filePath = readerFiles["filePath"].ToString();
                fileNames = readerFiles["fileNames"].ToString();
            }
            catch { }
            finally { readerFiles.Close(); }

            if (fileNames != "")
            {
                try
                {
                    FileInfo TheFile = new FileInfo(filePath);
                    if (TheFile.Exists)
                    {
                        File.Delete(filePath);
                    };

                    //Удаление файла из базы
                    objFiles.FilesItemsDelete(items);
                }
                catch
                {

                }
            }
        }
    }
}