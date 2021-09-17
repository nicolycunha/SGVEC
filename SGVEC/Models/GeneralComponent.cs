
namespace SGVEC.Models
{
    public static class Global
    {
        public static int _intCodFunc;
        public static string _strCPF;
        public static string _strNome;
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
    }
}