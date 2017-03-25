using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace NIKFORUM
{
    public static class Middle
    {
        public static string sqlConnectionString = "Data Source=" + @"NIKOLA-PC\SQLNIK;" + "Initial catalog=" + "NIKFORUM;" + "Persist security info=True; User Id=" + "sa;" + "Password=" + "fori=0;" + "Connect Timeout=300";
        public static SqlConnection sqlConnection = new SqlConnection(sqlConnectionString);
        public static string currentQuestionId = "0";
        public static void main() { 
                       
        }
        public static SqlConnection getConnection() {
            if (sqlConnection.State != ConnectionState.Open)
            {
                sqlConnection.Close();
                sqlConnection.ConnectionString = sqlConnectionString;
                sqlConnection.Open();
            }
            return sqlConnection;
        }



        

    }
}