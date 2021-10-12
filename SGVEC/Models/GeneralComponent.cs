
namespace SGVEC.Models
{
    public static class Global
    {
        public static int _intCodFunc;
        public static string _strCPF;
        public static string _strNome;
        public static string _strCodFunc = "0";
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
    }
}