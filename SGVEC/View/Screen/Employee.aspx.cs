using System;
using SGVEC.Models;
using SGVEC.Controller;

namespace SGVEC.View.Screen
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private ComponentError cptValidate = new ComponentError();
        private DataManipulation cnt = new DataManipulation();

        protected void Page_Load(object sender, EventArgs e)
        {
            string strCode = "0";
            if (txtCode.Text != "")
            {
                strCode = txtCode.Text;
            }

            gvEmployee.DataSource = cnt.ExecuteStringQuery("CALL PROC_SELECT_FUNC('" + strCode + "', '" + txtCPF.Text.ToString() + "', '" + txtName.Text.ToString() + "')");
            gvEmployee.DataBind();
        }
    }
}