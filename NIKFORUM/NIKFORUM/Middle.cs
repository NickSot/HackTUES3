using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

//Идеята на този клас е да може да се имплентира от другите класове...
//В него се съдържат глобалните променливи за проекта...

namespace NIKFORUM
{
    public static class Middle
    {
        //Създаване на глобални променливи, достъпни за целия проек...
        public static int pageCounter = 0;
        public static string sqlConnectionString = "Data Source=" + @"NIKOLA-PC\SQLNIK;" + "Initial catalog=" + "NIKFORUM;" + "Persist security info=True; User Id=" + "sa;" + "Password=" + "fori=0;" + "Connect Timeout=300";
        public static SqlConnection sqlConnection = new SqlConnection(sqlConnectionString);
        public static string currentQuestionId = "0";
        public static string previousPage = "";
        public static void main() { 
                       
        }

        //Това е функция, която връща като стойност SQL конекцията
        
        public static SqlConnection getConnection() {
            if (sqlConnection.State != ConnectionState.Open)
            {
                sqlConnection.Close();
                sqlConnection.ConnectionString = sqlConnectionString;
                sqlConnection.Open();
            }
            return sqlConnection;
        }

        /*public static void AI() { 
            string AIArray = 
        }*/
    }
}