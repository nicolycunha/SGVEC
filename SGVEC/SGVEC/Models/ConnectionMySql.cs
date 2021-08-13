using MySql.Data.MySqlClient;

namespace SGVEC.Models
{
    public class ConnectionMySql
    {
        //Retorna o resultado do método privado
        public static MySqlConnection ConnectionToMySql()
        {
            return pvtConnectionToMySql();
        }

        //Método privado de conexão ao banco de dados MySql
        private static MySqlConnection pvtConnectionToMySql()
        {
            MySqlConnection conect = new MySqlConnection("SERVER=127.0.0.1:3306; DATABASE=SGVEC; USER=root;");                        
            conect.Open();
            return conect;
        }
    }
}