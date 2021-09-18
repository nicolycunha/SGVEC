
namespace SGVEC.Models
{
    public class ComponentError
    {
        public string ComponentsValidation(string Name, string Text)
        {
            return ReturnMensageValidation(Name, Text);
        }

        private string ReturnMensageValidation(string Name, string Text)
        {
            return "Atenção! " + Text + Name.Replace("txt", "");
        }
    }
}