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
                ddlFuncSales.DataSource = dtManip.ExecDtTableStringQuery("SELECT * FROM FUNCIONARIO");
                ddlFuncSales.DataTextField = "NOME_CARGO";
                ddlFuncSales.DataValueField = "COD_CARGO";
                ddlFuncSales.DataBind();

                //Preenche o ComboBox com os cadastros da Tabela - Tipo de Pagamento
                ddlTipoPagSales.DataSource = dtManip.ExecDtTableStringQuery("SELECT * FROM TIPO_PAGAMENTO");
                ddlTipoPagSales.DataTextField = "NOME_CARGO";
                ddlTipoPagSales.DataValueField = "COD_CARGO";
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
                else { lblError.Text = "É necessário selecionar um funcionário!"; ClearComponents(); }
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
                if (gc.strCodSales != "0")
                {
                    lblError.Text = "";
                    lblSucess.Text = "";

                    if (ValidateComponents())
                    {
                        //var objRetorno = dtManip.ExecuteStringQuery("CALL PROC_INSERT_FUNC('" + txtCpfEmployee.Text + "', '" + txtNomeEmployee.Text + "', '" + txtRGEmployee.Text + "', '"
                        //     + (txtDtNascEmployee.Text).Replace("-", "/") + "', '" + txtTelEmployee.Text + "', '" + txtCelEmployee.Text + "', '" + txtEnderecoEmployee.Text + "', '"
                        //     + txtNumEndecEmployee.Text + "', '" + txtBairroEmployee.Text + "', '" + txtCepEmployee.Text + "', '" + txtCidadeEmployee.Text + "', '"
                        //     + txtUFEmployee.Text + "', '" + txtEmailEmployee.Text + "', '" + txtSenhaEmployee.Text + "', '" + (txtDtDeslig.Text).Replace("-", "") + "', '"
                        //     + ddlCargoEmployee.SelectedItem.Value + "')");

                        //if (objRetorno != null)
                        //{
                        //    if (objRetorno == true)
                        //    {
                        //        lblSucess.Text = "Funcionário cadastrado com sucesso!";
                        //        lblSucess.Visible = true;
                        //        ClearComponents();
                        //    }
                        //    else
                        //    {
                        //        lblError.Text = "Atenção! Funcionário não cadastrado, verifique os dados digitados!";
                        //        lblError.Visible = true;
                        //        ClearComponents();
                        //    }
                        //}
                    }
                    else { lblError.Visible = true; }
                }
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
            //gc.strCodSales = "0"; txtCodEmployee.Enabled = true;
            //txtCodEmployee.Text = ""; txtNomeEmployee.Text = ""; txtCpfEmployee.Text = "";
            //txtRGEmployee.Text = ""; txtDtNascEmployee.Text = ""; txtTelEmployee.Text = "";
            //txtCelEmployee.Text = ""; txtEnderecoEmployee.Text = ""; txtNumEndecEmployee.Text = "";
            //txtBairroEmployee.Text = ""; txtCepEmployee.Text = ""; txtCidadeEmployee.Text = "";
            //txtUFEmployee.Text = ""; txtEmailEmployee.Text = ""; txtSenhaEmployee.Text = ""; txtDtDeslig.Text = "";
        }

        private void EnableComponents(bool value)
        {
            //txtCodEmployee.Enabled = false; txtNomeEmployee.Enabled = value; txtCpfEmployee.Enabled = value;
            //txtRGEmployee.Enabled = value; txtDtNascEmployee.Enabled = value; txtTelEmployee.Enabled = value;
            //txtCelEmployee.Enabled = value; txtEnderecoEmployee.Enabled = value; txtNumEndecEmployee.Enabled = value;
            //txtBairroEmployee.Enabled = value; txtCepEmployee.Enabled = value; txtCidadeEmployee.Enabled = value;
            //txtUFEmployee.Enabled = value; txtEmailEmployee.Enabled = value; txtSenhaEmployee.Enabled = value; txtDtDeslig.Enabled = value;
        }
        #endregion

        #region Validate
        private bool ValidateComponents()
        {
            //if (txtCpfEmployee.Text == "") { lblError.Text = ce.ComponentsValidation("CPF", gc.MSG_NECESSARIO); return false; }
            //else if (txtNomeEmployee.Text == "") { lblError.Text = ce.ComponentsValidation("Nome", gc.MSG_NECESSARIO); return false; }
            //else if (txtRGEmployee.Text == "") { lblError.Text = ce.ComponentsValidation("RG", gc.MSG_NECESSARIO); return false; }
            //else if (txtDtNascEmployee.Text == "") { lblError.Text = ce.ComponentsValidation("Data de Nascimento", gc.MSG_NECESSARIO); return false; }
            //else if (txtEmailEmployee.Text == "") { lblError.Text = ce.ComponentsValidation("Email", gc.MSG_NECESSARIO); return false; }
            //else if (txtSenhaEmployee.Text == "") { lblError.Text = ce.ComponentsValidation("Senha", gc.MSG_NECESSARIO); return false; }
            //else if (ddlCargoEmployee.SelectedItem.Text == "") { lblError.Text = ce.ComponentsValidation("Cargo", gc.MSG_NECESSARIO); return false; }
            //else if (gc.CodEmployee == 1) { lblError.Text = ce.ComponentsValidation("", gc.MSG_SEUPERFIL); return false; } //Atendente
            //else if (gc.CodEmployee == 2) { lblError.Text = ce.ComponentsValidation("", gc.MSG_SEUPERFIL); return false; } //Caixa
            //else if (gc.CodEmployee == 5) { lblError.Text = ce.ComponentsValidation("", gc.MSG_SEUPERFIL); return false; } //Treinador
            //else if (gc.CodEmployee == 6) { lblError.Text = ce.ComponentsValidation("", gc.MSG_SEUPERFIL); return false; } //Técnico de Qualidade         
            ////3 -- Gerente de Loja
            ////4 -- Gerente de Área

            return true;
        }
        #endregion

        #region SelectedIndex
        protected void gvSales_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClearComponents();

            gc.strCodSales = (sender as LinkButton).CommandArgument; //Código do funcionário selecionado no grid
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