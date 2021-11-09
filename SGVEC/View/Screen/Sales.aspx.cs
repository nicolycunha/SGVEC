using System;
using SGVEC.Models;
using SGVEC.Controller;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace SGVEC.View.Screen
{
    public partial class Sales : System.Web.UI.Page
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
                gvSales.DataSource = dtManip.ExecDtTableStringQuery("CALL PROC_SELECT_SALE('" + strCode + "', '" + txtCpfCli.Text.ToString() + "', '" + txtCpfFunc.Text.ToString() + "', '" + txtDateSales.Text.ToString() + "')");
                gvSales.DataBind();

                if (gvSales.Rows.Count == 0) { lblError.Visible = true; lblError.Text = "Não há vendas com essas informações no sistema!"; }
                else lblError.Visible = false;

                //Preenche o ComboBox com os cadastros da Tabela - Funcionário
                ddlFuncSales.DataSource = dtManip.ExecDtTableStringQuery("SELECT * FROM FUNCIONARIO WHERE COD_FUNC = '" + gc.CodEmployeeLog + "'");
                ddlFuncSales.DataTextField = "NOME_FUNC";
                ddlFuncSales.DataValueField = "COD_FUNC";
                ddlFuncSales.DataBind();

                //Preenche o ComboBox com os cadastros da Tabela - Tipo de Pagamento
                ddlTipoPagSales.DataSource = dtManip.ExecDtTableStringQuery("SELECT * FROM PRODUTO");
                ddlTipoPagSales.DataTextField = "NOME_PROD";
                ddlTipoPagSales.DataValueField = "COD_BARRAS";
                ddlTipoPagSales.DataBind();
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
                gc.strCodSales = "0";

                if (txtCode.Text != "") strCode = txtCode.Text;

                //Atualiza o grid
                gvSales.DataSource = dtManip.ExecDtTableStringQuery("CALL PROC_SELECT_SALE('" + strCode + "', '" + txtCpfCli.Text.ToString() + "', '" + txtCpfFunc.Text.ToString() + "', '" + txtDateSales.Text.ToString() + "')");
                gvSales.DataBind();

                if (gvSales.Rows.Count == 0) { lblError.Visible = true; lblError.Text = "Não há vendas com essas informações no sistema!"; }
                else lblError.Visible = false;

                txtCode.Text = ""; txtCpfCli.Text = ""; txtCpfFunc.Text = "";
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                lblError.Visible = true;
            }
        }

        protected void btnSearchEmployee_Click()
        {
            try
            {
                if (gc.strCodSales != "0")
                {
                    cnt.DataBaseConnect();
                    MySqlDataReader leitor = dtManip.ExecuteDataReader("CALL PROC_SELECT_SALE('" + gc.strCodSales + "', '', '', '')");

                    if (leitor.Read())
                    {
                        txtCodSales.Text = leitor[0].ToString();
                        txtNomeCliSales.Text = leitor[1].ToString();
                        txtCpfCliSales.Text = leitor[2].ToString();
                        txtDtSales.Text = leitor[3].ToString();
                        txtNumParcSales.Text = Convert.ToDateTime(leitor[4].ToString()).ToString("yyyy-MM-dd");
                        txtValParcSales.Text = leitor[5].ToString();
                        txtDescontoSales.Text = leitor[6].ToString();
                        txtTotalSales.Text = leitor[7].ToString();
                        ddlFuncSales.SelectedValue = leitor[16].ToString();
                        ddlTipoPagSales.SelectedValue = leitor[16].ToString();
                    }
                    else { lblError.Text = "Não há vendas com essas informações no sistema!"; }
                }
                else { lblError.Text = "É necessário selecionar uma Venda!"; ClearComponents(); }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                lblError.Visible = true;
            }
        }
        #endregion

        #region Insert
        protected void btnSendInsert_Click()
        {
            try
            {
                lblError.Text = "";
                lblSucess.Text = "";

                if (ValidateComponents())
                {
                    var objRetorno = dtManip.ExecuteStringQuery("CALL PROC_INSERT_SALE('" + txtCodSales.Text + "', '" + txtNomeCliSales.Text + "', '"
                         + txtCpfCliSales.Text + "', '" + ddlFuncSales.SelectedItem.Text + "', '"
                         + Convert.ToDateTime((txtDtSales.Text).Replace("-", "/")).ToString("dd/MM/yyyy") + "', '" + txtNumParcSales.Text + "', '"
                         + txtValParcSales.Text + "', '" + txtDescontoSales.Text + "', '" + txtTotalSales.Text + "', '" + ddlTipoPagSales.SelectedItem.Text + "')");

                    if (objRetorno != null)
                    {
                        if (objRetorno == true)
                        {
                            lblSucess.Text = "Venda registrada com sucesso!";
                            lblSucess.Visible = true;
                            ClearComponents();
                        }
                        else
                        {
                            lblError.Text = "Atenção! Venda não registrada, verifique os dados digitados!";
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
            gc.strCodSales = "0"; txtCodSales.Enabled = true;
            txtNomeCliSales.Text = ""; txtCpfCliSales.Text = ""; txtDtSales.Text = "";
            txtNumParcSales.Text = ""; txtValParcSales.Text = ""; txtDescontoSales.Text = ""; txtTotalSales.Text = "";
        }

        private void EnableComponents(bool value)
        {
            txtCodSales.Enabled = false; txtNomeCliSales.Enabled = value; txtCpfCliSales.Enabled = value;
            ddlFuncSales.Enabled = value; txtDtSales.Enabled = value; txtNumParcSales.Enabled = value;
            txtValParcSales.Enabled = value; txtDescontoSales.Enabled = value; txtTotalSales.Enabled = value; ddlTipoPagSales.Enabled = value;
        }
        #endregion

        #region Validate
        private bool ValidateComponents()
        {
            if (txtNomeCliSales.Text == "") { lblError.Text = ce.ComponentsValidation("Nome Cliente", gc.MSG_NECESSARIO); return false; }
            else if (txtCpfCliSales.Text == "") { lblError.Text = ce.ComponentsValidation("CPF Cliente", gc.MSG_NECESSARIO); return false; }
            else if (txtDtSales.Text == "") { lblError.Text = ce.ComponentsValidation("Data Venda", gc.MSG_NECESSARIO); return false; }
            else if (txtValParcSales.Text == "") { lblError.Text = ce.ComponentsValidation("Valor Parcela", gc.MSG_NECESSARIO); return false; }
            else if (txtTotalSales.Text == "") { lblError.Text = ce.ComponentsValidation("Total da Venda", gc.MSG_NECESSARIO); return false; }
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
        protected void gvSales_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClearComponents();

            gc.strCodSales = (sender as LinkButton).CommandArgument; //Código da Venda selecionada no grid
            if (gc.strCodSales != "0") { btnSearchEmployee_Click(); }
        }
        #endregion

        #region btnSave
        protected void btnSendSave_Click(object sender, EventArgs e)
        {
            btnSendInsert_Click();
            ClearComponents();
        }
        #endregion
    }
}