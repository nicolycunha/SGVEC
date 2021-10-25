using System;
using SGVEC.Models;
using SGVEC.Controller;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace SGVEC.View.Screen
{
    public partial class Product : System.Web.UI.Page
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
                gvProduct.DataSource = dtManip.ExecDtTableStringQuery("CALL PROC_SELECT_PROD('" + strCode + "', '" + txtName.Text.ToString() + "')");
                gvProduct.DataBind();

                if (gvProduct.Rows.Count == 0) { lblError.Visible = true; lblError.Text = "Não há produtos com essas informações no sistema!"; }
                else lblError.Visible = false;

                //Preenche o ComboBox com os cadastros da Tabela - Tipo Produto
                ddlTipoProduct.DataSource = dtManip.ExecDtTableStringQuery("SELECT * FROM TIPO_PRODUTO");
                ddlTipoProduct.DataTextField = "NOME_TIPO_PROD";
                ddlTipoProduct.DataValueField = "COD_TIPO_PROD";
                ddlTipoProduct.DataBind();

                //Preenche o ComboBox com os cadastros da Tabela - Fornecedores
                ddlFornecProduct.DataSource = dtManip.ExecDtTableStringQuery("SELECT * FROM FORNECEDORES");
                ddlFornecProduct.DataTextField = "RAZAO_SOCIAL";
                ddlFornecProduct.DataValueField = "COD_FORNEC";
                ddlFornecProduct.DataBind();
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
                gc.strCodEmployee = "0";

                if (txtCode.Text != "") strCode = txtCode.Text;

                //Atualiza o grid
                gvProduct.DataSource = dtManip.ExecDtTableStringQuery("CALL PROC_SELECT_PROD('" + strCode + "', '" + txtName.Text.ToString() + "')");
                gvProduct.DataBind();

                if (gvProduct.Rows.Count == 0) { lblError.Visible = true; lblError.Text = "Não há produtos com essas informações no sistema!"; }
                else lblError.Visible = false;

                txtCode.Text = ""; txtName.Text = "";
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
                if (gc.strCodEmployee != "0")
                {
                    cnt.DataBaseConnect();
                    MySqlDataReader leitor = dtManip.ExecuteDataReader("CALL PROC_SELECT_PROD('" + gc.strCodProduct + "', '', '')");

                    if (leitor.Read())
                    {
                        txtCodBarrasProduct.Text = leitor[0].ToString();
                        txtNomeProduct.Text = leitor[1].ToString();
                        txtMarcaProduct.Text = leitor[2].ToString();
                        txtPrecoProduct.Text = leitor[3].ToString();
                        txtCustoProduct.Text = leitor[4].ToString();
                        txtDtCadProduct.Text = leitor[5].ToString();
                        txtQuantidadeProduct.Text = leitor[6].ToString();
                        txtDescProduct.Text = leitor[7].ToString();
                        ddlTipoProduct.SelectedValue = leitor[8].ToString();
                        ddlFornecProduct.SelectedValue = leitor[8].ToString();
                    }
                    else { lblError.Text = "Não há produtos com essas informações no sistema!"; }
                }
                else { lblError.Text = "É necessário selecionar um produto!"; } //ClearComponents(); }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                lblError.Visible = true;
            }
        }
        #endregion


        #region SelectedIndex
        protected void gvProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            //ClearComponents();

            gc.strCodProduct = (sender as LinkButton).CommandArgument; //Código do produto selecionado no grid
            if (gc.strCodProduct != "0") { btnSearchEmployee_Click(); }
        }
        #endregion
    }
}