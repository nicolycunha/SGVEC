using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SGVEC.Models;
using SGVEC.Controllers;

namespace SGVEC
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAccess_Click(object sender, EventArgs e)
        {
            ErrorController rtnError = new ErrorController();

            if (txtLogin.Text == "")
            {                
                lblError.Text = rtnError.LabelError("O Campo ", txtLogin.ID, ", Deve ser preenchido!");
            }
            else if(txtPassword.Text == "")
            {
                lblError.Text = rtnError.LabelError("O Campo ", txtPassword.ID, ", Deve ser preenchido!");
            }
            else
            {
                try
                {
                    ConnectionMySql.ConnectionToMySql(); //Método que efetua conexão ao banco de dados
                }
                catch(Exception ex)
                {                    
                    //Analisar forma de retorno do erro na conexão com o banco...
                    lblError.Text = "Erro: " + ex.Message;
                }
            }
        }        
    }
}