using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGVEC.View.Screen
{
    public partial class Supplier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }

        protected void btnSearchSupplier_Click()
        {

        }

        protected void btnSendInsert_Click()
        {

        }

        protected void btnSendUpdate_Click()
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

        }

        private bool ValidateComponents()
        {
            return true;
        }

        protected void gvSupplier_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnSendSave_Click(object sender, EventArgs e)
        {
            btnSendInsert_Click();
            ClearComponents();
        }
    }
}