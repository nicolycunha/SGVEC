using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace SGVEC.Models
{
    public class Connect
    {
        public void DataBaseConnect()
        {
            ConnectToDataBase();
        }

        private void ConnectToDataBase()
        {
            MySqlConnection cn = new MySqlConnection("Server=127.0.0.1;Database=SGVEC;UID=root;PWD=root123");
            cn.Open();
        }
    }
}