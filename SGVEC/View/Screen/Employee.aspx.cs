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
                //ddlCargoFunc = new System.Web.UI.WebControls.DropDownList();

                if (txtCode.Text != "") strCode = txtCode.Text;

                //Atualiza o grid
                gvEmployee.DataSource = dtManip.ExecDtTableStringQuery("CALL PROC_SELECT_FUNC('" + strCode + "', '" + txtCPF.Text.ToString() + "', '" + txtName.Text.ToString() + "')");
                gvEmployee.DataBind();

                if (gvEmployee.Rows.Count == 0) lblError.Visible = true; else lblError.Visible = false;

                //Preenche o ComboBox com os cadastros da Tabela - Cargo
                ddlCargoFunc.DataSource = dtManip.ExecDtTableStringQuery("SELECT * FROM CARGO");
                ddlCargoFunc.DataTextField = "NOME_CARGO";
                ddlCargoFunc.DataValueField = "COD_CARGO";
                ddlCargoFunc.DataBind();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
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

                if (gvEmployee.Rows.Count == 0) lblError.Visible = true; else lblError.Visible = false;

                txtCode.Text = ""; txtCPF.Text = ""; txtName.Text = "";
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
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
                }
                else ClearComponents();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnSendInsert_Click(object sender, EventArgs e)
        {
            try
            {
                ValidateComponents();

                cnt.DataBaseConnect();
                MySqlDataReader leitor = dtManip.ExecuteDataReader("CALL PROC_SELECT_FUNC('" + txtCodFunc.Text + "', '" + txtCpfFunc.Text + "', '" + txtNomeFunc.Text + "')");

                if (leitor.Read())
                {
                    lblError.Text = "Já existe o Funcionário informado cadastrado no sistema!";
                }
                else
                {
                    ValidateComponents();

                    if (lblError.Text == "")
                    {
                        cnt.DataBaseConnect();
                        dtManip.ExecuteDataReader("CALL PROC_INSERT_FUNC('" + txtCPF.Text + "', '" + txtNomeFunc.Text + "', '" + txtRGFunc.Text + "', '"
                             + txtDtNascFunc.Text + "', '" + txtTelFunc.Text + "', '" + txtCelFunc.Text + "', '" + txtEnderecoFunc.Text + "', '"
                             + txtNumEndecFunc.Text + "', '" + txtBairroFunc.Text + "', '" + txtCepFunc.Text + "', '" + txtCidadeFunc.Text + "', '"
                             + txtUFFunc.Text + "', '" + txtEmailFunc.Text + "', '" + txtSenhaFunc.Text + "', '" + txtDtDeslig.Text + "', '"
                             + ddlCargoFunc.SelectedItem.Value + "')'");

                        //lblSucess.Text = "Funcionário cadastrado com sucesso!";
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnSendUpdate_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnSendDelete_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
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
            btnSendUpdate.Enabled = value; btnSendDelete.Enabled = value;
        }

        private bool ValidateComponents()
        {
            if (txtCpfFunc.Text == "") { lblError.Text = ce.ComponentsValidation("CPF", MSG_NECESSARIO); return false; }
            else if (txtNomeFunc.Text == "") { lblError.Text = ce.ComponentsValidation("Nome", MSG_NECESSARIO); return false; }
            else if (txtRGFunc.Text == "") { lblError.Text = ce.ComponentsValidation("RG", MSG_NECESSARIO); return false; }
            else if (txtDtNascFunc.Text == "") { lblError.Text = ce.ComponentsValidation("Data de Nascimento", MSG_NECESSARIO); return false; }
            else if (txtEnderecoFunc.Text == "") { lblError.Text = ce.ComponentsValidation("Endereço", MSG_NECESSARIO); return false; }
            else if (txtNumEndecFunc.Text == "") { lblError.Text = ce.ComponentsValidation("Número", MSG_NECESSARIO); return false; }
            else if (txtBairroFunc.Text == "") { lblError.Text = ce.ComponentsValidation("Bairro", MSG_NECESSARIO); return false; }
            else if (txtCepFunc.Text == "") { lblError.Text = ce.ComponentsValidation("CEP", MSG_NECESSARIO); return false; }
            else if (txtCidadeFunc.Text == "") { lblError.Text = ce.ComponentsValidation("Cidade", MSG_NECESSARIO); return false; }
            else if (txtUFFunc.Text == "") { lblError.Text = ce.ComponentsValidation("UF", MSG_NECESSARIO); return false; }
            else if (txtEmailFunc.Text == "") { lblError.Text = ce.ComponentsValidation("Email", MSG_NECESSARIO); return false; }
            else if (txtSenhaFunc.Text == "") { lblError.Text = ce.ComponentsValidation("Senha", MSG_NECESSARIO); return false; }
            else if (ddlCargoFunc.SelectedItem.Text == "") { lblError.Text = ce.ComponentsValidation("Cargo", MSG_NECESSARIO); return false; }

            return true;
        }
    }
}