using System;
using SGVEC.Models;
using SGVEC.Controller;
using MySql.Data.MySqlClient;

namespace SGVEC.View.Screen
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private Connect cnt = new Connect();
        private ComponentError cptValidate = new ComponentError();
        private DataManipulation dtManip = new DataManipulation();
        private GeneralComponent gc = new GeneralComponent();
        private string strCode = "0";

        protected void Page_Load(object sender, EventArgs e)
        {
            ddlCargoFunc = new System.Web.UI.WebControls.DropDownList();            

            if (txtCode.Text != "") strCode = txtCode.Text;

            //Atualiza o grid
            gvEmployee.DataSource = dtManip.ExecDtTableStringQuery("CALL PROC_SELECT_FUNC('" + strCode + "', '" + txtCPF.Text.ToString() + "', '" + txtName.Text.ToString() + "')");
            gvEmployee.DataBind();

            if (gvEmployee.Rows.Count == 0) lblError.Visible = true; else lblError.Visible = false;

            //Preenche o ComboBox com os cadastros da Tabela - Cargo
            ddlCargoFunc.DataMember = "NOME_CARGO";
            ddlCargoFunc.DataSource = dtManip.ExecDtTableStringQuery("SELECT * FROM CARGO");
            ddlCargoFunc.DataBind();

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtCode.Text != "") strCode = txtCode.Text;

            //Atualiza o grid
            gvEmployee.DataSource = dtManip.ExecDtTableStringQuery("CALL PROC_SELECT_FUNC('" + strCode + "', '" + txtCPF.Text.ToString() + "', '" + txtName.Text.ToString() + "')");
            gvEmployee.DataBind();

            if (gvEmployee.Rows.Count == 0) lblError.Visible = true; else lblError.Visible = false;

            txtCode.Text = ""; txtCPF.Text = ""; txtName.Text = "";
        }

        protected void btnSendSearch_Click(object sender, EventArgs e)
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
                    txtDtNascFunc.Text = Convert.ToDateTime(leitor[4].ToString()).ToString("dd/MM/aaa");
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
                    ddlCargoFunc.DataValueField = leitor[16].ToString();

                    EnableComponents(true);
                }
            } else ClearComponents();
        }

        protected void btnSendInsert_Click(object sender, EventArgs e)
        {

        }

        protected void btnSendUpdate_Click(object sender, EventArgs e)
        {

        }

        protected void btnSendDelete_Click(object sender, EventArgs e)
        {

        }

        protected void btnClearComponents_Click(object sender, EventArgs e)
        {           
            ClearComponents();
        }

        private void ClearComponents()
        {            
            txtCodFunc.Text = ""; txtNomeFunc.Text = ""; txtCpfFunc.Text = "";
            txtRGFunc.Text = ""; txtDtNascFunc.Text = ""; txtTelFunc.Text = "";
            txtCelFunc.Text = ""; txtEnderecoFunc.Text = ""; txtNumEndecFunc.Text = "";
            txtBairroFunc.Text = ""; txtCepFunc.Text = ""; txtCidadeFunc.Text = "";
            txtUFFunc.Text = ""; txtEmailFunc.Text = ""; txtSenhaFunc.Text = ""; txtDtDeslig.Text = ""; 
        }

        private void EnableComponents(bool value)
        {
            txtCodFunc.Enabled = value; txtNomeFunc.Enabled = value; txtCpfFunc.Enabled = value;
            txtRGFunc.Enabled = value; txtDtNascFunc.Enabled = value; txtTelFunc.Enabled = value;
            txtCelFunc.Enabled = value; txtEnderecoFunc.Enabled = value; txtNumEndecFunc.Enabled = value;
            txtBairroFunc.Enabled = value; txtCepFunc.Enabled = value; txtCidadeFunc.Enabled = value;
            txtUFFunc.Enabled = value; txtEmailFunc.Enabled = value; txtSenhaFunc.Enabled = value; txtDtDeslig.Enabled = value;
            btnSendUpdate.Enabled = value; btnSendDelete.Enabled = value;
        }
    }
}