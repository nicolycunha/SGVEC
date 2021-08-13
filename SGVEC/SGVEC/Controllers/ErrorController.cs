using System;
using System.Web.Mvc;

namespace SGVEC.Controllers
{
    public class ErrorController : Controller
    {
        // GET: Default
        public ActionResult Index()
        {
            return View();
        }

        //Retorna o resultado do método privado
        public String LabelError(String TextStart, String Name, String TextEnd)
        {
            return pvtLabelError(TextStart, Name, TextEnd);
        }

        //Método privado que retorna mensagem de erro com base no que foi digitado como parâmetro
        private String pvtLabelError(String TextStart, String Name, String TextEnd)
        {
            if (Name != "txtPassword")
            {
                Name = Name.Replace("txt", " ");
                return TextStart + Name + TextEnd;
            }
            else
            {
                return TextStart + "Senha" + TextEnd;
            }
        }
    }
}