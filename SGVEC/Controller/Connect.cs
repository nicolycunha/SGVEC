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
        private GeneralComponent gc = new GeneralComponent();

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
                //Não fecho a conexão, para poder obter informação do motivo do erro (se houver)
                //Sendo assim, retorna para o método anterior e faz o tratamento de erro retornando para a tela.
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
                    gc.CodFunc = leitor.GetInt32(0);
                    gc.CPF = leitor.GetString(1);
                    gc.Nome = leitor.GetString(2);
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