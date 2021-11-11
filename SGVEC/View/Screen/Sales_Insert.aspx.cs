using System;
using SGVEC.Models;
using SGVEC.Controller;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace SGVEC.View.Screen
{
    public partial class Sales_Insert : System.Web.UI.Page
    {
        private Connect cnt = new Connect();
        private ComponentError ce = new ComponentError();
        private DataManipulation dtManip = new DataManipulation();
        private GeneralComponent gc = new GeneralComponent();
        private string strCode = "0";
        private int intCodVenda = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblError.Text = "";
                lblSucess.Text = "";

                EnableComponents(false);

                //Preenche o ComboBox com os cadastros da Tabela - Funcionário
                ddlFuncSales.DataSource = dtManip.ExecDtTableStringQuery("SELECT * FROM FUNCIONARIO WHERE COD_FUNC = '" + gc.CodEmployeeLog + "'");
                ddlFuncSales.DataTextField = "NOME_FUNC";
                ddlFuncSales.DataValueField = "COD_FUNC";
                ddlFuncSales.DataBind();

                //Preenche o ComboBox com os cadastros da Tabela - Tipo de Pagamento
                ddlTipoPagSales.DataSource = dtManip.ExecDtTableStringQuery("SELECT * FROM TIPO_PAGAMENTO");
                ddlTipoPagSales.DataTextField = "NOME_TIPO_PAG";
                ddlTipoPagSales.DataValueField = "COD_TIPO_PAG";
                ddlTipoPagSales.DataBind();

                txtDtSales.Text = DateTime.Now.ToString("yyyy-MM-dd");

                cnt.DataBaseConnect();
                MySqlDataReader leitor = dtManip.ExecuteDataReader("SELECT COUNT(COD_VENDA) FROM VENDA");

                if (leitor.Read())
                {
                    intCodVenda = (Convert.ToInt32(leitor[0].ToString()) + 1);
                }

                //Atualiza o grid
                gvProducts.DataSource = dtManip.ExecDtTableStringQuery("SELECT * FROM PRODUTO_VENDA WHERE FK_COD_VENDA = '" + intCodVenda + "'");
                gvProducts.DataBind();

                if (gvProducts.Rows.Count == 0) { lblError.Visible = true; lblError.Text = "Não há produtos adicionados a esta venda atual no sistema!"; }
                else lblError.Visible = false;
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                lblError.Visible = true;
            }
        }

        #region Search Prouct
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if ((txtCodProduct.Text != "") || (txtNomeProduct.Text != "") && (txtQuantProduct.Text != ""))
                {
                    cnt = new Connect();
                    cnt.DataBaseConnect();
                    MySqlDataReader leitor = dtManip.ExecuteDataReader("SELECT * FROM PRODUTO WHERE COD_BARRAS = '" + txtCodProduct.Text + "' OR NOME_PROD = '" + txtNomeProduct.Text + "'");

                    if (leitor.Read())
                    {
                        if (Convert.ToInt32(leitor[6].ToString()) > Convert.ToInt32(txtQuantProduct.Text))
                        {
                            var objRetorno = dtManip.ExecuteStringQuery("CALL PROC_INSERT_PRODUTO_VENDA('" + txtQuantProduct.Text + "', '"
                                                                        + leitor[3].ToString().Replace(',', '.') + "', '" + leitor[0].ToString() + "', '" + intCodVenda + "')");

                            if (objRetorno == true)
                            {
                                //Atualiza o grid
                                gvProducts.DataSource = dtManip.ExecDtTableStringQuery("SELECT * FROM PRODUTO_VENDA WHERE FK_COD_VENDA = '" + intCodVenda + "'");
                                gvProducts.DataBind();

                                //atualizar quantidade de produtos após feita a inclusão  
                            }
                        }
                        else { lblError.Visible = true; lblError.Text = "Atenção! A quantidade de produtos digitada não existe no estoque!"; }
                    }
                }
                else { lblError.Visible = true; lblError.Text = "Atenção! É preciso digitar um Código de Barras ou Nome e a Quantidade de Produtos para adicionar na Venda!"; }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                lblError.Visible = true;
            }
        }
        #endregion

        #region Insert
        protected void InsertProduct()
        {
            try
            {
                lblError.Text = "";
                lblSucess.Text = "";

                if (ValidateComponents())
                {
                    //var objRetorno = dtManip.ExecuteStringQuery("CALL PROC_INSERT_SALE('" + txtCodSales.Text + "', '" + txtNomeCliSales.Text + "', '"
                    //     + txtCpfCliSales.Text + "', '" + ddlFuncSales.SelectedItem.Text + "', '"
                    //     + Convert.ToDateTime((txtDtSales.Text).Replace("-", "/")).ToString("dd/MM/yyyy") + "', '" + txtNumParcSales.Text + "', '"
                    //     + txtValParcSales.Text + "', '" + txtDescontoSales.Text + "', '" + txtTotalSales.Text + "', '" + ddlTipoPagSales.SelectedItem.Text + "')");

                    //if (objRetorno != null)
                    //{
                    //    if (objRetorno == true)
                    //    {
                    //        lblSucess.Text = "Venda registrada com sucesso!";
                    //        lblSucess.Visible = true;
                    //        ClearComponents();
                    //    }
                    //    else
                    //    {
                    //        lblError.Text = "Atenção! Venda não registrada, verifique os dados digitados!";
                    //        lblError.Visible = true;
                    //        ClearComponents();
                    //    }
                    //}
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
            txtNomeCliSales.Text = ""; txtCpfCliSales.Text = ""; txtDtSales.Text = "";
            txtNumParcSales.Text = ""; txtValParcSales.Text = ""; txtDescontoSales.Text = ""; txtTotalSales.Text = "";
        }

        private void EnableComponents(bool value)
        {
            txtNomeCliSales.Enabled = value; txtCpfCliSales.Enabled = value;
            ddlFuncSales.Enabled = value; txtDtSales.Enabled = value; txtNumParcSales.Enabled = value;
            txtValParcSales.Enabled = value; txtDescontoSales.Enabled = value; txtTotalSales.Enabled = value; ddlTipoPagSales.Enabled = value;
        }
        #endregion

        #region Validate
        private bool ValidateComponents()
        {
            if (gvProducts.Rows.Count == 0) { lblError.Text = ce.ComponentsValidation("Atenção!", "Deve-se adicionar pelo um produto na venda!"); return false; }
            else if (txtNomeCliSales.Text == "") { lblError.Text = ce.ComponentsValidation("Nome Cliente", gc.MSG_NECESSARIO); return false; }
            else if (txtCpfCliSales.Text == "") { lblError.Text = ce.ComponentsValidation("CPF Cliente", gc.MSG_NECESSARIO); return false; }
            //??? else if (txtValParcSales.Text == "") { lblError.Text = ce.ComponentsValidation("Valor Parcela", gc.MSG_NECESSARIO); return false; }
            //??? else if (txtTotalSales.Text == "") { lblError.Text = ce.ComponentsValidation("Total da Venda", gc.MSG_NECESSARIO); return false; }
            else if (gc.CodEmployee == 5) { lblError.Text = ce.ComponentsValidation("", gc.MSG_SEUPERFIL); return false; } //Treinador
            else if (gc.CodEmployee == 6) { lblError.Text = ce.ComponentsValidation("", gc.MSG_SEUPERFIL); return false; } //Técnico de Qualidade         
            //1 -- Atendente
            //2 -- Caixa
            //3 -- Gerente de Loja
            //4 -- Gerente de Área

            return true;
        }
        #endregion

        #region SelectedIndex
        protected void gvProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClearComponents();

            gc.strCodProductSales = (sender as LinkButton).CommandArgument; //Código do Produto/Venda selecionado no grid
        }
        #endregion

        #region btnInsertProd
        protected void btnSendInsertProd_Click(object sender, EventArgs e)
        {
            InsertProduct();
            ClearComponents();
        }
        #endregion
    }
}