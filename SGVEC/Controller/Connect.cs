using SGVEC.Models;
using System.Data;
using MySql.Data.MySqlClient;

namespace SGVEC.Controller
{
    public class Connect
    {
        private MySqlConnection cn = new MySqlConnection("Server=127.0.0.1;Database=SGVEC;UID=root;PWD=root123");
        private MySqlCommand cm = new MySqlCommand();
        private ComponentError cptValidate = new ComponentError();
        private Master mt = new Master();

        public MySqlConnection DataBaseConnect()
        {
            return ConnectToDataBase();
        }

        private MySqlConnection ConnectToDataBase()
        {
            try
            {
                cn.Open();
                return cn;
            }
            catch
            {
                throw;
            }
        }

        public bool ExecuteStringQuery(string CommandText)
        {
            return ExecuteQuery(CommandText);
        }

        private bool ExecuteQuery(string CommandText)
        {
            try
            {
                cm.Connection = cn;
                cm.CommandType = CommandType.Text;
                cm.CommandText = CommandText;
                cm.ExecuteNonQuery();
                MySqlDataReader leitor = cm.ExecuteReader();

                while (leitor.Read())
                {
                    mt.codFunc = leitor.GetInt32(0);
                    cm.Connection.Close();                    
                    return true;
                }

                cm.Connection.Close();
                return false;
            }
            catch
            {
                cm.Connection.Close();
                return false;
            }
        }
    }
}