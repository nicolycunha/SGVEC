
namespace SGVEC.Models
{
    public static class Global
    {
        public static int _intCodFunc;
        public static string _strCPF;
        public static string _strNome;
        public static string _strCodFunc = "0";
        public static string _MSG_NECESSARIO = "É necessário preencher o campo ";
        public static string _MSG_SEUPERFIL = "Seu perfil não é adequado para essa funcionalidade!";
        public static string _strCodTypeProduct = "0";
    }

    public class GeneralComponent
    {
        public int CodFunc
        {
            get { return Global._intCodFunc; }   
            set { Global._intCodFunc = value; }     
        }

        public string CPF
        {
            get { return Global._strCPF; }
            set { Global._strCPF = value; }
        }

        public string Nome
        {
            get { return Global._strNome; }
            set { Global._strNome = value; }
        }

        public string strCodFunc
        {
            get { return Global._strCodFunc; }
            set { Global._strCodFunc = value; }
        }

        public string MSG_NECESSARIO
        {
            get { return Global._MSG_NECESSARIO; }
            set { Global._MSG_NECESSARIO = value; }
        }

        public string MSG_SEUPERFIL
        {
            get { return Global._MSG_SEUPERFIL; }
            set { Global._MSG_SEUPERFIL = value; }
        }

        public string strCodTypeProduct
        {
            get { return Global._strCodTypeProduct; }
            set { Global._strCodTypeProduct = value; }
        }
    }
}