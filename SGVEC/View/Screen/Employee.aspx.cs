using System;
using SGVEC.Models;
using SGVEC.Controller;
using MySql.Data.MySqlClient;

namespace SGVEC.View.Screen
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private Connect cnt = new Connect();
        private ComponentError ce = new ComponentError();
        private DataManipulation dtManip = new DataManipulation();
        private GeneralComponent gc = new GeneralComponent();
        private string strCode = "0";
        private readonly string MSG_NECESSARIO = "É necessário preencher o campo ";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Controle de uso do sistema por cargo
                if (gc.CodFunc == 1) //Atendente
                {
                    btnSendSearch.Enabled = false;
                    btnSendInsert.Enabled = false;
                    EnableComponents(false);
                }
                else if (gc.CodFunc == 2) //Caixa
                {
                    btnSendSearch.Enabled = false;
                    btnSendInsert.Enabled = false;
                    EnableComponents(false);
                }
                else if (gc.CodFunc == 3) //Gerente de Loja
                {
                    btnSendSearch.Enabled = true;
                    btnSendInsert.Enabled = true;
                }
                else if (gc.CodFunc == 4) //Gerente de Área
                {
                    btnSendSearch.Enabled = true;
                    btnSendInsert.Enabled = true;
                }
                else if (gc.CodFunc == 5) //Treinador
                {
                    btnSendSearch.Enabled = false;
                    btnSendInsert.Enabled = false;
                    EnableComponents(false);
                }
                else if (gc.CodFunc == 6) //Técnico de Qualidade
                {
                    btnSendSearch.Enabled = false;
                    btnSendInsert.Enabled = false;
                    EnableComponents(false);
                }

                if (txtCode.Text != "") strCode = txtCode.Text;

                //Atualiza o grid
                gvEmployee.DataSource = dtManip.ExecDtTableStringQuery("CALL PROC_SELECT_FUNC('" + strCode + "', '" + txtCPF.Text.ToString() + "', '" + txtName.Text.ToString() + "')");
                gvEmployee.DataBind();

                if (gvEmployee.Rows.Count == 0) { lblErrorTab1.Visible = true; lblErrorTab1.Text = "Não há funcionários com essas informações no sistema!"; }
                else lblErrorTab1.Visible = false;

                //Preenche o ComboBox com os cadastros da Tabela - Cargo
                ddlCargoFunc.DataSource = dtManip.ExecDtTableStringQuery("SELECT * FROM CARGO");
                ddlCargoFunc.DataTextField = "NOME_CARGO";
                ddlCargoFunc.DataValueField = "COD_CARGO";
                ddlCargoFunc.DataBind();
            }
            catch (Exception ex)
            {
                lblErrorTab1.Text = ex.Message;
                lblErrorTab1.Visible = true;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtCode.Text != "") strCode = txtCode.Text;

                //Atualiza o grid
                gvEmployee.DataSource = dtManip.ExecDtTableStringQuery("CALL PROC_SELECT_FUNC('" + strCode + "', '" + txtCPF.Text.ToString() + "', '" + txtName.Text.ToString() + "')");
                gvEmployee.DataBind();

                if (gvEmployee.Rows.Count == 0) { lblErrorTab1.Visible = true; lblErrorTab1.Text = "Não há funcionários com essas informações no sistema!"; }
                else lblErrorTab1.Visible = false;

                txtCode.Text = ""; txtCPF.Text = ""; txtName.Text = "";
            }
            catch (Exception ex)
            {
                lblErrorTab1.Text = ex.Message;
                lblErrorTab1.Visible = true;
            }
        }

        protected void btnSendSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtCodFunc.Text != "" || txtNomeFunc.Text != "" || txtCpfFunc.Text != "")
                {
                    cnt.DataBaseConnect();
                    MySqlDataReader leitor = dtManip.ExecuteDataReader("CALL PROC_SELECT_FUNC('" + txtCodFunc.Text + "', '" + txtCpfFunc.Text + "', '" + txtNomeFunc.Text + "')");

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
                        txtDtDeslig.Text = leitor[15].ToString();
                        ddlCargoFunc.SelectedValue = Convert.ToDateTime(leitor[16].ToString()).ToString("yyyy-MM-dd");

                        EnableComponents(true);
                    }
                    else { lblErrorTab2.Text = "Não há funcionários com essas informações no sistema!"; }
                }
                else lblErrorTab2.Text = "É necessário preencher os campos obrigatórios!"; ClearComponents();
            }
            catch (Exception ex)
            {
                lblErrorTab2.Text = ex.Message;
                lblErrorTab2.Visible = true;
            }
        }

        protected void btnSendInsert_Click(object sender, EventArgs e)
        {
            try
            {
                if (ValidateComponents())
                {
                    cnt.DataBaseConnect();
                    MySqlDataReader leitor = dtManip.ExecuteDataReader("CALL PROC_SELECT_FUNC('" + txtCodFunc.Text + "', '" + txtCpfFunc.Text + "', '" + txtNomeFunc.Text + "')");

                    if (leitor.Read())
                    {
                        lblErrorTab2.Text = "Já existe o Funcionário informado cadastrado no sistema!";
                        lblErrorTab2.Visible = true;
                    }
                    else
                    {
                        ValidateComponents();

                        if (lblErrorTab2.Text == "")
                        {
                            cnt.DataBaseConnect();
                            dtManip.ExecuteDataReader("CALL PROC_INSERT_FUNC('" + txtCPF.Text + "', '" + txtNomeFunc.Text + "', '" + txtRGFunc.Text + "', '"
                                 + txtDtNascFunc.Text + "', '" + txtTelFunc.Text + "', '" + txtCelFunc.Text + "', '" + txtEnderecoFunc.Text + "', '"
                                 + txtNumEndecFunc.Text + "', '" + txtBairroFunc.Text + "', '" + txtCepFunc.Text + "', '" + txtCidadeFunc.Text + "', '"
                                 + txtUFFunc.Text + "', '" + txtEmailFunc.Text + "', '" + txtSenhaFunc.Text + "', '" + txtDtDeslig.Text + "', '"
                                 + ddlCargoFunc.SelectedItem.Value + "')'");

                            lblSucess.Text = "Funcionário cadastrado com sucesso!";
                            lblSucess.Visible = true;
                        }
                    }
                }
                else
                {
                    lblErrorTab2.Visible = true;
                }
            }
            catch (Exception ex)
            {
                lblErrorTab2.Text = ex.Message;
                lblErrorTab2.Visible = true;
            }
        }

        protected void btnSendUpdate_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                lblErrorTab2.Text = ex.Message;
                lblErrorTab2.Visible = true;
            }
        }

        protected void btnSendDelete_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                lblErrorTab2.Text = ex.Message;
                lblErrorTab2.Visible = true;
            }
        }

        protected void btnClearComponents_Click(object sender, EventArgs e)
        {
            ClearComponents();
        }

        private void ClearComponents()
        {
            txtCodFunc.Enabled = true;
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
            btnSendUpdate.Enabled = value; btnSendDelete.Enabled = value; btnClearComponents.Enabled = value;
        }

        private bool ValidateComponents()
        {
            if (txtCpfFunc.Text == "") { lblErrorTab2.Text = ce.ComponentsValidation("CPF", MSG_NECESSARIO); return false; }
            else if (txtNomeFunc.Text == "") { lblErrorTab2.Text = ce.ComponentsValidation("Nome", MSG_NECESSARIO); return false; }
            else if (txtRGFunc.Text == "") { lblErrorTab2.Text = ce.ComponentsValidation("RG", MSG_NECESSARIO); return false; }
            else if (txtDtNascFunc.Text == "") { lblErrorTab2.Text = ce.ComponentsValidation("Data de Nascimento", MSG_NECESSARIO); return false; }
            else if (txtEnderecoFunc.Text == "") { lblErrorTab2.Text = ce.ComponentsValidation("Endereço", MSG_NECESSARIO); return false; }
            else if (txtNumEndecFunc.Text == "") { lblErrorTab2.Text = ce.ComponentsValidation("Número", MSG_NECESSARIO); return false; }
            else if (txtBairroFunc.Text == "") { lblErrorTab2.Text = ce.ComponentsValidation("Bairro", MSG_NECESSARIO); return false; }
            else if (txtCepFunc.Text == "") { lblErrorTab2.Text = ce.ComponentsValidation("CEP", MSG_NECESSARIO); return false; }
            else if (txtCidadeFunc.Text == "") { lblErrorTab2.Text = ce.ComponentsValidation("Cidade", MSG_NECESSARIO); return false; }
            else if (txtUFFunc.Text == "") { lblErrorTab2.Text = ce.ComponentsValidation("UF", MSG_NECESSARIO); return false; }
            else if (txtEmailFunc.Text == "") { lblErrorTab2.Text = ce.ComponentsValidation("Email", MSG_NECESSARIO); return false; }
            else if (txtSenhaFunc.Text == "") { lblErrorTab2.Text = ce.ComponentsValidation("Senha", MSG_NECESSARIO); return false; }
            else if (ddlCargoFunc.SelectedItem.Text == "") { lblErrorTab2.Text = ce.ComponentsValidation("Cargo", MSG_NECESSARIO); return false; }

            return true;
        }
    }
}