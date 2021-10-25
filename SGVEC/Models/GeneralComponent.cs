
namespace SGVEC.Models
{
    public static class Global
    {
        public static int _intCodEmployee;
        public static string _strCPF;
        public static string _strName;
        public static string _strCodEmployee = "0";
        public static string _MSG_NECESSARIO = "É necessário preencher o campo ";
        public static string _MSG_SEUPERFIL = "Seu perfil não é adequado para essa funcionalidade!";
        public static string _strCodTypeProduct = "0";
        public static string _strCodSupplier = "0";
        public static string _strCodProduct = "0";
    }

    public class GeneralComponent
    {
        public int CodEmployee
        {
            get { return Global._intCodEmployee; }   
            set { Global._intCodEmployee = value; }     
        }

        public string CPF
        {
            get { return Global._strCPF; }
            set { Global._strCPF = value; }
        }

        public string Name
        {
            get { return Global._strName; }
            set { Global._strName = value; }
        }

        public string strCodEmployee
        {
            get { return Global._strCodEmployee; }
            set { Global._strCodEmployee = value; }
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

        public string strCodSupplier
        {
            get { return Global._strCodSupplier; }
            set { Global._strCodSupplier = value; }
        }

        public string strCodProduct
        {
            get { return Global._strCodProduct; }
            set { Global._strCodProduct = value; }
        }
    }
}