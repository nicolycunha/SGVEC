using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;

namespace SGVEC.Models
{
    public class Connect
    {
        private MySqlConnection cn = new MySqlConnection("Server=127.0.0.1;Database=SGVEC;UID=root;PWD=root123");        
        private MySqlCommand cm = new MySqlCommand();

        public void DataBaseConnect()
        {
            ConnectToDataBase();
        }

        private void ConnectToDataBase()
        {
            try
            {
                cn.Open();                
            }
            catch
            {
                throw;
            }
        }

        public void ExecuteStringQuery(string CommandText)
        {
            ExecuteQuery(CommandText);
        }

        private void ExecuteQuery(string CommandText)
        {
            try
            {
                cm.Connection = cn;
                cm.CommandType = CommandType.Text;
                cm.CommandText = CommandText;
                cm.ExecuteNonQuery();
            }
            catch
            {
                cm.Connection.Close();
            }
        }
    }
}