using System;
using SGVEC.Models;
using SGVEC.Controller;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace SGVEC.View.Screen
{
    public partial class Employee : System.Web.UI.Page
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
                gvEmployee.DataSource = dtManip.ExecDtTableStringQuery("CALL PROC_SELECT_FUNC('" + strCode + "', '" + txtCPF.Text.ToString() + "', '" + txtName.Text.ToString() + "')");
                gvEmployee.DataBind();

                if (gvEmployee.Rows.Count == 0) { lblError.Visible = true; lblError.Text = "Não há funcionários com essas informações no sistema!"; }
                else lblError.Visible = false;

                //Preenche o ComboBox com os cadastros da Tabela - Cargo
                ddlCargoFunc.DataSource = dtManip.ExecDtTableStringQuery("SELECT * FROM CARGO");
                ddlCargoFunc.DataTextField = "NOME_CARGO";
                ddlCargoFunc.DataValueField = "COD_CARGO";
                ddlCargoFunc.DataBind();
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
                gc.strCodFunc = "0";

                if (txtCode.Text != "") strCode = txtCode.Text;

                //Atualiza o grid
                gvEmployee.DataSource = dtManip.ExecDtTableStringQuery("CALL PROC_SELECT_FUNC('" + strCode + "', '" + txtCPF.Text.ToString() + "', '" + txtName.Text.ToString() + "')");
                gvEmployee.DataBind();

                if (gvEmployee.Rows.Count == 0) { lblError.Visible = true; lblError.Text = "Não há funcionários com essas informações no sistema!"; }
                else lblError.Visible = false;

                txtCode.Text = ""; txtCPF.Text = ""; txtName.Text = "";
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
                if (gc.strCodFunc != "0")
                {
                    cnt.DataBaseConnect();
                    MySqlDataReader leitor = dtManip.ExecuteDataReader("CALL PROC_SELECT_FUNC('" + gc.strCodFunc + "', '', '')");

                    if (leitor.Read())
                    {
                        txtCodFunc.Text = leitor[0].ToString();
                        txtCpfFunc.Text = leitor[1].ToString();
                        txtNomeFunc.Text = leitor[2].ToString();
                        txtRGFunc.Text = leitor[3].ToString();
                        txtDtNascFunc.Text = Convert.ToDateTime(leitor[4].ToString()).ToString("yyyy-MM-dd");
                        txtTelFunc.Text = leitor[5].ToString();
                        txtCelFunc.Text = leitor[6].ToString();
                        txtEnderecoFunc.Text = leitor[7].ToString();
                        txtNumEndecFunc.Text = leitor[8].ToString();
                        txtBairroFunc.Text = leitor[9].ToString();
                        txtCepFunc.Text = leitor[10].ToString();
                        txtCidadeFunc.Text = leitor[11].ToString();
                        txtUFFunc.Text = leitor[12].ToString();
                        txtEmailFunc.Text = leitor[13].ToString();
                        txtSenhaFunc.Text = leitor[14].ToString();
                        if (leitor[15].ToString() != "") { txtDtDeslig.Text = Convert.ToDateTime(leitor[15].ToString()).ToString("yyyy-MM-dd"); } else { txtDtDeslig.Text = ""; };
                        ddlCargoFunc.SelectedValue = leitor[16].ToString();
                    }
                    else { lblError.Text = "Não há funcionários com essas informações no sistema!"; }
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
                if (gc.strCodFunc != "0")
                {
                    cnt.DataBaseConnect();
                    MySqlDataReader leitor = dtManip.ExecuteDataReader("CALL PROC_SELECT_FUNC('" + gc.strCodFunc + "', '" + txtCPF.Text.ToString() + "', '')");

                    if (leitor != null)
                    {
                        if (leitor.Read())
                        {
                            if (gc.strCodFunc == leitor[0].ToString() && txtCpfFunc.Text == leitor[1].ToString())
                            {
                                btnSendUpdate_Click();
                            }
                            else
                            {
                                lblError.Text = "";
                                lblSucess.Text = "";

                                if (ValidateComponents())
                                {
                                    var objRetorno = dtManip.ExecuteStringQuery("CALL PROC_INSERT_FUNC('" + txtCpfFunc.Text + "', '" + txtNomeFunc.Text + "', '" + txtRGFunc.Text + "', '"
                                         + (txtDtNascFunc.Text).Replace("-", "/") + "', '" + txtTelFunc.Text + "', '" + txtCelFunc.Text + "', '" + txtEnderecoFunc.Text + "', '"
                                         + txtNumEndecFunc.Text + "', '" + txtBairroFunc.Text + "', '" + txtCepFunc.Text + "', '" + txtCidadeFunc.Text + "', '"
                                         + txtUFFunc.Text + "', '" + txtEmailFunc.Text + "', '" + txtSenhaFunc.Text + "', '" + (txtDtDeslig.Text).Replace("-", "") + "', '"
                                         + ddlCargoFunc.SelectedItem.Value + "')");

                                    if (objRetorno != null)
                                    {
                                        if (objRetorno == true)
                                        {
                                            lblSucess.Text = "Funcionário cadastrado com sucesso!";
                                            lblSucess.Visible = true;
                                            ClearComponents();
                                        }
                                        else
                                        {
                                            lblError.Text = "Atenção! Funcionário não cadastrado, verifique os dados digitados!";
                                            lblError.Visible = true;
                                            ClearComponents();
                                        }
                                    }
                                }
                                else { lblError.Visible = true; }
                            }
                        }
                    }
                }
                else
                {
                    if (ValidateComponents())
                    {
                        lblError.Text = "";
                        lblSucess.Text = "";

                        var objRetorno = dtManip.ExecuteStringQuery("CALL PROC_INSERT_FUNC('" + txtCpfFunc.Text + "', '" + txtNomeFunc.Text + "', '" + txtRGFunc.Text + "', '"
                             + (txtDtNascFunc.Text).Replace("-", "/") + "', '" + txtTelFunc.Text + "', '" + txtCelFunc.Text + "', '" + txtEnderecoFunc.Text + "', '"
                             + txtNumEndecFunc.Text + "', '" + txtBairroFunc.Text + "', '" + txtCepFunc.Text + "', '" + txtCidadeFunc.Text + "', '"
                             + txtUFFunc.Text + "', '" + txtEmailFunc.Text + "', '" + txtSenhaFunc.Text + "', '" + (txtDtDeslig.Text).Replace("-", "/") + "', '"
                             + ddlCargoFunc.SelectedItem.Value + "')");

                        if (objRetorno == true)
                        {
                            lblSucess.Text = "Funcionário cadastrado com sucesso!";
                            lblSucess.Visible = true;
                            ClearComponents();
                        }
                        else
                        {
                            lblError.Text = "Atenção! Funcionário não cadastrado, verifique os dados digitados!";
                            lblError.Visible = true;
                            ClearComponents();
                        }
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

        #region Update
        protected void btnSendUpdate_Click()
        {
            try
            {
                lblError.Text = "";
                lblSucess.Text = "";

                if (ValidateComponents())
                {
                    var objRetorno = dtManip.ExecuteStringQuery("CALL PROC_UPDATE_FUNC('" + txtCpfFunc.Text + "', '" + txtNomeFunc.Text + "', '" + txtRGFunc.Text + "', '"
                         + (txtDtNascFunc.Text).Replace("-", "/") + "', '" + txtTelFunc.Text + "', '" + txtCelFunc.Text + "', '" + txtEnderecoFunc.Text + "', '"
                         + txtNumEndecFunc.Text + "', '" + txtBairroFunc.Text + "', '" + txtCepFunc.Text + "', '" + txtCidadeFunc.Text + "', '"
                         + txtUFFunc.Text + "', '" + txtEmailFunc.Text + "', '" + txtSenhaFunc.Text + "', '" + (txtDtDeslig.Text).Replace("-", "/") + "', '"
                         + ddlCargoFunc.SelectedItem.Value + "')");

                    if (objRetorno != null)
                    {
                        if (objRetorno == true)
                        {
                            lblSucess.Text = "Funcionário alterado com sucesso!";
                            lblSucess.Visible = true;
                            ClearComponents();
                        }
                        else
                        {
                            lblError.Text = "Atenção! O Funcionário não foi alterado, verifique os dados digitados!";
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

        #region Delete
        protected void btnSendDelete_Click(object sender, EventArgs e)
        {
            try
            {
                if (gc.strCodFunc != "0")
                {
                    if (ValidateComponents())
                    {
                        var objRetorno = dtManip.ExecuteStringQuery("CALL PROC_UPDATE_FUNC('" + txtCpfFunc.Text + "', '" + txtNomeFunc.Text + "', '" + txtRGFunc.Text + "', '"
                     + (txtDtNascFunc.Text).Replace("-", "/") + "', '" + txtTelFunc.Text + "', '" + txtCelFunc.Text + "', '" + txtEnderecoFunc.Text + "', '"
                     + txtNumEndecFunc.Text + "', '" + txtBairroFunc.Text + "', '" + txtCepFunc.Text + "', '" + txtCidadeFunc.Text + "', '"
                     + txtUFFunc.Text + "', '" + txtEmailFunc.Text + "', '" + txtSenhaFunc.Text + "', '" + DateTime.Now.ToString("dd/MM/yyyy") + "', '"
                     + ddlCargoFunc.SelectedItem.Value + "')");

                        if (objRetorno != null)
                        {
                            if (objRetorno == true)
                            {
                                lblSucess.Text = "Funcionário desligado com sucesso!";
                                lblSucess.Visible = true;
                                ClearComponents();
                            }
                            else
                            {
                                lblError.Text = "Atenção! O Funcionário não foi desligado, verifique os dados selecionados!";
                                lblError.Visible = true;
                                ClearComponents();
                            }
                        }
                    }
                    else { lblError.Visible = true; }
                }
                else
                {
                    lblError.Text = "Atenção! É necessário selecionar um Funcionáro.";
                    lblError.Visible = true;
                    ClearComponents();
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
            gc.strCodFunc = "0"; txtCodFunc.Enabled = true;
            txtCodFunc.Text = ""; txtNomeFunc.Text = ""; txtCpfFunc.Text = "";
            txtRGFunc.Text = ""; txtDtNascFunc.Text = ""; txtTelFunc.Text = "";
            txtCelFunc.Text = ""; txtEnderecoFunc.Text = ""; txtNumEndecFunc.Text = "";
            txtBairroFunc.Text = ""; txtCepFunc.Text = ""; txtCidadeFunc.Text = "";
            txtUFFunc.Text = ""; txtEmailFunc.Text = ""; txtSenhaFunc.Text = ""; txtDtDeslig.Text = "";
        }

        private void EnableComponents(bool value)
        {
            txtCodFunc.Enabled = false; txtNomeFunc.Enabled = value; txtCpfFunc.Enabled = value;
            txtRGFunc.Enabled = value; txtDtNascFunc.Enabled = value; txtTelFunc.Enabled = value;
            txtCelFunc.Enabled = value; txtEnderecoFunc.Enabled = value; txtNumEndecFunc.Enabled = value;
            txtBairroFunc.Enabled = value; txtCepFunc.Enabled = value; txtCidadeFunc.Enabled = value;
            txtUFFunc.Enabled = value; txtEmailFunc.Enabled = value; txtSenhaFunc.Enabled = value; txtDtDeslig.Enabled = value;
        }
        #endregion

        #region Validate
        private bool ValidateComponents()
        {
            if (txtCpfFunc.Text == "") { lblError.Text = ce.ComponentsValidation("CPF", gc.MSG_NECESSARIO); return false; }
            else if (txtNomeFunc.Text == "") { lblError.Text = ce.ComponentsValidation("Nome", gc.MSG_NECESSARIO); return false; }
            else if (txtRGFunc.Text == "") { lblError.Text = ce.ComponentsValidation("RG", gc.MSG_NECESSARIO); return false; }
            else if (txtDtNascFunc.Text == "") { lblError.Text = ce.ComponentsValidation("Data de Nascimento", gc.MSG_NECESSARIO); return false; }
            else if (txtEmailFunc.Text == "") { lblError.Text = ce.ComponentsValidation("Email", gc.MSG_NECESSARIO); return false; }
            else if (txtSenhaFunc.Text == "") { lblError.Text = ce.ComponentsValidation("Senha", gc.MSG_NECESSARIO); return false; }
            else if (ddlCargoFunc.SelectedItem.Text == "") { lblError.Text = ce.ComponentsValidation("Cargo", gc.MSG_NECESSARIO); return false; }
            else if (gc.CodFunc == 1) { lblError.Text = ce.ComponentsValidation("", gc.MSG_SEUPERFIL); return false; } //Atendente
            else if (gc.CodFunc == 2) { lblError.Text = ce.ComponentsValidation("", gc.MSG_SEUPERFIL); return false; } //Caixa
            else if (gc.CodFunc == 5) { lblError.Text = ce.ComponentsValidation("", gc.MSG_SEUPERFIL); return false; } //Treinador
            else if (gc.CodFunc == 6) { lblError.Text = ce.ComponentsValidation("", gc.MSG_SEUPERFIL); return false; } //Técnico de Qualidade         
            //3 -- Gerente de Loja
            //4 -- Gerente de Área

            return true;
        }
        #endregion

        #region SelectedIndex
        protected void gvEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClearComponents();

            gc.strCodFunc = (sender as LinkButton).CommandArgument; //Código do funcionário selecionado no grid
            if (gc.strCodFunc != "0") { btnSearchEmployee_Click(); }
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