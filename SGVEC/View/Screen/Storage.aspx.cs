using System;
using SGVEC.Models;
using SGVEC.Controller;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace SGVEC.View.Screen
{
    public partial class Storage : System.Web.UI.Page
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

                EnableComponents(false);

                if (txtCode.Text != "") strCode = txtCode.Text;

                //Atualiza o grid
                gvStorage.DataSource = dtManip.ExecDtTableStringQuery("CALL PROC_SELECT_PROD('" + strCode + "', '" + txtName.Text.ToString() + "')");
                gvStorage.DataBind();

                if (gvStorage.Rows.Count == 0) { lblError.Visible = true; lblError.Text = "Não há produtos com essas informações no sistema!"; }
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
                gc.strCodProduct = "0";

                if (txtCode.Text != "") strCode = txtCode.Text;

                //Atualiza o grid
                gvStorage.DataSource = dtManip.ExecDtTableStringQuery("CALL PROC_SELECT_PROD('" + strCode + "', '" + txtName.Text.ToString() + "')");
                gvStorage.DataBind();

                if (gvStorage.Rows.Count == 0) { lblError.Visible = true; lblError.Text = "Não há produtos com essas informações no sistema!"; }
                else lblError.Visible = false;

                txtCode.Text = ""; txtName.Text = "";
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                lblError.Visible = true;
            }
        }

        protected void btnSearchProduct_Click()
        {
            try
            {
                if (gc.strCodProduct != "0")
                {
                    cnt.DataBaseConnect();
                    MySqlDataReader leitor = dtManip.ExecuteDataReader("CALL PROC_SELECT_PROD('" + gc.strCodProduct + "', '')");

                    if (leitor.Read())
                    {
                        txtCodBarrasStorage.Text = leitor[0].ToString();
                        txtNomeStorage.Text = leitor[1].ToString();
                        txtQuantidadeStorage.Text = leitor[6].ToString();
                    }
                    else { lblError.Text = "Não há produtos com essas informações no sistema!"; }
                }
                else { lblError.Text = "É necessário selecionar um produto!"; ClearComponents(); }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                lblError.Visible = true;
            }
        }
        #endregion

        #region Update
        protected void btnSendUpdate_Click()
        {
            try
            {
                lblError.Text = "";
                lblSucess.Text = "";

                if (ValidateComponents())
                {
                    var objRetorno = dtManip.ExecuteStringQuery("UPDATE PRODUTO SET QUANTIDADE_PROD = '"+ txtQuantidadeStorage.Text + "' WHERE COD_BARRAS = '" + gc.strCodProduct +"'");

                    if (objRetorno != null)
                    {
                        if (objRetorno == true)
                        {
                            lblSucess.Text = "Quantidade alterada com sucesso!";
                            lblSucess.Visible = true;
                            ClearComponents();
                        }
                        else
                        {
                            lblError.Text = "Atenção! A quantidade de produtos não foram alterados, verifique os dados digitados!";
                            lblError.Visible = true;
                            ClearComponents();
                        }
                    }
                }
                else { lblError.Visible = true; }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                lblError.Visible = true;
            }
        }
        #endregion

        protected void btnClearComponents_Click(object sender, EventArgs e)
        {
            ClearComponents();
        }

        #region Components
        private void ClearComponents()
        {
            gc.strCodProduct = "0"; txtCodBarrasStorage.Enabled = true;
            txtCodBarrasStorage.Text = ""; txtNomeStorage.Text = ""; txtQuantidadeStorage.Text = ""; 
        }

        private void EnableComponents(bool value)
        {
            txtCodBarrasStorage.Enabled = false; txtNomeStorage.Enabled = value; txtQuantidadeStorage.Enabled = value;
        }
        #endregion

        #region Validate
        private bool ValidateComponents()
        {
            if (txtNomeStorage.Text == "") { lblError.Text = ce.ComponentsValidation("Nome do Produto", gc.MSG_NECESSARIO); return false; }
            else if (txtQuantidadeStorage.Text == "") { lblError.Text = ce.ComponentsValidation("Quantidade", gc.MSG_NECESSARIO); return false; }
            else if (gc.CodEmployee == 1) { lblError.Text = ce.ComponentsValidation("", gc.MSG_SEUPERFIL); return false; } //Atendente
            else if (gc.CodEmployee == 2) { lblError.Text = ce.ComponentsValidation("", gc.MSG_SEUPERFIL); return false; } //Caixa
            else if (gc.CodEmployee == 5) { lblError.Text = ce.ComponentsValidation("", gc.MSG_SEUPERFIL); return false; } //Treinador
            else if (gc.CodEmployee == 6) { lblError.Text = ce.ComponentsValidation("", gc.MSG_SEUPERFIL); return false; } //Técnico de Qualidade         
            //3 -- Gerente de Loja
            //4 -- Gerente de Área

            return true;
        }
        #endregion

        #region SelectedIndex
        protected void gvStorage_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClearComponents();

            gc.strCodProduct = (sender as LinkButton).CommandArgument; //Código do produto selecionado no grid
            if (gc.strCodProduct != "0") { btnSearchProduct_Click(); }
        }
        #endregion

        #region btnSave
        protected void btnSendSave_Click(object sender, EventArgs e)
        {
            btnSendUpdate_Click();
            ClearComponents();
        }
        #endregion
    }
}