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

        //A partir do parâmetro executa a query
        public DataTable ExecDtTableStringQuery(string CommandText)
        {
            cnt = new Connect();
            cn = new MySqlConnection();

            cn = cnt.DataBaseConnect();
            return ExecDtTableQuery(CommandText);
        }

        //Retorna uma tabela de dados, podendo ser usada no gridview
        private DataTable ExecDtTableQuery(string CommandText)
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

        public MySqlDataReader ExecuteStringQuery(string CommandText)
        {
            cnt = new Connect();
            cn = new MySqlConnection();

            cn = cnt.DataBaseConnect();
            return ExecuteQuery(CommandText);
        }

        //Retorna uma tabela de dados, podendo ser usada no gridview
        private MySqlDataReader ExecuteQuery(string CommandText)
        {
            try
            {
                MySqlCommand cm = new MySqlCommand(CommandText, cn);
                MySqlDataReader MySqlDtReader = cm.ExecuteReader();

                return MySqlDtReader;
            }
            catch
            {
                cm.Connection.Close();
                return null;
            }
        }
    }
}