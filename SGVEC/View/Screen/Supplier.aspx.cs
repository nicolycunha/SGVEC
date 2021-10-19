using System;
using SGVEC.Models;
using SGVEC.Controller;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace SGVEC.View.Screen
{
    public partial class Supplier : System.Web.UI.Page
    {
        private Connect cnt = new Connect();
        private ComponentError ce = new ComponentError();
        private DataManipulation dtManip = new DataManipulation();
        private GeneralComponent gc = new GeneralComponent();
        private string strCode = "0";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblError.Text = "";
                lblSucess.Text = "";

                //EnableComponents(false);

                if (txtCode.Text != "") strCode = txtCode.Text;

                //Atualiza o grid
                gvSupplier.DataSource = dtManip.ExecDtTableStringQuery("CALL PROC_SELECT_FORNEC('" + strCode + "', '" + txtCNPJ.Text.ToString() + "', '" + txtRazao.Text.ToString() + "')");
                gvSupplier.DataBind();

                if (gvSupplier.Rows.Count == 0) { lblError.Visible = true; lblError.Text = "Não há fornecedores com essas informações no sistema!"; }
                else lblError.Visible = false;
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                lblError.Visible = true;
            }
        }

        #region Search
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                gc.strCodSupplier = "0";

                if (txtCode.Text != "") strCode = txtCode.Text;

                //Atualiza o grid
                gvSupplier.DataSource = dtManip.ExecDtTableStringQuery("CALL PROC_SELECT_FORNEC('" + strCode + "', '" + txtCNPJ.Text.ToString() + "', '" + txtRazao.Text.ToString() + "')");
                gvSupplier.DataBind();

                if (gvSupplier.Rows.Count == 0) { lblError.Visible = true; lblError.Text = "Não há funcionários com essas informações no sistema!"; }
                else lblError.Visible = false;

                txtCode.Text = ""; txtCNPJ.Text = ""; txtRazao.Text = "";
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                lblError.Visible = true;
            }
        }
        #endregion

        protected void btnSearchSupplier_Click()
        {

        }

        protected void btnSendInsert_Click()
        {

        }

        protected void btnSendUpdate_Click()
        {

        }

        protected void btnSendDelete_Click(object sender, EventArgs e)
        {

        }

        protected void btnClearComponents_Click(object sender, EventArgs e)
        {
            ClearComponents();
        }

        #region Components
        private void ClearComponents()
        {
            gc.strCodSupplier = "0"; txtCodSupplier.Enabled = true; txtRazaoSupplier.Text = "";
            txtCNPJSupplier.Text = ""; txtNumTel.Text = ""; txtEndecSupplier.Text = "";
            txtNumSupplier.Text = ""; txtBairroSupplier.Text = ""; txtCEPSupplier.Text = "";
            txtCidadeSupplier.Text = ""; txtUFSupplier.Text = "";
        }

        private void EnableComponents(bool value)
        {
            txtCodSupplier.Enabled = false; txtRazaoSupplier.Enabled = value; txtCNPJSupplier.Enabled = value;
            txtNumTel.Enabled = value; txtEndecSupplier.Enabled = value; txtNumSupplier.Enabled = value;
            txtBairroSupplier.Enabled = value; txtCEPSupplier.Enabled = value;
            txtCidadeSupplier.Enabled = value; txtUFSupplier.Enabled = value;
        }
        #endregion

        #region Validate
        private bool ValidateComponents()
        {
            if (txtRazaoSupplier.Text == "") { lblError.Text = ce.ComponentsValidation("Razão Social", gc.MSG_NECESSARIO); return false; }
            else if (txtCNPJSupplier.Text == "") { lblError.Text = ce.ComponentsValidation("CNPJ", gc.MSG_NECESSARIO); return false; }
            else if (txtNumTel.Text == "") { lblError.Text = ce.ComponentsValidation("Telefone", gc.MSG_NECESSARIO); return false; }
            else if (gc.CodEmployee == 1) { lblError.Text = ce.ComponentsValidation("", gc.MSG_SEUPERFIL); return false; } //Atendente
            else if (gc.CodEmployee == 2) { lblError.Text = ce.ComponentsValidation("", gc.MSG_SEUPERFIL); return false; } //Caixa
            else if (gc.CodEmployee == 5) { lblError.Text = ce.ComponentsValidation("", gc.MSG_SEUPERFIL); return false; } //Treinador
            else if (gc.CodEmployee == 6) { lblError.Text = ce.ComponentsValidation("", gc.MSG_SEUPERFIL); return false; } //Técnico de Qualidade         
            //3 -- Gerente de Loja
            //4 -- Gerente de Área

            return true;
        }
        #endregion

        protected void gvSupplier_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnSendSave_Click(object sender, EventArgs e)
        {
            btnSendInsert_Click();
            ClearComponents();
        }
    }
}