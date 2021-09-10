using System;
using System.Data;
using MySql.Data.MySqlClient;
using SGVEC.Controller;

namespace SGVEC.Controller
{
    public class DataManipulation
    {
        private Connect cnt = new Connect(); //Classe que possui o método de conexão com o Banco de Dados
        private MySqlConnection cn = new MySqlConnection();
        private MySqlCommand cm = new MySqlCommand();

        public DataTable ExecuteStringQuery(string CommandText)
        {
            cn = cnt.DataBaseConnect();
            return ExecuteQuery(CommandText);
        }

        private DataTable ExecuteQuery(string CommandText)
        {
            try
            {
                MySqlDataAdapter mySqlDtAdpt = new MySqlDataAdapter(CommandText, cn);
                DataTable dtTable = new DataTable();
                mySqlDtAdpt.Fill(dtTable);

                return dtTable;
            }
            catch
            {
                cm.Connection.Close();
                return null;
            }
        }
    }
}