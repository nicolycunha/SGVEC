using System;
using SGVEC.Models;
using SGVEC.Controller;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace SGVEC.View.Screen
{
    public partial class TypeProduct : System.Web.UI.Page
    {
        private Connect cnt = new Connect();
        private DataManipulation dtManip = new DataManipulation();
        private GeneralComponent gc = new GeneralComponent();
        private static string strCode = "0";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Atualiza o grid
                gvTypeProduct.DataSource = dtManip.ExecDtTableStringQuery("CALL PROC_SELECT_TYPE_PROD('" + strCode + "', '" + txtName.Text.ToString() + "')");
                gvTypeProduct.DataBind();

                if (gvTypeProduct.Rows.Count == 0) { lblError.Visible = true; lblError.Text = "Não há Tipos de Produtos com essas informações no sistema!"; }
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
            lblError.Text = "";
            lblSucess.Text = "";

            if (txtCode.Text != "") strCode = txtCode.Text;

            //Atualiza o grid
            gvTypeProduct.DataSource = dtManip.ExecDtTableStringQuery("CALL PROC_SELECT_TYPE_PROD('" + strCode + "', '" + txtName.Text.ToString() + "')");
            gvTypeProduct.DataBind();

            if (gvTypeProduct.Rows.Count == 0) { lblError.Visible = true; lblError.Text = "Não há Tipos de Produtos com essas informações no sistema!"; }
            else lblError.Visible = false;

            txtCode.Text = ""; txtName.Text = ""; strCode = "0";
        }
        #endregion

        #region Insert
        protected void btnSendSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (gc.strCodTypeProduct != "0")
                {
                    cnt.DataBaseConnect();
                    MySqlDataReader leitor = dtManip.ExecuteDataReader("SELECT * FROM TIPO_PRODUTO WHERE COD_TIPO_PROD ='" + gc.strCodTypeProduct + "'");

                    if (leitor != null)
                    {
                        if (leitor.Read())
                        {
                            if (gc.strCodTypeProduct == leitor[0].ToString())
                            {
                                btnSendUpdate_Click();
                            }
                            else
                            {
                                lblError.Text = "";
                                lblSucess.Text = "";

                                if (txtNameTpProduct.Text != "")
                                {
                                    var objRetorno = dtManip.ExecuteStringQuery("INSERT INTO TIPO_PRODUTO(NOME_TIPO_PROD) VALUES('" + txtNameTpProduct.Text.ToString() + "')");

                                    if (objRetorno != null)
                                    {
                                        if (objRetorno == true)
                                        {
                                            lblSucess.Text = "Tipo de Produto cadastrado com sucesso!";
                                            lblSucess.Visible = true;
                                            txtCodTpProduct.Text = ""; txtNameTpProduct.Text = ""; gc.strCodTypeProduct = "0";
                                        }
                                        else
                                        {
                                            lblError.Text = "Atenção! Tipo de Produto não foi cadastrado, verifique os dados digitados!";
                                            lblError.Visible = true;
                                            txtCodTpProduct.Text = ""; txtNameTpProduct.Text = ""; gc.strCodTypeProduct = "0";
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
                    if (txtNameTpProduct.Text != "")
                    {
                        lblError.Text = "";
                        lblSucess.Text = "";

                        var objRetorno = dtManip.ExecuteStringQuery("INSERT INTO TIPO_PRODUTO(NOME_TIPO_PROD) VALUES('" + txtNameTpProduct.Text.ToString() + "')");

                        if (objRetorno == true)
                        {
                            lblSucess.Text = "Tipo de Produto cadastrado com sucesso!";
                            lblSucess.Visible = true;
                            txtCodTpProduct.Text = ""; txtNameTpProduct.Text = ""; gc.strCodTypeProduct = "0";
                        }
                        else
                        {
                            lblError.Text = "Atenção! Tipo de Produto não foi cadastrado, verifique os dados digitados!";
                            lblError.Visible = true;
                            txtCodTpProduct.Text = ""; txtNameTpProduct.Text = ""; gc.strCodTypeProduct = "0";
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

                if (txtNameTpProduct.Text != "")
                {
                    var objRetorno = dtManip.ExecuteStringQuery("UPDATE TIPO_PRODUTO SET NOME_TIPO_PROD = '" + txtNameTpProduct.Text.ToString() + "' WHERE COD_TIPO_PROD = '" + gc.strCodTypeProduct + "'");

                    if (objRetorno != null)
                    {
                        if (objRetorno == true)
                        {
                            lblSucess.Text = "Tipo de Produto alterado com sucesso!";
                            lblSucess.Visible = true;
                            txtCodTpProduct.Text = ""; txtNameTpProduct.Text = ""; gc.strCodTypeProduct = "0";
                        }
                        else
                        {
                            lblError.Text = "Atenção! O Tipo de Produto não foi alterado, verifique os dados digitados!";
                            lblError.Visible = true;
                            txtCodTpProduct.Text = ""; txtNameTpProduct.Text = ""; gc.strCodTypeProduct = "0";
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
                lblError.Text = "";
                lblSucess.Text = "";

                if (gc.strCodTypeProduct != "0")
                {
                    var objRetorno = dtManip.ExecuteStringQuery("DELETE FROM TIPO_PRODUTO WHERE COD_TIPO_PROD = '" + gc.strCodTypeProduct + "'");

                    if (objRetorno != null)
                    {
                        if (objRetorno == true)
                        {
                            lblSucess.Text = "Tipo de Produto deletado com sucesso!";
                            lblSucess.Visible = true;
                            gc.strCodTypeProduct = "0";
                        }
                        else
                        {
                            lblError.Text = "Atenção! O Tipo de Produto não foi deletado, verifique os dados selecionados!";
                            lblError.Visible = true;
                            gc.strCodTypeProduct = "0";
                        }
                    }
                }
                else
                {
                    lblError.Text = "Atenção! É necessário selecionar um Tipo de Produto.";
                    lblError.Visible = true;
                    gc.strCodTypeProduct = "0";
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                lblError.Visible = true;
            }
        }
        #endregion

        #region SelectedIndex
        protected void gvTypeProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                lblError.Text = "";
                lblSucess.Text = "";
                txtCodTpProduct.Text = ""; txtNameTpProduct.Text = ""; gc.strCodTypeProduct = "0";

                gc.strCodTypeProduct = (sender as LinkButton).CommandArgument; //Código do tipo de produto selecionado no grid

                if (gc.strCodTypeProduct != "0")
                {
                    cnt.DataBaseConnect();
                    MySqlDataReader leitor = dtManip.ExecuteDataReader("SELECT * FROM TIPO_PRODUTO WHERE COD_TIPO_PROD ='" + gc.strCodTypeProduct + "'");

                    if (leitor.Read())
                    {
                        txtCodTpProduct.Text = leitor[0].ToString();
                        txtNameTpProduct.Text = leitor[1].ToString();
                    }
                    else { lblError.Text = "Não há Tipos de Produtos com essas informações no sistema!"; }
                }
                else { lblError.Text = "É necessário selecionar um Tipo de Produto!"; txtCodTpProduct.Text = ""; txtNameTpProduct.Text = ""; gc.strCodTypeProduct = "0"; }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                lblError.Visible = true;
            }
        }
        #endregion
    }
}