using System;
using SGVEC.Models;
using SGVEC.Controller;

namespace SGVEC.View.Screen
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private ComponentError cptValidate = new ComponentError();
        private DataManipulation cnt = new DataManipulation();
        private string strCode = "0";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (txtCode.Text != "")
            {
                strCode = txtCode.Text;
            }

            //Atualiza o grid
            gvEmployee.DataSource = cnt.ExecDtTableStringQuery("CALL PROC_SELECT_FUNC('" + strCode + "', '" + txtCPF.Text.ToString() + "', '" + txtName.Text.ToString() + "')");
            gvEmployee.DataBind();

            if (gvEmployee.Rows.Count == 0)
            {
                lblError.Visible = true;
            }
            else
            {
                lblError.Visible = false;
            }

            //Preenche o ComboBox com os cadastros da Tabela - Cargo
            ddlSearchCargoFunc.DataSource = cnt.ExecuteStringQuery("SELECT * FROM CARGO");
            ddlSearchCargoFunc.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtCode.Text != "")
            {
                strCode = txtCode.Text;
            }

            //Atualiza o grid
            gvEmployee.DataSource = cnt.ExecDtTableStringQuery("CALL PROC_SELECT_FUNC('" + strCode + "', '" + txtCPF.Text.ToString() + "', '" + txtName.Text.ToString() + "')");
            gvEmployee.DataBind();

            if (gvEmployee.Rows.Count == 0)
            {
                lblError.Visible = true;
            }
            else
            {
                lblError.Visible = false;
            }
        }

        protected void btnSendSearch_Click(object sender, EventArgs e)
        {
            
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
    }
}