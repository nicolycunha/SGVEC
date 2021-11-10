using System;
using SGVEC.Models;
using SGVEC.Controller;
using System.Web.UI.WebControls;

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

                if (txtCode.Text != "") strCode = txtCode.Text;

                //Atualiza o grid
                gvSales.DataSource = dtManip.ExecDtTableStringQuery("CALL PROC_SELECT_SALE('" + strCode + "', '" + txtCpfCli.Text.ToString() + "', '" + txtCpfFunc.Text.ToString() + "', '" + txtDateSales.Text.ToString() + "')");
                gvSales.DataBind();

                if (gvSales.Rows.Count == 0) { lblError.Visible = true; lblError.Text = "Não há vendas com essas informações no sistema!"; }
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
                string strDtSales = "";

                if(txtDateSales.Text != "") { strDtSales = Convert.ToDateTime((txtDateSales.Text).Replace("-", "/")).ToString("dd/MM/yyyy"); }

                gc.strCodSales = "0";

                if (txtCode.Text != "") strCode = txtCode.Text;

                //Atualiza o grid
                gvSales.DataSource = dtManip.ExecDtTableStringQuery("CALL PROC_SELECT_SALE('" + strCode + "', '" + txtCpfCli.Text.ToString() + "', '" + txtCpfFunc.Text.ToString() + "', '" + strDtSales + "')");
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

        protected void btnSearchSales_Click()
        {
            try
            {
                if (gc.strCodSales != "0")
                {
                    cnt.DataBaseConnect();
                    gvProdutos.DataSource = dtManip.ExecDtTableStringQuery("SELECT * FROM PRODUTO_VENDA WHERE FK_COD_VENDA = '" + gc.strCodSales + "'");
                    gvProdutos.DataBind();

                    if (gvProdutos.Rows.Count == 0) { lblError.Visible = true; lblError.Text = "Não há produtos registrados nessa venda no sistema!"; }
                    else lblError.Visible = false;
                }
                else { lblError.Text = "É necessário selecionar um Produto!"; }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                lblError.Visible = true;
            }
        }
        #endregion

        #region SelectedIndex
        protected void gvSales_SelectedIndexChanged(object sender, EventArgs e)
        {
            gc.strCodSales = (sender as LinkButton).CommandArgument; //Código da Venda selecionada no grid
            if (gc.strCodSales != "0") { btnSearchSales_Click(); }
        }
        #endregion
    }
}