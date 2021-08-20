﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SGVEC.Models;

namespace SGVEC
{
    public partial class Login : System.Web.UI.Page
    {
        private ComponentError cptValidate = new ComponentError();
        private Connect cnt = new Connect();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)            
        {
            try
            {
                if (txtLogin.Text == "")
                {
                    lblError.Text = cptValidate.ComponentsValidation(txtLogin.ID, "É necessário preencher o campo ");
                }
                else if (txtPassword.Text == "")
                {
                    lblError.Text = cptValidate.ComponentsValidation("Senha", "É necessário preencher o campo ");
                }
                else
                {
                    cnt.DataBaseConnect();
                }
            }
            catch(Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void imgBtnLogin_Click(object sender, ImageClickEventArgs e)
        {
            if (txtLogin.Text == "")
            {
                cptValidate.ComponentsValidation(txtLogin.ID, "É necessário preencher o campo ");
            }
            else if (txtPassword.Text == "")
            {
                cptValidate.ComponentsValidation("Senha", "É necessário preencher o campo ");
            }
            else
            {

            }
        }
    }
}